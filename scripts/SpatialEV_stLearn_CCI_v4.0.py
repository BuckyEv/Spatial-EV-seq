# ============================================================
# Spatial-EV-seq code release
# Program: SpatialEV_stLearn_CCI_v4.0.py
# Version: v4.0
# Release date: 2026-05-05
# Copyright (c) 2026 BuckyEv. All rights reserved.
# Contact: james.bayern@icloud.com
# ============================================================
## https://stlearn.readthedocs.io/en/latest/tutorials/stLearn-CCI.html


import argparse
import os
import shutil
import stlearn as st
import scanpy as sc
import numpy as np
if not hasattr(np, "int"):
    np.int = int

import pandas as pd
import matplotlib.pyplot as plt
import pickle

parser = argparse.ArgumentParser()
parser.add_argument('--ST', required=True, help='ST data path, including the spatial folder and filtered_feature_bc_matrix.h5 file')
parser.add_argument('--prefix', default='program', help='the prefix of output file, default=program')
parser.add_argument('--species', required=True, choices=['human','mouse'], help='species, either human or mouse')
parser.add_argument('--adata', default=None, help='AnnData object with cell types or clusters in obs, .h5ad file, default=None')
parser.add_argument('--celltype', default=None, help='colname of AnnData obs, used for cell types or clusters, default=None')
parser.add_argument('--deconvolution', default=None, help='deconvolution csv file of cell2location, default=None')
parser.add_argument('--multicelltypes', default=False, help='if spots contain multiple celltypes, default=False')
parser.add_argument('--distance', default=None, help='distance determine the number of neighbors, default=None', type=int)
parser.add_argument('--min_spots_for_run', default=20, help='the min_spots parameter for function `run`, default=20', type=int)
parser.add_argument('--min_spots_for_run_cci', default=3, help='the min_spots parameter for function `run_cci`, default=3', type=int)
parser.add_argument('--ntop', default=50, help='The first few items of data, default=50', type=int)
parser.add_argument('--n_pairs', default=100, help='Number of LR pairs sampled in st.tl.cci.run, default=100', type=int)
parser.add_argument('--n_perms', default=100, help='Number of permutations in st.tl.cci.run_cci, default=100', type=int)
parser.add_argument('--subset', default=None, help="cell types or clusters used to analysis, separated by commas, default=None")
parser.add_argument('--outdir', default='.', help='outdir of result, default=.')
parser.add_argument('--save', action='store_true', help='saving cache files')
args = parser.parse_args()


def make_dir(outdir):
    os.makedirs(outdir, exist_ok=True)
    if os.path.exists('./tiling'):
        shutil.rmtree('./tiling')
    if os.path.exists(outdir+'/stLearn_CCI'):
        shutil.rmtree(outdir+'/stLearn_CCI')
    os.mkdir(outdir+'/stLearn_CCI')


def preProcessing(ST, prefix, outdir, adata, celltype, deconvolution, subset):
    data = st.Read10X(ST)
    data.var_names_make_unique()
    st.pp.filter_genes(data, min_cells=3)
    st.pp.normalize_total(data)

    if (adata is not None) and (celltype is not None):
        data_ = sc.read_h5ad(adata)
        data.obs['clusters'] = data_.obs.loc[data.obs.index][celltype].values
        if subset!=None:
            data = data[data.obs['clusters'].isin(subset.split(','))]
    elif deconvolution is not None:
        spot_mixtures = pd.read_csv(deconvolution, header=0, index_col=0)
        labels = spot_mixtures.idxmax(axis=1) 
        spot_mixtures.columns = [col.replace('q05cell_abundance_w_sf_', '') for col in spot_mixtures]

        data.obs['clusters'] = labels # Adding the dominant cell type labels per spot
        data.obs['clusters'] = data.obs['clusters'].astype('category')
        data.uns['clusters'] = spot_mixtures # Adding the cell type scores
    else:
        data_ = data.copy()
        st.pp.log1p(data_)
        st.pp.scale(data_)
        st.em.run_pca(data_)
        st.pp.tiling(data_)
        st.pp.extract_feature(data_)
        st.spatial.morphology.adjust(data_)
        st.pp.neighbors(data_, n_neighbors=10, use_rep='X_pca_morphology')
        st.tl.clustering.louvain(data_)
        data.obs['clusters'] = data_.obs['louvain'].values.astype('str')

    return data

def run_stLearn(data, prefix, outdir, species, distance, min_spots_for_run, min_spots_for_run_cci, multicelltypes, n_pairs, n_perms):
    
    lrs = st.tl.cci.load_lrs(['connectomeDB2020_lit'], species=species)
    
    
    st.tl.cci.run(data, lrs, min_spots=min_spots_for_run, distance=distance, n_pairs=n_pairs, n_cpus=8)
    st.tl.cci.adj_pvals(data, correct_axis='spot', pval_adj_cutoff=0.3, adj_method='fdr_bh')
    print('run_stLearn', data.obs['clusters'])
    

    #import pdb
    #pdb.set_trace()
    
    
    st.tl.cci.run_cci(data, 'clusters', min_spots=min_spots_for_run_cci, spot_mixtures=multicelltypes, sig_spots=True, n_perms=n_perms, n_cpus=10)
    print('per_lr_cci_clusters', data.uns['per_lr_cci_clusters'].keys())


def save_Results(data, ntop, prefix, outdir):
    lr_info = data.uns['lr_summary']
    lr_info = lr_info[['n_spots','n_spots_sig','n_spots_sig_pval']]
    lr_info.to_csv(outdir+'/stLearn_CCI/'+prefix+'_lr_sig_summary.csv')
    
    top_lrs = data.uns['lr_summary'].index.values[:ntop]
    for lr in top_lrs:
        os.mkdir(outdir+'/stLearn_CCI/'+lr)

    plt.figure()
    st.pl.lr_summary(data, n_top=ntop, color='orange', show=False)
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_siglr.png', bbox_inches='tight')

    for lr in top_lrs:
        st.pl.lr_result_plot(data, use_result='lr_scores', use_lr=lr, image_alpha=0.8, size=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_lrscores.png')
        st.pl.lr_result_plot(data, use_result='lr_scores', use_lr=lr, image_alpha=0.8, size=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_lrscores.pdf')
        
        st.pl.lr_result_plot(data, use_result='-log10(p_adjs)', use_lr=lr, image_alpha=0.8, size=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_log10padjs.png')
        st.pl.lr_result_plot(data, use_result='-log10(p_adjs)', use_lr=lr, image_alpha=0.8, size=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_log10padjs.pdf')

    for lr in top_lrs:
        st.pl.lr_plot(data, lr, outer_mode='binary', sig_spots=False, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_all_spots_binary.png')
        st.pl.lr_plot(data, lr, outer_mode='binary', sig_spots=False, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_all_spots_binary.pdf')
        
#         st.pl.lr_plot(data, lr, outer_mode='continuous', sig_spots=False, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_all_spots_continuous.png')
#         st.pl.lr_plot(data, lr, outer_mode='continuous', sig_spots=False, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_all_spots_continuous.pdf')
        
        st.pl.lr_plot(data, lr, outer_mode='binary', sig_spots=True, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_sig_spots_binary.png')
        st.pl.lr_plot(data, lr, outer_mode='binary', sig_spots=True, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_sig_spots_binary.pdf')
        
        st.pl.lr_plot(data, lr, outer_mode='continuous', sig_spots=True, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_sig_spots_continuous.png')
        st.pl.lr_plot(data, lr, outer_mode='continuous', sig_spots=True, image_alpha=0.8, pt_scale=10, fname=outdir+'/stLearn_CCI/'+lr+'/'+lr+'_sig_spots_continuous.pdf')


    plt.figure()
    st.pl.lr_chord_plot(data, 'clusters', show=False)
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_chord.png', bbox_inches='tight')
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_chord.pdf', bbox_inches='tight')

    for lr in top_lrs:
        if lr not in data.uns['per_lr_cci_clusters']:
            print(f"lr_chord_plot Warning: LR '{lr}' not found in per_lr_cci_clusters. Skipping.")
            continue
        plt.figure()
        st.pl.lr_chord_plot(data, 'clusters', lr, show=False)
        plt.savefig(outdir+'/stLearn_CCI/'+lr+'/'+lr+'_cci_chord.png', bbox_inches='tight')
        plt.savefig(outdir+'/stLearn_CCI/'+lr+'/'+lr+'_cci_chord.pdf', bbox_inches='tight')

    plt.figure()
    st.pl.lr_cci_map(data, 'clusters', show=False)
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_lr_bubble.png', bbox_inches='tight')
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_lr_bubble.pdf', bbox_inches='tight')

    plt.figure()
    st.pl.cci_map(data, 'clusters', show=False)
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_bubble.png', bbox_inches='tight')
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_bubble.pdf', bbox_inches='tight')

    for lr in top_lrs:
        if lr not in data.uns['per_lr_cci_clusters']:
            print(f"cci_map Warning: LR '{lr}' not found in per_lr_cci_clusters. Skipping.")
            continue
        plt.figure()
        st.pl.cci_map(data, 'clusters', lr, show=False)
        plt.savefig(outdir+'/stLearn_CCI/'+lr+'/'+lr+'_cci_bubble.png', bbox_inches='tight')
        plt.savefig(outdir+'/stLearn_CCI/'+lr+'/'+lr+'_cci_bubble.pdf', bbox_inches='tight')

    plt.figure()
    pos = st.pl.ccinet_plot(data, 'clusters', return_pos=True)
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_net.png', bbox_inches='tight')
    plt.savefig(outdir+'/stLearn_CCI/'+prefix+'_cci_net.pdf', bbox_inches='tight')

    for lr in top_lrs:
        if lr not in data.uns['per_lr_cci_clusters']:
            print(f"ccinet_plot Warning: LR '{lr}' not found in per_lr_cci_clusters. Skipping.")
            continue
        plt.figure()
        st.pl.ccinet_plot(data, 'clusters', lr, pos=pos)
        plt.savefig(outdir+'/stLearn_CCI/'+lr+'/'+lr+'_cci_net.png', bbox_inches='tight')
        plt.savefig(outdir+'/stLearn_CCI/'+lr+'/'+lr+'_cci_net.pdf', bbox_inches='tight')

    if os.path.exists('./tiling'):
        shutil.rmtree('./tiling')
    
def main():    
    make_dir(args.outdir)
    
    data_file = f'{args.outdir}/{args.prefix}_data.data'
    if args.save and os.path.exists(data_file):
        with open(data_file, 'rb') as f:
            data = pickle.load(f)
    else:
        data = preProcessing(args.ST, args.prefix, args.outdir, args.adata, args.celltype, args.deconvolution, args.subset)
        run_stLearn(data, args.prefix, args.outdir, args.species, args.distance, args.min_spots_for_run, args.min_spots_for_run_cci, args.multicelltypes, args.n_pairs, args.n_perms)
        if args.save:
            with open(data_file, 'wb') as f:
                pickle.dump(data, f)

    save_Results(data, args.ntop, args.prefix, args.outdir)    

if __name__ == '__main__':
    main()
