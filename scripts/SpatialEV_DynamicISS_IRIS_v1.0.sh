#!/usr/bin/env bash
# ============================================================
# Spatial-EV-seq code release
# Program: SpatialEV_DynamicISS_IRIS_v1.0.sh
# Version: v1.0
# Release date: 2026-05-05
# Copyright (c) 2026 BuckyEv. All rights reserved.
# Contact: james.bayern@icloud.com
# ============================================================


# Example command for decoding in situ sequencing images with DynamicISS.
# Edit the local paths before running. The settings below use SIFT-based image
# registration and IRIS decoding, matching the analysis described for this repository.
# Key inputs:
#   -I / --ImagePath       raw ISS image directory
#   -b / --bcycles         sequencing/imaging cycles
#   -r / --refcycle        reference cycle for image registration
#   -s                     split size or tile size used by the installed DynamicISS version
#   -m                     registration method, here SIFT
#   --barcode              barcode-to-gene table
#   --sample               sample name
#   --decode-method        decoding method, here IRIS
#   --output               output directory

python /path/to/DynamicISS count \
    -I /path/to/raw_iss_image_directory \
    -b 1 \
    -r 1 \
    -s 4000 \
    -m SIFT \
    --barcode /path/to/barcode_table.txt \
    --sample YOUR_SAMPLE_NAME \
    --cores 20 \
    --decode-method=IRIS \
    --output /path/to/output_directory
