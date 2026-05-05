# Version and file-name map

| Original file | Release file | Version |
| --- | --- | --- |
| `PyPZ.pyz` | `scripts/SpatialEV_affine_registration_v1.0.pyz` | v1.0 |
| `fluorescence_correlation.pyz` | `scripts/SpatialEV_fluorescence_correlation_v1.4.pyz` | v1.4 |
| `run_ISS.IRIS.sh` | `scripts/SpatialEV_DynamicISS_IRIS_v1.0.sh` | v1.0 |
| `stLearn_CCI-v4.py` | `scripts/SpatialEV_stLearn_CCI_v4.0.py` | v4.0 |
| `full_automation_v2.0.sh` | `scripts/SpatialEV_CCI_batch_automation_v2.0.sh` | v2.0 |
| `spatial_gene_v55_significance.R` | `scripts/SpatialEV_gene_EV_significance_v5.5.R` | v5.5 |
| `compress_tif_lossless.py` | `scripts/SpatialEV_tif_lossless_compression_v1.0.py` | v1.0 |

## Low-intrusion code adjustments

- Added release metadata/copyright headers to code files and to Python sources inside the `.pyz` archives.
- Standardized release file names so that every script name contains a `vX.X` version identifier.
- Updated `SpatialEV_CCI_batch_automation_v2.0.sh` to call the renamed `SpatialEV_stLearn_CCI_v4.0.py` from the same `scripts/` directory.
- Added `--n_pairs` and `--n_perms` arguments to `SpatialEV_stLearn_CCI_v4.0.py`, because these parameters were already used by the batch automation script.

(No algorithmic blocks were rewritten.)
