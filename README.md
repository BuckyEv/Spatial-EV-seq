# Spatial-EV-seq

Extracellular vesicles (EVs) have emerged as promising biomarkers for monitoring both physiological homeostasis and pathological progression. However, current analytic methods face limitations in preserving spatial information about EVs and their intricate connections to parental and recipient cells. Here, we present Spatial-EV-seq, a method for in situ spatial profiling of EVs within their native microenvironmental context. Spatial-EV-seq uses an antibody-engineered capture interface to preserve EVs’ spatial distribution, followed by rolling circle amplification with EV surface–binding aptamers for fluorescence imaging of individual EVs. The method integrates ultra-sensitive EV profiling, molecular subtyping, and high-resolution spatial mapping with transcriptomics to resolve location-specific EV-cell communication networks. In an anti-PD-1 treated breast cancer mouse model, we uncover a spatially orchestrated immunosuppressive axis: PD-L1+ EV-enriched zones drive CD8+ T cell dysfunction, establishing immune-privileged niches, whereas PD-L1+ EV-depleted regions preserve immunocompetence and therapeutic sensitivity. Spatial-EV-seq offers insights into EV-mediated mechanisms and unlocks avenues for precision diagnostics and therapeutics.

# This work

Spatial-EV-seq provides a computational toolkit for matching **in situ sequencing / fluorescence signal maps** with **spatial transcriptomics** measurements from adjacent tissue sections, and for performing downstream spatial EV-associated analyses. The central task addressed by this repository is spatial co-registration: decoded in situ signals, EV/protein fluorescence signals, H&E images, DAPI images, spot coordinates, and transcriptomic profiles are brought into a shared coordinate system so that spatial molecular patterns can be compared at tissue, spot, and cell-neighborhood levels.

## Overview

The code base contains three major components:

1. **Spatial registration of adjacent sections**: `SpatialEV_affine_registration_v1.0.pyz` registers a spatial transcriptomics image/spot coordinate system to an in situ sequencing or EV/protein fluorescence image. The registration uses a three-point affine transform, preferably supported by H&E and DAPI/fluorescence images from neighboring sections. The GUI supports manual point editing, automatic feature-point detection, overlay visualization, tabular inspection, and export of matched data.
2. **In situ signal decoding and fluorescence matching**: `SpatialEV_DynamicISS_IRIS_v1.0.sh` provides the DynamicISS command used for IRIS-based decoding of in situ sequencing images. `SpatialEV_fluorescence_correlation_v1.4.pyz` performs image-to-image registration and fluorescence-signal correlation between two fluorescence channels or sections.
3. **Downstream spatial analysis**: `SpatialEV_stLearn_CCI_v4.0.py`, `SpatialEV_CCI_batch_automation_v2.0.sh`, and `SpatialEV_gene_EV_significance_v5.5.R` support cell-cell interaction analysis, EV/gene co-visualization, region-based comparisons, violin summaries, and differential expression analysis after spatial matching.

The repository is designed for datasets in which molecular signals from adjacent sections need to be connected: for example, EV/protein fluorescence or ISS-derived target-gene/protein signals can be projected onto a spatial transcriptomics coordinate frame, and then interpreted together with spot-level transcriptomes and deconvolution-derived cell-type abundance.

## Repository structure

```text
Spatial-EV-seq/
├── README.md
├── docs/
│   └── VERSION_MAP.md
└── scripts/
    ├── SpatialEV_affine_registration_v1.0.pyz
    ├── SpatialEV_fluorescence_correlation_v1.4.pyz
    ├── SpatialEV_DynamicISS_IRIS_v1.0.sh
    ├── SpatialEV_stLearn_CCI_v4.0.py
    ├── SpatialEV_CCI_batch_automation_v2.0.sh
    ├── SpatialEV_gene_EV_significance_v5.5.R
    └── SpatialEV_tif_lossless_compression_v1.0.py
```

## Installation

Clone the repository and enter the project directory:

```bash
git clone https://github.com/BuckyEv/Spatial-EV-seq.git
cd Spatial-EV-seq
```

Create a Python environment. The GUI tools require either PyQt5 or PySide6, and the analysis scripts require common scientific Python packages:

```bash
conda create -n spatial_ev python=3.9 -y
conda activate spatial_ev
pip install numpy pandas scipy matplotlib opencv-python tifffile scikit-image shapely seaborn openpyxl zarr tqdm scanpy stlearn
# choose one Qt backend if it is not already available
pip install PySide6
```

For the R analysis module, install the R packages used by `SpatialEV_gene_EV_significance_v5.5.R`:

```r
install.packages(c(
  "Matrix", "readr", "dplyr", "tibble", "stringr", "tidyr",
  "ggplot2", "ggsignif", "Seurat", "cowplot", "scales", "viridis",
  "jsonlite", "png", "jpeg", "RANN"
))

# DESeq2 is a Bioconductor package.
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("DESeq2")
```

(DynamicISS is not bundled in this repository. Install DynamicISS separately and update the local path in `SpatialEV_DynamicISS_IRIS_v1.0.sh`.)
(https://github.com/DynamicBiosystems/DynamicISS)

## Input data

The typical input data include:

- Spatial transcriptomics output, such as a 10x Visium-style `filtered_feature_bc_matrix.h5` file and the corresponding `spatial/` folder.
- Spot coordinate file, such as `tissue_positions_list.csv` or a compatible coordinate table.
- H&E or low-resolution spatial image used as the spatial reference.
- In situ sequencing / fluorescence image, preferably with DAPI or another morphology-rich channel to improve registration.
- DynamicISS decoded output, such as `Basecalling.csv` or a compatible table containing decoded feature identity and spatial coordinates.
- Optional cell-type annotation or deconvolution table, for example `*_celltype_abundance.csv`.
- Optional EV/gene signal tables generated after matching, such as `*_bas_cell_barcode.csv` or `gene_expression_extremes.csv`.

## Core modules

### 1. Spatial transcriptomics and in situ signal registration

`SpatialEV_affine_registration_v1.0.pyz` is the core registration program. It aligns a spatial transcriptomics coordinate frame to an in situ sequencing or fluorescence coordinate frame using a three-point affine transform.

The program accepts a configuration JSON file as an optional command-line argument:

```bash
python scripts/SpatialEV_affine_registration_v1.0.pyz path/to/registration_config.json
```

If no configuration file is provided, the GUI starts with default paths that can be edited interactively.

Main concepts and parameters:

- `raw_filename`: spatial reference image, such as H&E, aligned fiducial image, or a low-resolution tissue image.
- `raw_data_filename`: spatial coordinate table, such as `tissue_positions_list.csv`.
- `raw_celltype_filename`: optional cell-type annotation table used for checking or exporting annotated matched results.
- `raw_ext_filename`: optional feature table for special markers or targeted signals.
- `align_filename`: in situ sequencing / EV fluorescence image to be aligned to the spatial reference.
- `align_data_filename`: decoded in situ signal table, such as `Basecalling.csv`.
- `auto_save_points`: number of automatically detected candidate points retained for manual refinement; the affine transform uses the first three point pairs.
- `raw_if_not` / `align_if_not`: image inversion switches used when the background intensity affects feature detection.
- `raw_max_area` / `align_max_area`: contour-retention controls for automatic feature detection.

Outputs commonly include:

- `bas_cell.csv`: matched spatial-to-in situ table.
- `bas_cell_rate.csv`: summary/statistical output for matched signals.
- `bas_cell.jpeg`: scatter or registration visualization.
- Exported `.csv` / `.xlsx` tables from the GUI data grid.

The GUI supports zooming, point dragging, multi-selection, keyboard-based point refinement, tabular filtering, sorting, summary statistics, and export. In practice, the automatic point detection provides an initial registration proposal, while manual adjustment is used to ensure that tissue morphology and signal positions agree across adjacent sections.

### 2. In situ sequencing decoding with DynamicISS

`SpatialEV_DynamicISS_IRIS_v1.0.sh` records the DynamicISS command used for IRIS-based decoding:

```bash
bash scripts/SpatialEV_DynamicISS_IRIS_v1.0.sh
```

Before running, edit the local paths to the DynamicISS executable, raw image directory, barcode table, sample name, and output directory. The provided command uses SIFT-based image registration and `--decode-method=IRIS`.

Key parameters:

- `-I`: raw ISS image directory.
- `-b`: imaging or sequencing cycle setting.
- `-r`: reference cycle used for image registration.
- `-s`: split/tile size as interpreted by the installed DynamicISS version.
- `-m SIFT`: SIFT-based registration mode.
- `--barcode`: barcode-to-gene mapping table.
- `--sample`: sample name.
- `--cores`: number of CPU cores.
- `--decode-method=IRIS`: decoder used for signal calling.
- `--output`: output directory.

The downstream registration module expects a decoded signal table compatible with `Basecalling.csv`.

### 3. Fluorescence-to-fluorescence registration and signal correlation

`SpatialEV_fluorescence_correlation_v1.4.pyz` aligns two fluorescence images and quantifies signal overlap/correlation after registration.

```bash
python scripts/SpatialEV_fluorescence_correlation_v1.4.pyz path/to/fluorescence_config.json
```

Important parameters exposed in the GUI include:

- `ref_filename`: reference fluorescence image.
- `align_filename`: comparison image to be registered.
- `ref_threshold` / `align_threshold`: intensity thresholds used for signal-point detection.
- `ref_min_area` / `align_min_area`: minimum signal-point area.
- `small_max_size`: down-sampling size used for efficient display and registration.
- `clip_method`: image-size correction mode, such as `top-left` or `center`.
- `output_only_self`: if enabled, only user-selected regions are exported/analyzed.

Typical outputs include a registered image (`align.tif`), gray-scale/cached intermediate images, matched signal tables, and `output.pdf` containing visual summaries of the fluorescence overlap and signal distribution.

### 4. stLearn-based cell-cell interaction analysis

`SpatialEV_stLearn_CCI_v4.0.py` is a customized stLearn wrapper for spatial cell-cell interaction analysis. It supports direct spatial transcriptomics input, optional AnnData-based cluster labels, or deconvolution-derived cell-type abundance.

Example:

```bash
python scripts/SpatialEV_stLearn_CCI_v4.0.py   --ST /path/to/sample_or_subset   --species human   --deconvolution /path/to/Integration_celltype_abundance.csv   --multicelltypes True   --distance 50   --min_spots_for_run 3   --min_spots_for_run_cci 2   --n_pairs 200   --n_perms 20   --ntop 50   --outdir /path/to/output
```

Key parameters:

- `--ST`: spatial transcriptomics folder containing `filtered_feature_bc_matrix.h5` and `spatial/`.
- `--species`: `human` or `mouse`.
- `--adata` and `--celltype`: optional `.h5ad` and `obs` column used for cell-type or cluster labels.
- `--deconvolution`: cell-type abundance table, such as a cell2location-style output.
- `--multicelltypes`: whether spot mixtures should be used for cell-type-aware CCI.
- `--distance`: spatial neighborhood distance used by stLearn CCI.
- `--min_spots_for_run`: minimum spot number for ligand-receptor scoring.
- `--min_spots_for_run_cci`: minimum spot number for CCI testing.
- `--n_pairs`: number of ligand-receptor pairs sampled in the stLearn CCI run.
- `--n_perms`: number of permutations used for CCI significance testing.
- `--ntop`: number of top ligand-receptor pairs exported as individual plots.
- `--save`: cache preprocessed data for faster plotting or parameter adjustment.

Outputs are written to `stLearn_CCI/` under `--outdir` and include ligand-receptor summary tables, spatial LR score plots, adjusted-p-value maps, chord plots, bubble plots, and CCI network plots.

### 5. Batch CCI automation from gene-expression extremes

`SpatialEV_CCI_batch_automation_v2.0.sh` automates CCI analysis over genes listed in `gene_expression_extremes.csv`. For each gene, it creates top and bottom spot subsets, copies the corresponding `spatial/` folder, and generates/runs stLearn CCI commands for each subset.

```bash
bash scripts/SpatialEV_CCI_batch_automation_v2.0.sh
```

Before running, edit:

- `root_dir`: project directory containing the spatial transcriptomics inputs and `gene_expression_extremes.csv`.
- `select_script`: path to `select_10x_h5.py`.

(The main purpose of select_10x_h5.py is to filter the corresponding h5 file data based on the analysis requirements.)

### 6. Gene-EV significance and co-visualization analysis

`SpatialEV_gene_EV_significance_v5.5.R` provides downstream gene/EV spatial analysis after registration. It supports staged execution and caching so that large spatial objects and rendered figures do not need to be rebuilt each time.

Run after editing the parameter block at the top of the script:

```bash
Rscript scripts/SpatialEV_gene_EV_significance_v5.5.R
```

Important parameter groups:

- `INPUT_BASE_DIR` / `OUTPUT_BASE_DIR`: input and output roots.
- `RUN_CLUSTER_ANALYSIS`, `RUN_SUBCLUSTER_ANALYSIS`, `RUN_OVERALL_ANALYSIS`: high-level module switches.
- `STEP_BUILD_GENE_COUNT`, `STEP_BUILD_SEURAT`, `STEP_PREPARE_SPATIAL`: staged preprocessing switches.
- `STEP_RUN_OVERALL_PDFS`, `STEP_RUN_OVERALL_COVIS`, `STEP_RUN_OVERALL_EVREGION`: visualization and EV-region modules.
- `OVERALL_GENES`, `CLUSTER_GENES`, `PLOT_GENES`: marker or EV-associated genes to visualize/test.
- `OVERALL_GENE_EV_OVERLAY_METHODS`: co-visualization methods such as `4way`, `bivar`, `outline`, and `ring`.
- `BIVAR_PALETTE_STYL`: bivariate color style.
- `DE_MIN_SPOTS_PER_GROUP`, `DE_MIN_TOTAL_SPOTS`, `DESEQ2_SIZEFACTOR_TYPE`: differential expression controls.

Typical outputs include H&E-overlaid gene heatmaps, EV raw-count maps, gene-EV co-visualization PDFs, EV-region ring/fill plots, violin summaries, report text files, cached RDS objects, and differential expression tables.

### 7. TIFF compression utility

`SpatialEV_tif_lossless_compression_v1.0.py` compresses TIFF images without changing pixel values. It is useful for large microscopy images used by the GUI registration tools.

The script currently contains a local example path in the `__main__` block. Edit the path before running:

```bash
python scripts/SpatialEV_tif_lossless_compression_v1.0.py
```

## Recommended analysis logic

Spatial-EV-seq analyses generally follow the logic below:

1. Decode in situ sequencing images with DynamicISS or prepare fluorescence signal coordinates from image data.
2. Use morphology-rich images, preferably H&E and/or DAPI, to define corresponding landmarks between adjacent sections.
3. Apply three-point affine registration to project ISS/EV/protein signals into the spatial transcriptomics coordinate frame.
4. Export matched signal tables and quality-control visualizations.
5. Combine matched signals with spatial transcriptomes, spot coordinates, and cell-type abundance.
6. Run downstream analyses such as gene-EV co-visualization, EV-region statistics, and stLearn-based cell-cell interaction analysis.

This README intentionally describes the modules and parameters rather than enforcing a single workflow, because the exact order depends on sample type, imaging modality, panel design, and the downstream biological question.

## Output interpretation

The core matched outputs connect spatial transcriptomics positions with ISS/EV/protein signals from adjacent sections. These outputs can be used to:

- quantify where EV/protein/in situ signals occur relative to spatial transcriptomic spots;
- stratify spots by high/low EV or gene signal;
- visualize gene and EV signals on the same H&E coordinate frame;
- compare local cell-type abundance between EV-positive and EV-negative regions;
- identify ligand-receptor interactions enriched in selected spatial regions.

When interpreting results, inspect registration overlays carefully. Adjacent-section registration can be affected by tissue deformation, folding, staining differences, section thickness, and local morphology changes. Manual landmark refinement is recommended for publication-level figures.

## Citation


If you use DynamicISS-based decoding, also cite or acknowledge DynamicBiosystems/DynamicISS according to its license and documentation.

## License

Copyright (c) 2026 BuckyEv. All rights reserved.

Contact: james.bayern@icloud.com

