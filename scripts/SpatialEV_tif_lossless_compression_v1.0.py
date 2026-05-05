# ============================================================
# Spatial-EV-seq code release
# Program: SpatialEV_tif_lossless_compression_v1.0.py
# Version: v1.0
# Release date: 2026-05-05
# Copyright (c) 2026 BuckyEv. All rights reserved.
# Contact: james.bayern@icloud.com
# ============================================================
from __future__ import annotations
from pathlib import Path
import numpy as np
import tifffile

# tqdm is optional; the script can run without it.
try:
    from tqdm import tqdm
except Exception:
    def tqdm(x, **kwargs):
        return x
    tqdm.write = print

def choose_predictor(dtype: np.dtype) -> int | None:
    # TIFF predictor: 2=horizontal differencing (integer); 3=floating point
    if np.issubdtype(dtype, np.floating):
        return 3
    if np.issubdtype(dtype, np.integer):
        return 2
    return None

def get_page_attr(page, name, default=None):
    try:
        return getattr(page, name)
    except Exception:
        return default

def compress_one(
    in_path: Path,
    out_path: Path,
    *,
    compat_mode: bool = True,
    prefer_zstd: bool = False,
    zstd_level: int = 9,
    deflate_level: int = 6,
    force_tile: tuple[int, int] | None = None,
):
    """Compress one TIFF image with lossless compression.

    compat_mode=True prioritizes compatibility with common image viewers.
    compat_mode=False may improve compression ratio but can reduce viewer compatibility.
    """

    out_path.parent.mkdir(parents=True, exist_ok=True)

    with tifffile.TiffFile(in_path) as tif:
        # Use BigTIFF only when it is safer or required for large files.
        with tifffile.TiffWriter(out_path, bigtiff="IF_SAFER") as tw:
            for page in tif.pages:
                # Prefer chunked reading to reduce memory usage; fall back to full-page reading.
                try:
                    store = page.aszarr()
                    import zarr
                    data = zarr.open(store, mode="r")
                except Exception:
                    data = page.asarray()

                dtype = getattr(data, "dtype", np.asarray(data).dtype)
                predictor = choose_predictor(dtype)

                # Preserve key TIFF parameters when possible for compatibility.
                photometric = get_page_attr(page, "photometric", None)
                planarconfig = get_page_attr(page, "planarconfig", None)
                extrasamples = get_page_attr(page, "extrasamples", None)

                # Tile strategy: strips are used by default in compatibility mode.
                tile = None
                if force_tile is not None:
                    tile = force_tile
                elif not compat_mode:
                    tile = (256, 256)

                # Compression strategy.
                if compat_mode:
                    # DEFLATE is lossless and broadly compatible.
                    compression = "deflate"
                    compressionargs = {"level": int(deflate_level)}
                else:
                    # Non-compatibility mode can prioritize ZSTD, otherwise DEFLATE.
                    if prefer_zstd:
                        compression = "zstd"
                        compressionargs = {"level": int(zstd_level)}
                    else:
                        compression = "deflate"
                        compressionargs = {"level": int(deflate_level)}

                # Write the compressed TIFF page.
                tw.write(
                    data,
                    compression=compression,
                    compressionargs=compressionargs,
                    predictor=predictor,
                    tile=tile,
                    photometric=photometric,
                    planarconfig=planarconfig,
                    extrasamples=extrasamples,
                    metadata=None,  # Avoid extra OME/JSON metadata that may increase size or reduce compatibility.
                )

def batch_compress(
    input_dir: str,
    out_subdir_name: str = "_compressed_lossless",
    *,
    compat_mode: bool = True,
):
    in_dir = Path(input_dir)
    out_dir = in_dir / out_subdir_name
    out_dir.mkdir(exist_ok=True)

    tif_files = sorted([p for p in in_dir.iterdir() if p.suffix.lower() in (".tif", ".tiff")])
    if not tif_files:
        print("No tif/tiff files were found in:", in_dir)
        return

    print(f"Input directory: {in_dir}")
    print(f"Output directory: {out_dir}")
    print(f"File count: {len(tif_files)}")
    print(f"Compatibility mode: {compat_mode}")

    for p in tqdm(tif_files, desc="Compressing"):
        out_path = out_dir / p.name

        # Skip existing non-empty outputs.
        if out_path.exists() and out_path.stat().st_size > 0:
            continue

        try:
            compress_one(
                p,
                out_path,
                compat_mode=compat_mode,
                prefer_zstd=not compat_mode,  # Try ZSTD only outside compatibility mode.
            )
        except Exception as e:
            tqdm.write(f"[FAILED] {p.name} | err: {e}")

if __name__ == "__main__":
    # Replace this with the input TIFF directory before running.
    input_tiff_dir = r"/path/to/input_tiff_directory"
    batch_compress(input_tiff_dir, compat_mode=True)
