#!/bin/bash
# ============================================================
# Spatial-EV-seq code release
# Program: SpatialEV_CCI_batch_automation_v2.0.sh
# Version: v2.0
# Release date: 2026-05-05
# Copyright (c) 2026 BuckyEv. All rights reserved.
# Contact: james.bayern@icloud.com
# ============================================================

# Root directory containing 10x Visium files, spatial assets, and gene_expression_extremes.csv. Edit before running.
root_dir="/path/to/your/spatial_ev_project"

# Location of the paired stLearn CCI runner shipped with this repository.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
stlearn_script="$script_dir/SpatialEV_stLearn_CCI_v4.0.py"


# Helper script used to subset the 10x h5 matrix. Edit before running.
select_script="/path/to/select_10x_h5.py"

# Default stLearn parameters used by the generated per-cluster commands:
#  1) --distance 50
#  2) --min_spots_for_run 3
#  3) --min_spots_for_run_cci 2
#  4) --n_pairs 1000
#  5) --n_perms 500
# Keep command-line continuations inside the heredoc unchanged.

# Locate required input files.
echo "Locating required files..."
original_h5=$(find "$root_dir" -name "*filtered_feature_bc_matrix.h5" | head -1)
original_celltype=$(find "$root_dir" -name "*_celltype_abundance.csv" | head -1)
original_pos=$(find "$root_dir" -name "*tissue_positions_list.csv" | head -1)
spatial_dir="$root_dir/spatial"  # Spatial image and coordinate directory.
gene_extremes_file="$root_dir/gene_expression_extremes.csv"

# Validate required files.
if [ -z "$original_h5" ]; then
    echo "Error: filtered_feature_bc_matrix.h5 was not found."
    exit 1
fi

if [ -z "$original_celltype" ]; then
    echo "Error: _celltype_abundance.csv was not found."
    exit 1
fi

if [ -z "$original_pos" ]; then
    echo "Error: tissue_positions_list.csv was not found."
    exit 1
fi

if [ ! -d "$spatial_dir" ]; then
    echo "Error: the spatial directory was not found."
    echo "Path: $spatial_dir"
    exit 1
fi

if [ ! -f "$gene_extremes_file" ]; then
    echo "Error: gene_expression_extremes.csv was not found."
    exit 1
fi

if [ ! -f "$select_script" ]; then
    echo "Error: select_10x_h5.py was not found."
    echo "Path: $select_script"
    exit 1
fi

if [ ! -f "$stlearn_script" ]; then
    echo "Error: SpatialEV_stLearn_CCI_v4.0.py was not found."
    echo "Path: $stlearn_script"
    exit 1
fi

echo "Resolved input files:"
echo "  H5 file: $original_h5"
echo "  Cell-type file: $original_celltype"
echo "  Tissue-position file: $original_pos"
echo "  Spatial directory: $spatial_dir"
echo "  Gene-extreme file: $gene_extremes_file"
echo "  Selection script: $select_script"
echo

# Extract unique gene names.
echo "Extracting the gene list..."
genes=$(awk -F, 'NR>1 {print $1}' "$gene_extremes_file" | sort | uniq)

# Process each gene.
for gene in $genes; do
    echo "Processing gene: $gene"

    # Create the gene-level output directory.
    gene_dir="$root_dir/$gene"
    mkdir -p "$gene_dir"

    # Process cluster1 (top 20 spots).
    echo "  Processing cluster1 (top 20)..."
    cluster1_dir="$gene_dir/cluster1"
    mkdir -p "$cluster1_dir"

    # Generate select.txt for cluster1.
    awk -F, -v g="$gene" '$1 == g && $2 ~ /^top_/ {print $3}' "$gene_extremes_file" | head -20 > "$cluster1_dir/select.txt"

    # Skip if select.txt is empty.
    if [ ! -s "$cluster1_dir/select.txt" ]; then
        echo "  Warning: no top_ records found for gene $gene; skipping cluster1."
        rm -rf "$cluster1_dir"
    else
        # Run select_10x_h5.py for cluster1.
        echo "    Running select_10x_h5.py..."
        python "$select_script"             -select="$cluster1_dir/select.txt"             -h5="$original_h5"             -celltype="$original_celltype"             -pos="$original_pos"             -r=200             -out_h5="$cluster1_dir/filtered_feature_bc_matrix.h5"             -out_celltype="$cluster1_dir/Integration_celltype_abundance_Cluster1.csv"

        # Check whether the expected files were generated.
        if [ ! -f "$cluster1_dir/filtered_feature_bc_matrix.h5" ] || [ ! -f "$cluster1_dir/Integration_celltype_abundance_Cluster1.csv" ]; then
            echo "  Warning: cluster1 files were not generated; skipping."
            rm -rf "$cluster1_dir"
        else
            # Copy the spatial directory into the cluster directory.
            echo "    Copying the spatial directory..."
            cp -r "$spatial_dir" "$cluster1_dir/"

            # Generate the cluster1 stLearn command with robust default thresholds.
            # n_pairs and n_perms are provided explicitly for reproducible batch runs.
            # Write the cluster1 stLearn launcher.
            cat > "$cluster1_dir/test_stLearn_jjj.sh" << EOF
python "$stlearn_script" \
--ST "$cluster1_dir" \
--species human \
--deconvolution "$cluster1_dir/Integration_celltype_abundance_Cluster1.csv" \
--multicelltypes True \
--distance 50 \
--min_spots_for_run_cci 2 \
--min_spots_for_run 3 \
--n_pairs 200 \
--n_perms 20 \
--outdir "./stLearn_testjjj_${gene}_cluster1"
EOF
            chmod +x "$cluster1_dir/test_stLearn_jjj.sh"
            echo "    cluster1 processing completed."
        fi
    fi

    # Process cluster2 (bottom 20 spots).
    echo "  Processing cluster2 (bottom 20)..."
    cluster2_dir="$gene_dir/cluster2"
    mkdir -p "$cluster2_dir"

    # Generate select.txt for cluster2.
    awk -F, -v g="$gene" '$1 == g && $2 ~ /^bottom_/ {print $3}' "$gene_extremes_file" | head -20 > "$cluster2_dir/select.txt"

    # Skip if select.txt is empty.
    if [ ! -s "$cluster2_dir/select.txt" ]; then
        echo "  Warning: no bottom_ records found for gene $gene; skipping cluster2."
        rm -rf "$cluster2_dir"
    else
        # Run select_10x_h5.py for cluster2.
        echo "    Running select_10x_h5.py..."
        python "$select_script"             -select="$cluster2_dir/select.txt"             -h5="$original_h5"             -celltype="$original_celltype"             -pos="$original_pos"             -r=200             -out_h5="$cluster2_dir/filtered_feature_bc_matrix.h5"             -out_celltype="$cluster2_dir/Integration_celltype_abundance_Cluster2.csv"

        # Check whether the expected files were generated.
        if [ ! -f "$cluster2_dir/filtered_feature_bc_matrix.h5" ] || [ ! -f "$cluster2_dir/Integration_celltype_abundance_Cluster2.csv" ]; then
            echo "  Warning: cluster2 files were not generated; skipping."
            rm -rf "$cluster2_dir"
        else
            # Copy the spatial directory into the cluster directory.
            echo "    Copying the spatial directory..."
            cp -r "$spatial_dir" "$cluster2_dir/"

            # Use the same robust default thresholds for cluster2.
            # Write the cluster2 stLearn launcher.
            cat > "$cluster2_dir/test_stLearn_jjj.sh" << EOF
python "$stlearn_script" \
--ST "$cluster2_dir" \
--species human \
--deconvolution "$cluster2_dir/Integration_celltype_abundance_Cluster2.csv" \
--multicelltypes True \
--distance 50 \
--min_spots_for_run_cci 2 \
--min_spots_for_run 3 \
--n_pairs 200 \
--n_perms 20 \
--outdir "./stLearn_testjjj_${gene}_cluster2"
EOF
            chmod +x "$cluster2_dir/test_stLearn_jjj.sh"
            echo "    cluster2 processing completed."
        fi
    fi
done

echo "All genes were processed. Starting stLearn jobs..."

# Run each generated stLearn launcher.
find "$root_dir" -path "*/cluster*" -name "test_stLearn_jjj.sh" | while read script_path; do
    script_dir=$(dirname "$script_path")
    gene_name=$(basename $(dirname "$script_dir"))
    cluster_name=$(basename "$script_dir")

    echo "Running launcher for $gene_name/$cluster_name"
    echo "Script path: $script_path"

    # Run the launcher from its own directory.
    (cd "$script_dir" && bash test_stLearn_jjj.sh > "stLearn_${gene_name}_${cluster_name}.log" 2>&1)

    if [ $? -eq 0 ]; then
        echo "$gene_name/$cluster_name completed successfully."
    else
        echo "$gene_name/$cluster_name failed."
        # Show the last lines of the error log.
        echo "Error log tail:"
        tail -n 10 "$script_dir/stLearn_${gene_name}_${cluster_name}.log"
    fi

    echo "----------------------------------------"
done

echo "All stLearn launchers completed."
