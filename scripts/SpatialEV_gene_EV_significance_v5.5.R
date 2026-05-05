# ============================================================
# Spatial-EV-seq code release
# Program: SpatialEV_gene_EV_significance_v5.5.R
# Version: v5.5
# Release date: 2026-05-05
# Copyright (c) 2026 BuckyEv. All rights reserved.
# Contact: james.bayern@icloud.com
# ============================================================
# =========================================================















# =========================================================


# =========================================================

# =========================================================


INPUT_BASE_DIR  <- "/path/to/input_directory"
OUTPUT_BASE_DIR <- "/path/to/output_directory"


RUN_CLUSTER_ANALYSIS    <- FALSE
RUN_SUBCLUSTER_ANALYSIS <- FALSE
RUN_OVERALL_ANALYSIS    <- TRUE

# =========================================================



#   Step A: BUILD_GENE_COUNT



#   Step B: BUILD_SEURAT



#   Step C: PREPARE_SPATIAL



#   Step D: OVERALL_PDFS



#   Step E: OVERALL_COVIS(Gene-EV co-visualization)



#   Step F: SUBCLUSTER / CLUSTER





# =========================================================
USE_CACHE_RDS <- TRUE
FORCE_REBUILD_RDS <- FALSE

SAVE_CACHE_GENE_COUNT <- TRUE
SAVE_CACHE_SEURAT     <- TRUE
SAVE_CACHE_COORDS     <- TRUE

SKIP_IF_OUTPUT_EXISTS <- TRUE


STEP_BUILD_GENE_COUNT <- TRUE
STEP_BUILD_SEURAT     <- TRUE
STEP_PREPARE_SPATIAL  <- TRUE

STEP_RUN_OVERALL_PDFS  <- TRUE
STEP_RUN_OVERALL_COVIS <- TRUE
STEP_RUN_SUBCLUSTER    <- TRUE
STEP_RUN_CLUSTER       <- FALSE


# =========================================================

# =========================================================
CLUSTER_GENES <- c("ICAM")

# =========================================================

# =========================================================
OVERALL_GENES <- c("ITGA", "ITGB", "EGFR", "ICAM1", "CD274", "ITGAM", "CD58", "PECAM1", "ITGAL")
OVERALL_VIOLIN_DROP_ZERO_EXPR <- TRUE

# =========================================================

# =========================================================
RUN_OVERALL_GENE_EV_OVERLAY <- TRUE


OVERALL_GENE_EV_OVERLAY_GENES <- c("PECAM1", "ITGAL")


OVERALL_GENE_EV_OVERLAY_EV_GENE <- CLUSTER_GENES[1]


OVERALL_GENE_EV_OVERLAY_METHODS <- c("4way", "bivar", "outline")


OVERALL_GENE_EV_OVERLAY_PDF_SUFFIX <- "_OVERALL_GeneEV_covis_V55.pdf"


OVERALL_COVIS_INCLUDE_REFERENCE_PAGES <- TRUE

# =========================================================





# =========================================================
RUN_OVERALL_EVREGION_RINGFILL <- TRUE
STEP_RUN_OVERALL_EVREGION     <- TRUE


OVERALL_EVREGION_EV1 <- "PD-L1"
OVERALL_EVREGION_EV2 <- "ICAM"


OVERALL_EVREGION_EV_MODE <- "auto"
OVERALL_EVREGION_EV_EXPR_VALUE <- -1
OVERALL_EVREGION_EV_NOEXPR_VALUE <- -2
OVERALL_EVREGION_EV_POS_THRESHOLD <- 1
OVERALL_EVREGION_EV_NEG_THRESHOLD <- 0


OVERALL_EVREGION_FILL_MODE <- "abundance"   # "abundance" / "gene"
OVERALL_EVREGION_FILL_CELLTYPES <- c("CD8T")
OVERALL_EVREGION_FILL_GENES     <- c("CD8A")


OVERALL_EVREGION_RING_COLOR_BY_VALUE <- TRUE
OVERALL_EVREGION_RING_COLOR_OPTION   <- "white_red"
OVERALL_EVREGION_RING_COLOR_FIXED_COEXPR <- "#984ea3"
OVERALL_EVREGION_RING_STROKE <- 0.55


OVERALL_EVREGION_PDF_SUFFIX <- "_OVERALL_EVregion_ringfill_V55.pdf"

# =========================================================
# B3.1) V5.5:OVERALL EV-region CD8T abundance violin plots


# =========================================================
RUN_OVERALL_EVREGION_VIOLIN <- TRUE
STEP_RUN_OVERALL_EVREGION_VIOLIN <- TRUE


OVERALL_EVREGION_VIOLIN_CELLTYPE <- "CD8T"


OVERALL_EVREGION_VIOLIN_DROP_ZERO <- FALSE




OVERALL_EVREGION_VIOLIN_GROUPMODE <- "inclusive"

# ---------- Method 1: 4way ----------
OVERALL_4WAY_GENE_HIGH_QUANTILE <- 0.75

OVERALL_4WAY_EV_MODE <- "auto"         # "auto" / "value" / "threshold"
OVERALL_4WAY_EV_EXPR_VALUE <- -1
OVERALL_4WAY_EV_NOEXPR_VALUE <- -2
OVERALL_4WAY_EV_POS_THRESHOLD <- 1
OVERALL_4WAY_EV_NEG_THRESHOLD <- 0

# ---------- Method 2: bivariate 3x3 ----------
OVERALL_BIVAR_N_BINS <- 3







BIVAR_PALETTE_STYL <- "dkblue"

# ---------- Method 3: outline ----------
OVERALL_OUTLINE_GENE_GRAY <- TRUE

OVERALL_OUTLINE_EV_MODE <- "auto"
OVERALL_OUTLINE_EV_EXPR_VALUE <- -1
OVERALL_OUTLINE_EV_NOEXPR_VALUE <- -2
OVERALL_OUTLINE_EV_POS_THRESHOLD <- 1
OVERALL_OUTLINE_EV_NEG_THRESHOLD <- 0


OVERALL_OUTLINE_EV_COLOR_BY_VALUE <- TRUE
OVERALL_OUTLINE_EV_COLOR_OPTION   <- "white_red"  # viridis option:viridis/magma/inferno/plasma/cividis/turbo
OVERALL_OUTLINE_EV_COLOR_FIXED    <- "#e41a1c"
OVERALL_OUTLINE_EV_STROKE <- 0.55


OVERALL_OVERLAY_EV_RING_MODE <- "threshold"
OVERALL_OVERLAY_EV_MIN <- 1
OVERALL_OVERLAY_EV_COLOR_OPTION <- "turbo"
OVERALL_OVERLAY_EV_RING_STROKE  <- 0.55

# =========================================================

# =========================================================
OVERALL_GRID_MAX_COL <- 3
OVERALL_GRID_SPOT_SIZE_FACTOR <- 0.55

# ---- V5.5 safety ----

if (!exists("OVERALL_GRID_SPOT_SIZE_FACTOR")) {
  OVERALL_GRID_SPOT_SIZE_FACTOR <- 0.55
}

OVERALL_PANEL_W_CM <- 8.5
OVERALL_PANEL_H_CM <- 7.5

OVERALL_LEGEND_W_CM <- 3.8
OVERALL_TITLE_H_CM  <- 1.8
OVERALL_FOOTER_H_CM <- 1.0
OVERALL_MARGIN_W_CM <- 1.2
OVERALL_MARGIN_H_CM <- 1.0


OVERALL_PLOT_ALL_EV_FROM_BAS <- TRUE

# =========================================================

# =========================================================
CLUSTER_METHOD <- "abundance_threshold"

# --- abundance_threshold ---
AB_CELLTYPE_NAME  <- "CD8T"
AB_THRESHOLD      <- 0.14
SPATIAL_TOLERANCE <- 0.7
SPATIAL_KNN_K     <- 6


APPLY_DIAG_MIRROR <- TRUE


C1_CELLTYPE_NAME  <- "CD8T"
C1_CELLTYPE_MODE  <- "percent"
C1_CELLTYPE_VALUE <- 100

C2_CELLTYPE_NAME  <- "CD8T"
C2_CELLTYPE_MODE  <- "percent"
C2_CELLTYPE_VALUE <- 100


APPLY_EV_COUNT_FILTER <- TRUE
C1_GENE_MODE      <- "percent"
C1_GENE_VALUE     <- 100
C2_GENE_MODE      <- "percent"
C2_GENE_VALUE     <- 100
C2_CONSIDER_ZERO  <- TRUE

# =========================================================

# =========================================================
SUBCLUSTER_TARGET_CLUSTERS <- c("cluster1","cluster2")

SUBCLUSTER_EV_SPLIT_METHOD <- "auto"  # "auto" / "value" / "threshold"
SUBCLUSTER_EV_EXPR_VALUE   <- -1
SUBCLUSTER_EV_NOEXPR_VALUE <- -2
SUBCLUSTER_EV_POS_THRESHOLD <- 2
SUBCLUSTER_EV_NEG_THRESHOLD <- 0

SUBCLUSTER_DROP_OTHER_VALUES <- TRUE
SUBCLUSTER_LIGHTEN_FACTOR <- 0.55

# =========================================================

# =========================================================
PLOT_GENES <- c("ITGB2", "PECAM1", "ITGAL")
VIOLIN_DROP_ZERO_EXPR <- TRUE

# =========================================================

# =========================================================
SPATIAL_DROP_ZERO_EXPR <- FALSE

# =========================================================

# =========================================================
RUN_DESEQ2 <- TRUE
DE_MIN_SPOTS_PER_GROUP <- 3
DE_MIN_TOTAL_SPOTS     <- 6
DE_MIN_ROW_SUM_COUNTS  <- 1
DESEQ2_MAX_GENES <- NA_integer_
DESEQ2_SIZEFACTOR_TYPE <- "poscounts"
DESEQ2_FITTYPE <- "parametric"

# =========================================================

# =========================================================
COL_CLUSTER1 <- "#1f77b4"
COL_CLUSTER2 <- "#d62728"
PDF_WIDTH  <- 14
PDF_HEIGHT <- 8.5

# =========================================================

# =========================================================
HE_STD_PLOT_WIDTH_CM   <- 14
HE_STD_PLOT_HEIGHT_CM  <- 12
HE_GRID_PLOT_WIDTH_CM  <- 28
HE_GRID_PLOT_HEIGHT_CM <- 20
HE_GRID_MAX_COL <- 3
HE_FULL_PLOT_WIDTH_CM  <- HE_STD_PLOT_WIDTH_CM
HE_FULL_PLOT_HEIGHT_CM <- HE_STD_PLOT_HEIGHT_CM

# =========================================================

# =========================================================
HE_IMAGE_DOWNSAMPLE <- 4

# =========================================================

# =========================================================
BASE_SPOT_SIZE    <- 1.9
SPOT_SIZE_FACTOR         <- 0.80
SPATIAL_SPOT_SIZE_FACTOR <- 0.90

SPOT_SIZE         <- BASE_SPOT_SIZE * SPOT_SIZE_FACTOR
SPOT_SIZE_SPATIAL <- BASE_SPOT_SIZE * SPATIAL_SPOT_SIZE_FACTOR

SPOT_ALPHA_FG <- 0.80
SPOT_ALPHA_BG <- 0.12

FG_STROKE_WIDTH <- 0
FG_STROKE_ALPHA <- 0.50

HE_GRID_SPOT_SIZE_FACTOR <- 0.55

# =========================================================

# =========================================================
BG_ALPHA         <- 0.9
BG_BRIGHTNESS    <- 0.9
HE_FADE_TO_WHITE <- 0.60

# =========================================================

# =========================================================
SPATIAL_COLOR_MODE <- "custom"      # "viridis" / "custom"
HE_UNIFIED_PALETTE_OPTION <- "magma"
PALETTE_BEGIN <- 0.15
PALETTE_END   <- 0.98
SPATIAL_CUSTOM_COLORS <- c("#ffffff", "#fee8c8", "#fdbb84", "#e34a33", "#b30000")


# =========================================================

# =========================================================
CRAN_MIRROR <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"

install_if_missing_cran <- function(pkgs) {
  miss <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
  if (length(miss)) {
    message("[CRAN package install] Missing packages: ", paste(miss, collapse = ", "))
    install.packages(miss, repos = CRAN_MIRROR, dependencies = TRUE)
  }
}

install_if_missing_cran(c(
  "Matrix","readr","dplyr","tibble","stringr","tidyr",
  "ggplot2","ggsignif","Seurat","cowplot",
  "scales","viridis","jsonlite","png","jpeg","grid",
  "RANN"
))
install_if_missing_cran(c("DESeq2"))

suppressPackageStartupMessages({
  library(Matrix)
  library(readr)
  library(dplyr)
  library(tibble)
  library(stringr)
  library(tidyr)
  library(ggplot2)
    library(ggsignif)
library(Seurat)
  library(cowplot)
  library(scales)
  library(viridis)
  library(jsonlite)
  library(png)
  library(jpeg)
  library(grid)
  library(RANN)
  library(DESeq2)
})

`%||%` <- function(a, b) if (is.null(a)) b else a


# =========================================================

# =========================================================
init_warning_log <- function(path) {
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  if (!file.exists(path)) {
    writeLines(c(
      paste0("Warnings Log created at: ", Sys.time()),
      "================================================="
    ), path)
  }
  invisible(path)
}
append_log <- function(path, lines) {
  if (is.null(path) || is.na(path) || !nzchar(path)) return(invisible(NULL))
  init_warning_log(path)
  cat(paste0(lines, collapse = "\n"), "\n", file = path, append = TRUE)
  invisible(NULL)
}
with_warning_log_immediate <- function(expr, warn_file, stage = "") {
  withCallingHandlers(
    expr,
    warning = function(w) {
      append_log(warn_file, c(
        paste0("[WARNING][", Sys.time(), "][", stage, "] ", conditionMessage(w))
      ))
      invokeRestart("muffleWarning")
    },
    message = function(m) {
      invokeRestart("muffleMessage")
    }
  )
}


# =========================================================

# =========================================================
.cache_load_or_build <- function(cache_file,
                                 build_fun,
                                 allow_build = TRUE,
                                 use_cache = TRUE,
                                 force_rebuild = FALSE,
                                 save_cache = TRUE,
                                 tag = "object") {
  if (isTRUE(use_cache) && !isTRUE(force_rebuild) && file.exists(cache_file)) {
    message("  [CACHE] Load ", tag, " <- ", cache_file)
    return(readRDS(cache_file))
  }
  if (!isTRUE(allow_build)) {
    stop("[CACHE] Missing cache and building disabled for: ", tag, " | file=", cache_file)
  }
  message("  [CACHE] Build ", tag, " ...")
  obj <- build_fun()
  if (isTRUE(use_cache) && isTRUE(save_cache)) {
    dir.create(dirname(cache_file), recursive = TRUE, showWarnings = FALSE)
    saveRDS(obj, cache_file)
    message("  [CACHE] Saved ", tag, " -> ", cache_file)
  }
  obj
}


# =========================================================

# =========================================================
# =========================================================

# =========================================================



#   GRCh38-PECAM1, GRCh38_PECAM1, hg38-PECAM1, hg39_PECAM1 ...



.detect_uniform_prefix <- function(vec, min_frac = 0.80, max_check = 5000L) {
  v <- as.character(vec)
  v <- v[!is.na(v) & nzchar(v)]
  if (!length(v)) return(NA_character_)

  if (length(v) > max_check) v <- v[seq_len(max_check)]


  pref <- sub("^([^\\-_]+[\\-_]).*$", "\\1", v, perl = TRUE)
  has_sep <- grepl("^[^\\-_]+[\\-_]$", pref)
  if (!any(has_sep)) return(NA_character_)

  pref <- pref[has_sep]
  v2   <- v[has_sep]


  rest <- sub("^[^\\-_]+[\\-_]", "", v2, perl = TRUE)
  ok_rest <- nzchar(rest)
  if (!any(ok_rest)) return(NA_character_)

  pref <- pref[ok_rest]
  if (!length(pref)) return(NA_character_)

  tb <- sort(table(pref), decreasing = TRUE)
  top_pref <- names(tb)[1]
  frac <- as.numeric(tb[1]) / length(pref)


  if (is.finite(frac) && frac >= min_frac && nchar(top_pref) >= 3) {
    return(top_pref)
  }
  NA_character_
}

strip_prefix_gene <- function(x, uniform_prefix = NULL) {
  x0 <- as.character(x)
  x0[is.na(x0)] <- ""


  x1 <- gsub("^(GRCh\\d+|hg\\d+)[\\-_]", "", x0, ignore.case = TRUE, perl = TRUE)


  up <- uniform_prefix
  if (is.null(up) || is.na(up) || !nzchar(up)) {
    if (length(x0) >= 20) {
      up <- .detect_uniform_prefix(x0)
    } else {
      up <- NA_character_
    }
  }

  if (!is.na(up) && nzchar(up)) {

    up_esc <- gsub("([\\^\\$\\.|\\+\\(\\)\\[\\]\\{\\}\\\\])", "\\\\\\1", up, perl = TRUE)
    x2 <- sub(paste0("^", up_esc), "", x1, perl = TRUE)
    x2 <- sub(paste0("^", up), "", x2, ignore.case = TRUE)
    x2
  } else {
    x1
  }
}

safe_tag <- function(x) gsub("[^A-Za-z0-9_/-]+", "_", x)
norm_barcode <- function(x) sub("-1$", "", as.character(x))

read_10x_h5_counts <- function(h5_file) {
  x <- Seurat::Read10X_h5(h5_file, use.names = TRUE, unique.features = TRUE)
  if (is.list(x)) {
    if ("Gene Expression" %in% names(x)) x <- x[["Gene Expression"]] else x <- x[[1]]
  }
  x
}

harmonize_barcodes <- function(bcs, target_colnames) {
  bcs <- unique(as.character(bcs))
  bcs <- bcs[!is.na(bcs) & nzchar(bcs)]
  if (!length(bcs)) return(character(0))

  hit <- bcs[bcs %in% target_colnames]
  if (length(hit)) return(hit)

  bcs2 <- ifelse(grepl("-\\d+$", bcs), bcs, paste0(bcs, "-1"))
  hit2 <- bcs2[bcs2 %in% target_colnames]
  if (length(hit2)) return(unique(hit2))

  bcs3 <- sub("-\\d+$", "", bcs)
  tgt3 <- sub("-\\d+$", "", target_colnames)
  idx <- match(bcs3, tgt3)
  hit3 <- target_colnames[stats::na.omit(idx)]
  unique(hit3)
}

find_feature_in_mat <- function(mat_rownames, gene_symbol) {
  rn_raw   <- mat_rownames
  rn_clean <- strip_prefix_gene(rn_raw)

  cands <- unique(c(
    gene_symbol,
    if (toupper(gene_symbol) %in% c("HAVCR2")) c("HAVCR2","TIM-3","TIM3") else NULL,
    if (toupper(gene_symbol) %in% c("ENTPD1")) c("ENTPD1","CD39") else NULL,
    if (toupper(gene_symbol) %in% c("CD274"))  c("CD274","PD-L1","PDL1") else NULL
  ))

  idx <- match(toupper(cands), toupper(rn_clean))
  idx <- idx[!is.na(idx)]
  if (length(idx)) return(rn_raw[idx[1]])

  idx2 <- match(toupper(cands), toupper(rn_raw))
  idx2 <- idx2[!is.na(idx2)]
  if (length(idx2)) return(rn_raw[idx2[1]])

  NA_character_
}

get_counts_layer <- function(seurat_obj, assay = "RNA") {
  m <- tryCatch({
    GetAssayData(seurat_obj, assay = assay, layer = "counts")
  }, error = function(e) NULL)
  if (!is.null(m)) return(m)

  a <- seurat_obj[[assay]]
  if (!is.null(a@counts)) return(a@counts)

  stop("Unable to obtain counts; check the Seurat/SeuratObject version and object structure")
}

# =========================================================

# =========================================================
.select_top_by_percent <- function(x_named, pct) {
  n <- length(x_named)
  k <- ceiling(n * (pct / 100))
  k <- max(0, min(n, k))
  if (k == 0) return(character(0))
  ord <- order(x_named, decreasing = TRUE, na.last = TRUE)
  names(x_named)[ord[seq_len(k)]]
}
.select_bottom_by_percent <- function(x_named, pct) {
  n <- length(x_named)
  k <- ceiling(n * (pct / 100))
  k <- max(0, min(n, k))
  if (k == 0) return(character(0))
  ord <- order(x_named, decreasing = FALSE, na.last = TRUE)
  names(x_named)[ord[seq_len(k)]]
}
.select_top_by_n <- function(x_named, n_keep) {
  n <- length(x_named)
  k <- max(0, min(n, as.integer(n_keep)))
  if (k == 0) return(character(0))
  ord <- order(x_named, decreasing = TRUE, na.last = TRUE)
  names(x_named)[ord[seq_len(k)]]
}
.select_bottom_by_n <- function(x_named, n_keep) {
  n <- length(x_named)
  k <- max(0, min(n, as.integer(n_keep)))
  if (k == 0) return(character(0))
  ord <- order(x_named, decreasing = FALSE, na.last = TRUE)
  names(x_named)[ord[seq_len(k)]]
}

select_barcodes_by_rule <- function(x_named, mode, value, direction = c("top","bottom")) {
  direction <- match.arg(direction)
  mode <- tolower(mode)

  if (mode == "percent") {
    value <- as.numeric(value)
    if (value < 0 || value > 100) stop("In percent mode, value must be between 0 and 100")
    if (direction == "top") return(.select_top_by_percent(x_named, value))
    return(.select_bottom_by_percent(x_named, value))
  }

  if (mode == "topn"    && direction == "top")    return(.select_top_by_n(x_named, value))
  if (mode == "bottomn" && direction == "bottom") return(.select_bottom_by_n(x_named, value))

  stop("Unsupported rule: mode=", mode, " direction=", direction,
       "(top percent/topN; bottom percent/bottomN)")
}

# =========================================================
# 3.2) bas -> gene_count_wide
# =========================================================
build_and_write_gene_count_wide <- function(bas_file, sample_name, out_dir, extra_barcodes = character(0)) {
  df <- suppressWarnings(readr::read_csv(bas_file, show_col_types = FALSE))
  if (!nrow(df)) stop("Empty file: ", bas_file)

  nms_l <- tolower(names(df))
  need_cols <- c("barcode","gene","count")
  if (!all(need_cols %in% nms_l)) {
    stop("*_bas_cell_barcode.csv is missing required columns Barcode/gene/count. Actual columns: ", paste(names(df), collapse = ", "))
  }

  barcode_col <- names(df)[match("barcode", nms_l)]
  gene_col    <- names(df)[match("gene", nms_l)]
  count_col   <- names(df)[match("count", nms_l)]

  df2 <- df %>%
    transmute(
      Barcode = norm_barcode(as.character(.data[[barcode_col]])),
      gene    = as.character(.data[[gene_col]]),
      count   = suppressWarnings(as.numeric(.data[[count_col]]))
    ) %>%
    filter(!is.na(Barcode), nzchar(Barcode), !is.na(gene), nzchar(gene)) %>%
    mutate(count = ifelse(is.na(count), 0, count)) %>%
    group_by(Barcode, gene) %>%
    summarise(count = sum(count), .groups = "drop")

  wide <- df2 %>% tidyr::pivot_wider(names_from = gene, values_from = count, values_fill = 0)

  if (length(extra_barcodes)) {
    extra_barcodes <- norm_barcode(extra_barcodes)
    extra_barcodes <- setdiff(unique(extra_barcodes), wide$Barcode)
    if (length(extra_barcodes)) {
      zero_row <- as.list(rep(0, ncol(wide) - 1))
      names(zero_row) <- setdiff(names(wide), "Barcode")
      add_df <- bind_rows(lapply(extra_barcodes, function(bc) tibble::tibble(Barcode = bc, !!!zero_row)))
      wide <- bind_rows(wide, add_df)
    }
  }

  out_file <- file.path(out_dir, paste0(sample_name, "_gene_count.csv"))
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  readr::write_csv(wide, out_file)

  list(
    wide_df = wide,
    genes   = setdiff(names(wide), "Barcode"),
    barcodes = wide$Barcode,
    out_file = out_file
  )
}

get_gene_count_vec <- function(gene_wide_df, gene_name, all_barcodes) {
  all_barcodes <- norm_barcode(all_barcodes)
  if (!(gene_name %in% names(gene_wide_df))) {
    v <- rep(0, length(all_barcodes)); names(v) <- all_barcodes
    return(v)
  }
  df <- gene_wide_df %>% select(Barcode, !!gene_name)
  df$Barcode <- norm_barcode(df$Barcode)

  v <- suppressWarnings(as.numeric(df[[gene_name]]))
  v[is.na(v)] <- 0
  names(v) <- as.character(df$Barcode)

  out <- rep(0, length(all_barcodes)); names(out) <- all_barcodes
  hit <- intersect(all_barcodes, names(v))
  out[hit] <- v[hit]
  out
}


# =========================================================



# =========================================================
synonyms_bas_gene <- function(gene_name) {
  g <- toupper(as.character(gene_name %||% ""))
  if (g %in% c("PD-L1","PDL1","CD274")) return(unique(c("CD274","PD-L1","PDL1")))
  if (g %in% c("ICAM","ICAM1")) return(unique(c("ICAM","ICAM1")))
  unique(c(gene_name))
}

find_bas_gene_col <- function(colnames_vec, query_gene) {
  cols <- setdiff(colnames_vec, "Barcode")
  if (!length(cols)) return(NA_character_)

  qlist <- unique(unlist(lapply(synonyms_bas_gene(query_gene), function(x) {
    c(x, toupper(x), tolower(x))
  })))

  # 1) exact match (case-insensitive)
  idx <- match(toupper(qlist), toupper(cols))
  idx <- idx[!is.na(idx)]
  if (length(idx)) return(cols[idx[1]])

  # 2) prefix-stripped match
  cols_clean <- strip_prefix_gene(cols)
  idx2 <- match(toupper(qlist), toupper(cols_clean))
  idx2 <- idx2[!is.na(idx2)]
  if (length(idx2)) return(cols[idx2[1]])

  # 3) remove non-alnum and compare
  norm_key <- function(x) gsub("[^A-Za-z0-9]+", "", toupper(x))
  qn <- norm_key(qlist)
  cn <- norm_key(cols)
  m <- match(qn, cn)
  m <- m[!is.na(m)]
  if (length(m)) return(cols[m[1]])

  NA_character_
}

get_gene_count_vec_fuzzy <- function(gene_wide_df, gene_name, all_barcodes) {
  all_barcodes <- norm_barcode(all_barcodes)
  hit_col <- find_bas_gene_col(names(gene_wide_df), gene_name)
  if (is.na(hit_col)) {
    v <- rep(0, length(all_barcodes)); names(v) <- all_barcodes
    return(list(vec = v, hit_col = NA_character_))
  }
  v <- get_gene_count_vec(gene_wide_df, hit_col, all_barcodes)
  list(vec = v, hit_col = hit_col)
}

# =========================================================

# =========================================================
.is_barcode_like_vec <- function(x) {
  x <- as.character(x)
  x <- x[!is.na(x) & nzchar(x)]
  if (!length(x)) return(FALSE)
  pat <- "^[ACGTN]+(-\\d+)?$"
  mean(grepl(pat, x), na.rm = TRUE) >= 0.8
}
.guess_barcode_colname <- function(df) {
  if (!ncol(df)) return(NA_character_)
  nms <- names(df)
  nms_l <- tolower(nms)

  if ("barcode" %in% nms_l) return(nms[match("barcode", nms_l)])

  first_nm <- nms[1]
  if (first_nm %in% c("...1","X","x","V1","v1","rownames","Row.names","row.names","") ||
      grepl("^\\.{3}\\d+$", first_nm)) {
    if (.is_barcode_like_vec(df[[1]])) return(first_nm)
  }

  score <- vapply(seq_len(ncol(df)), function(i) {
    x <- df[[i]]
    if (is.numeric(x)) return(0)
    x <- as.character(x)
    x <- x[!is.na(x) & nzchar(x)]
    if (!length(x)) return(0)
    pat <- "^[ACGTN]+(-\\d+)?$"
    mean(grepl(pat, x), na.rm = TRUE)
  }, numeric(1))

  if (max(score, na.rm = TRUE) >= 0.8) return(nms[which.max(score)])
  NA_character_
}

read_celltype_abundance_vec <- function(ab_file, celltype_name) {
  df <- suppressWarnings(readr::read_csv(ab_file, show_col_types = FALSE))
  if (!nrow(df)) stop("Empty file: ", ab_file)

  if (!("Barcode" %in% names(df))) {
    bc_col <- .guess_barcode_colname(df)
    if (is.na(bc_col)) {
      stop("*_celltype_abundance.csv is missing a Barcode column and it could not be detected automatically. Actual columns: ",
           paste(names(df), collapse = ", "))
    }
    names(df)[match(bc_col, names(df))] <- "Barcode"
  }

  drop_cols <- intersect(names(df), c("cell.type","cluster.type","Cell.type","Cluster.type"))
  df2 <- df %>% select(-all_of(drop_cols))

  if (!(celltype_name %in% names(df2))) {
    stop("The requested cell-type column was not found in *_celltype_abundance.csv: ", celltype_name,
         "; available columns: ", paste(setdiff(names(df2), "Barcode"), collapse = ", "))
  }

  v <- suppressWarnings(as.numeric(df2[[celltype_name]]))
  v[is.na(v)] <- 0
  names(v) <- norm_barcode(df2$Barcode)
  v
}


# =========================================================

# =========================================================
find_spatial_assets_v3 <- function(sample_dir) {
  sp1 <- file.path(sample_dir, "spatial")
  sp2 <- file.path(sample_dir, "outs", "spatial")
  cands <- unique(c(sp1, sp2))
  cands <- cands[file.exists(cands)]

  if (!length(cands)) {
    cand_pos <- list.files(sample_dir, pattern = "^tissue_positions(_list)?\\.csv$", recursive = TRUE, full.names = TRUE)
    if (length(cand_pos)) cands <- unique(dirname(cand_pos))
  }

  for (sp in cands) {
    pos <- file.path(sp, "tissue_positions_list.csv")
    if (!file.exists(pos)) pos <- file.path(sp, "tissue_positions.csv")
    if (!file.exists(pos)) next

    img <- file.path(sp, "tissue_fullres_image.png")
    if (!file.exists(img)) img <- file.path(sp, "tissue_hires_image.png")
    if (!file.exists(img)) img <- file.path(sp, "tissue_lowres_image.png")
    if (!file.exists(img)) next

    sc  <- file.path(sp, "scalefactors_json.json")
    if (!file.exists(sc)) sc <- NA_character_

    return(list(spatial_dir = sp, positions = pos, image = img, scalefactors = sc))
  }
  NULL
}

read_positions_v3 <- function(pos_path) {
  nm <- basename(pos_path)
  if (grepl("tissue_positions_list\\.csv$", nm)) {
    df <- suppressMessages(readr::read_csv(pos_path, col_names = FALSE, show_col_types = FALSE))
    names(df) <- c("barcode", "in_tissue", "array_row", "array_col", "pxl_col_in_fullres", "pxl_row_in_fullres")
  } else {
    df <- suppressMessages(readr::read_csv(pos_path, show_col_types = FALSE))
    names(df) <- tolower(names(df))
    if (!all(c("barcode", "pxl_col_in_fullres", "pxl_row_in_fullres") %in% names(df))) {
      if (all(c("x", "y") %in% names(df))) {
        df$pxl_col_in_fullres <- df$x
        df$pxl_row_in_fullres <- df$y
      } else {
        stop("Positions file missing required columns.")
      }
    }
    if (!"in_tissue" %in% names(df)) df$in_tissue <- if ("tissue" %in% names(df)) df$tissue else 1L
  }
  df$barcode <- norm_barcode(df$barcode)
  df
}

read_scalefactors_v3 <- function(sc_path) {
  if (is.na(sc_path) || !file.exists(sc_path)) {
    return(list(tissue_lowres_scalef = NA_real_,
                tissue_hires_scalef  = NA_real_,
                spot_diameter_fullres = NA_real_))
  }
  j <- jsonlite::read_json(sc_path, simplifyVector = TRUE)
  list(
    tissue_lowres_scalef = as.numeric(j[["tissue_lowres_scalef"]] %||% NA_real_),
    tissue_hires_scalef  = as.numeric(j[["tissue_hires_scalef"]] %||% NA_real_),
    spot_diameter_fullres = as.numeric(j[["spot_diameter_fullres"]] %||% NA_real_)
  )
}

read_he_image_v3 <- function(img_path) {
  if (grepl("\\.png$", img_path, ignore.case = TRUE)) {
    img <- png::readPNG(img_path)
  } else if (grepl("\\.jpe?g$", img_path, ignore.case = TRUE)) {
    img <- jpeg::readJPEG(img_path)
  } else {
    stop("Unsupported image format: ", img_path)
  }
  h <- dim(img)[1]; w <- dim(img)[2]
  list(img = img, width = w, height = h, path = img_path)
}

downsample_image <- function(img, factor = 1L) {
  factor <- as.integer(factor)
  factor <- max(1L, factor)
  if (factor == 1L) return(img)

  if (length(dim(img)) == 3) {
    h <- dim(img)[1]; w <- dim(img)[2]
    rr <- seq(1, h, by = factor)
    cc <- seq(1, w, by = factor)
    img[rr, cc, , drop = FALSE]
  } else if (length(dim(img)) == 2) {
    h <- dim(img)[1]; w <- dim(img)[2]
    rr <- seq(1, h, by = factor)
    cc <- seq(1, w, by = factor)
    img[rr, cc, drop = FALSE]
  } else {
    img
  }
}

img_array_to_colmat <- function(arr4) {
  if (length(dim(arr4)) != 3 || dim(arr4)[3] < 4) stop("arr4 must be RGBA.")
  h <- dim(arr4)[1]; w <- dim(arr4)[2]
  matrix(rgb(arr4[,,1], arr4[,,2], arr4[,,3], arr4[,,4]), nrow = h, ncol = w)
}

build_faded_he_raster <- function(he_image,
                                  fade_to_white = HE_FADE_TO_WHITE,
                                  brightness    = BG_BRIGHTNESS,
                                  alpha         = BG_ALPHA) {
  h <- dim(he_image)[1]; w <- dim(he_image)[2]
  if (length(dim(he_image)) == 3) {
    ch  <- dim(he_image)[3]
    rgb0 <- he_image[,,1:min(3, ch), drop = FALSE]
    if (dim(rgb0)[3] < 3) rgb0 <- array(rep(rgb0, length.out = h*w*3), dim = c(h,w,3))
    a0 <- if (ch >= 4) he_image[,,4] else matrix(1, h, w)
  } else {
    rgb0 <- array(he_image, dim = c(h, w, 3))
    a0   <- matrix(1, h, w)
  }

  rgb0 <- pmin(pmax(rgb0 * brightness, 0), 1)
  f <- max(min(ifelse(is.finite(fade_to_white), fade_to_white, 0), 1), 0)
  if (f > 0) rgb0 <- (1 - f) * rgb0 + f * 1.0
  a0 <- pmin(pmax(a0 * alpha, 0), 1)

  arr4 <- array(0, dim = c(h, w, 4))
  arr4[,,1:3] <- rgb0
  arr4[,,4]   <- a0
  img_array_to_colmat(arr4)
}

estimate_scale <- function(pos, img_w, img_h) {
  p <- pos
  if ("in_tissue" %in% names(p)) p <- p[p$in_tissue == 1, , drop = FALSE]
  max_x <- max(p$pxl_col_in_fullres, na.rm = TRUE)
  max_y <- max(p$pxl_row_in_fullres, na.rm = TRUE)
  min(img_w / max_x, img_h / max_y)
}

build_coords_v3 <- function(pos, img_meta, sc, which_image = c("auto","fullres","hires","lowres")) {
  which_image <- match.arg(which_image)
  use_scale <- NA_real_

  if (which_image == "fullres") {
    use_scale <- 1.0
  } else if (which_image == "auto") {
    if (grepl("fullres", img_meta$path, ignore.case = TRUE)) {
      use_scale <- 1.0
    } else if (!is.na(sc$tissue_lowres_scalef) && grepl("lowres", img_meta$path, ignore.case = TRUE)) {
      use_scale <- sc$tissue_lowres_scalef
    } else if (!is.na(sc$tissue_hires_scalef) && grepl("hires", img_meta$path, ignore.case = TRUE)) {
      use_scale <- sc$tissue_hires_scalef
    }
  } else if (which_image == "lowres") {
    use_scale <- sc$tissue_lowres_scalef
  } else if (which_image == "hires") {
    use_scale <- sc$tissue_hires_scalef
  }

  if (!is.finite(use_scale)) use_scale <- estimate_scale(pos, img_meta$width, img_meta$height)

  coords <- pos %>% mutate(
    x_img = pxl_col_in_fullres * use_scale,
    y_img = pxl_row_in_fullres * use_scale
  )
  list(coords = coords, used_scale = use_scale)
}

prepare_spatial_coords_and_image <- function(sample_dir) {
  spa <- find_spatial_assets_v3(sample_dir)
  if (is.null(spa)) return(NULL)

  pos <- tryCatch(read_positions_v3(spa$positions), error = function(e) NULL)
  if (is.null(pos)) return(NULL)

  img_meta0 <- tryCatch(read_he_image_v3(spa$image), error = function(e) NULL)
  if (is.null(img_meta0)) return(NULL)

  sc <- read_scalefactors_v3(spa$scalefactors)
  bc <- build_coords_v3(pos, img_meta0, sc, which_image = "auto")

  coords <- bc$coords %>%
    filter(in_tissue == 1L) %>%
    mutate(Barcode = norm_barcode(barcode))

  ds <- max(1L, as.integer(HE_IMAGE_DOWNSAMPLE))
  img_ds <- downsample_image(img_meta0$img, ds)
  img_meta_ds <- list(
    img = img_ds,
    width = dim(img_ds)[2],
    height = dim(img_ds)[1],
    path = img_meta0$path,
    downsample = ds
  )

  coords$x_img <- coords$x_img / ds
  coords$y_img <- coords$y_img / ds

  attr(coords, "img_meta") <- img_meta_ds
  coords
}


# =========================================================

# =========================================================
.make_pdf_device <- function() if (capabilities("cairo")) grDevices::cairo_pdf else grDevices::pdf

.add_plot_xy <- function(df, img_w, img_h, apply_diag_mirror = APPLY_DIAG_MIRROR) {
  if (apply_diag_mirror) {
    df %>% mutate(
      x_plot = y_img * (img_w / img_h),
      y_plot = img_h - (x_img * (img_h / img_w))
    )
  } else {
    df %>% mutate(
      x_plot = x_img,
      y_plot = img_h - y_img
    )
  }
}

make_spatial_fill_scale <- function(legend_title = "Expression") {
  mode <- tolower(SPATIAL_COLOR_MODE)
  if (mode == "custom") {
    cols <- SPATIAL_CUSTOM_COLORS
    if (is.null(cols) || length(cols) < 2) cols <- c("#ffffff", "#bcbddc", "#54278f")
    return(
      scale_fill_gradientn(
        colours = cols,
        name = legend_title,
        oob = scales::squish,
        guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                               barheight = grid::unit(25, "mm"))
      )
    )
  }
  scale_fill_viridis_c(
    option = HE_UNIFIED_PALETTE_OPTION,
    begin = PALETTE_BEGIN,
    end   = PALETTE_END,
    name  = legend_title,
    guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                           barheight = grid::unit(25, "mm"))
  )
}

.resolve_stroke_style <- function() {
  sw <- suppressWarnings(as.numeric(FG_STROKE_WIDTH))
  if (!is.finite(sw) || sw <= 1e-6) return(list(stroke = 0, color = "transparent"))
  list(stroke = sw, color = scales::alpha("#FFFFFF", FG_STROKE_ALPHA))
}

plot_spatial_continuous <- function(img, img_w, img_h,
                                   df_all_spots, df_value,
                                   value_col,
                                   title = NULL,
                                   legend_title = "Expression",
                                   spot_alpha_bg = SPOT_ALPHA_BG,
                                   spot_alpha_fg = SPOT_ALPHA_FG,
                                   spot_size = SPOT_SIZE_SPATIAL,
                                   show_legend = TRUE) {
  if (!value_col %in% names(df_value)) stop("value column not in df_value")

  df_all_spots <- .add_plot_xy(df_all_spots, img_w, img_h)
  df_value     <- .add_plot_xy(df_value,     img_w, img_h)

  stroke_style <- .resolve_stroke_style()
  bg_raster <- build_faded_he_raster(img, HE_FADE_TO_WHITE, BG_BRIGHTNESS, BG_ALPHA)

  ggplot() +
    annotation_raster(bg_raster, xmin = 0, xmax = img_w, ymin = 0, ymax = img_h) +
    geom_point(data = df_all_spots, aes(x = x_plot, y = y_plot),
               shape = 21, fill = "#b9b9b9", color = "transparent",
               stroke = 0, size = spot_size, alpha = spot_alpha_bg) +
    geom_point(data = df_value, aes(x = x_plot, y = y_plot, fill = .data[[value_col]]),
               shape = 21, color = stroke_style$color, stroke = stroke_style$stroke,
               size = spot_size, alpha = spot_alpha_fg) +
    make_spatial_fill_scale(legend_title) +
    coord_fixed(xlim = c(0, img_w), ylim = c(0, img_h), expand = FALSE, clip = "off") +
    theme_void(base_size = 11, base_family = "Arial") +
    theme(
      legend.position = if (isTRUE(show_legend)) "right" else "none",
      legend.background = element_rect(fill = scales::alpha("white", 0.96), color = NA),
      plot.margin = grid::unit(c(3, 3, 3, 3), "mm"),
      plot.title = element_text(hjust = 0.5, face = "bold")
    ) +
    labs(title = title)
}

plot_spatial_groups_discrete <- function(img, img_w, img_h,
                                        df_all_spots, df_groups,
                                        group_col = "group",
                                        title = NULL,
                                        palette_named,
                                        legend_title = "Group") {
  if (!group_col %in% names(df_groups)) stop("df_groups missing group_col=", group_col)

  df_all_spots <- .add_plot_xy(df_all_spots, img_w, img_h)
  df_groups    <- .add_plot_xy(df_groups,    img_w, img_h)

  stroke_style <- .resolve_stroke_style()
  bg_raster <- build_faded_he_raster(img, HE_FADE_TO_WHITE, BG_BRIGHTNESS, BG_ALPHA)

  ggplot() +
    annotation_raster(bg_raster, xmin = 0, xmax = img_w, ymin = 0, ymax = img_h) +
    geom_point(data = df_all_spots, aes(x = x_plot, y = y_plot),
               shape = 21, fill = "#b9b9b9", color = "transparent",
               stroke = 0, size = SPOT_SIZE, alpha = SPOT_ALPHA_BG) +
    geom_point(data = df_groups, aes(x = x_plot, y = y_plot, fill = .data[[group_col]]),
               shape = 21, color = stroke_style$color, stroke = stroke_style$stroke,
               size = SPOT_SIZE, alpha = SPOT_ALPHA_FG) +
    scale_fill_manual(values = palette_named, name = legend_title) +
    coord_fixed(xlim = c(0, img_w), ylim = c(0, img_h), expand = FALSE, clip = "off") +
    theme_void(base_size = 11, base_family = "Arial") +
    theme(
      legend.position = "right",
      legend.background = element_rect(fill = scales::alpha("white", 0.96), color = NA),
      plot.margin = grid::unit(c(3, 3, 3, 3), "mm"),
      plot.title = element_text(hjust = 0.5, face = "bold")
    ) +
    labs(title = title)
}

plot_spatial_gene_ev_overlay <- function(img, img_w, img_h,
                                        df_all_spots, df_gene_ev,
                                        gene_col = "gene_value",
                                        ev_col   = "ev_value",
                                        title = NULL,
                                        gene_legend = "Gene",
                                        ev_legend   = "EV",
                                        spot_size = SPOT_SIZE_SPATIAL,
                                        show_legend = TRUE) {
  if (!all(c(gene_col, ev_col) %in% names(df_gene_ev))) stop("df_gene_ev is missing gene_col/ev_col")

  df_all_spots <- .add_plot_xy(df_all_spots, img_w, img_h)
  df_gene_ev   <- .add_plot_xy(df_gene_ev,   img_w, img_h)

  bg_raster <- build_faded_he_raster(img, HE_FADE_TO_WHITE, BG_BRIGHTNESS, BG_ALPHA)

  df_ring <- df_gene_ev
  mode <- tolower(OVERALL_OVERLAY_EV_RING_MODE)
  if (mode == "threshold") {
    df_ring <- df_ring %>% filter(.data[[ev_col]] >= OVERALL_OVERLAY_EV_MIN)
  }

  ggplot() +
    annotation_raster(bg_raster, xmin = 0, xmax = img_w, ymin = 0, ymax = img_h) +
    geom_point(data = df_all_spots, aes(x = x_plot, y = y_plot),
               shape = 21, fill = "#b9b9b9", color = "transparent",
               stroke = 0, size = spot_size, alpha = SPOT_ALPHA_BG) +
    geom_point(data = df_gene_ev, aes(x = x_plot, y = y_plot, fill = .data[[gene_col]]),
               shape = 21, color = "transparent", stroke = 0,
               size = spot_size, alpha = SPOT_ALPHA_FG) +
    make_spatial_fill_scale(gene_legend) +
    geom_point(data = df_ring, aes(x = x_plot, y = y_plot, colour = .data[[ev_col]]),
               shape = 21, fill = NA,
               stroke = OVERALL_OVERLAY_EV_RING_STROKE,
               size = spot_size, alpha = 0.95) +
    scale_colour_viridis_c(
      option = OVERALL_OVERLAY_EV_COLOR_OPTION,
      name = ev_legend,
      oob = scales::squish,
      guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                             barheight = grid::unit(25, "mm"))
    ) +
    coord_fixed(xlim = c(0, img_w), ylim = c(0, img_h), expand = FALSE, clip = "off") +
    theme_void(base_size = 11, base_family = "Arial") +
    theme(
      legend.position = if (isTRUE(show_legend)) "right" else "none",
      legend.background = element_rect(fill = scales::alpha("white", 0.96), color = NA),
      plot.margin = grid::unit(c(3, 3, 3, 3), "mm"),
      plot.title = element_text(hjust = 0.5, face = "bold")
    ) +
    labs(title = title)
}


# =========================================================




# =========================================================

plot_spatial_evregion_ringfill <- function(img, img_w, img_h,
                                          df_all_spots,
                                          df_fill,
                                          df_ring,
                                          fill_col = "fill_value",
                                          ring_col = "ring_value",
                                          title = NULL,
                                          fill_legend = "Value",
                                          ring_legend = "EV",
                                          ring_color_by_value = TRUE,
                                          ring_color_option = "white_red",
                                          ring_color_fixed = "#984ea3",
                                          ring_stroke = 0.55,
                                          spot_size = SPOT_SIZE_SPATIAL,
                                          show_legend = TRUE) {
  # V5.5 (patched): use the SAME visual strategy as GeneEV covis method=outline:
  #   - center: continuous fill (only for df_fill)
  #   - outline: highlight region spots (df_ring), optionally color by EV value
  # This avoids the "ring increases spot diameter -> overlap" issue by not using
  # a separate ring glyph; it is a standard outline overlay.
  if (!fill_col %in% names(df_fill)) stop("df_fill missing fill_col=", fill_col)
  if (!nrow(df_all_spots)) stop("df_all_spots is empty")

  df_all_spots <- .add_plot_xy(df_all_spots, img_w, img_h)
  df_fill      <- .add_plot_xy(df_fill,      img_w, img_h)
  df_ring      <- .add_plot_xy(df_ring,      img_w, img_h)

  bg_raster <- build_faded_he_raster(img, HE_FADE_TO_WHITE, BG_BRIGHTNESS, BG_ALPHA)

  p <- ggplot() +
    annotation_raster(bg_raster, xmin = 0, xmax = img_w, ymin = 0, ymax = img_h) +
    # background (all spots)
    geom_point(data = df_all_spots, aes(x = x_plot, y = y_plot),
               shape = 21, fill = "#b9b9b9", color = "transparent",
               stroke = 0, size = spot_size, alpha = SPOT_ALPHA_BG) +
    # fill only on target region spots
    geom_point(data = df_fill, aes(x = x_plot, y = y_plot, fill = .data[[fill_col]]),
               shape = 21, color = "transparent", stroke = 0,
               size = spot_size, alpha = SPOT_ALPHA_FG) +
    make_spatial_fill_scale(fill_legend)

  # outline on region spots
  if (nrow(df_ring)) {
    if (isTRUE(ring_color_by_value) && ring_col %in% names(df_ring)) {
      p <- p +
        geom_point(
          data = df_ring, aes(x = x_plot, y = y_plot, colour = .data[[ring_col]]),
          shape = 21, fill = NA,
          stroke = ring_stroke, size = spot_size, alpha = 0.95
        )

      opt <- tolower(as.character(ring_color_option %||% "turbo"))
      if (opt %in% c("white_red","white2red","wr","whitered")) {
        p <- p +
          scale_colour_gradient(
            low = "#ffffff", high = "#e41a1c",
            name = ring_legend,
            oob = scales::squish,
            guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                                   barheight = grid::unit(25, "mm"))
          )
      } else {
        p <- p +
          scale_colour_viridis_c(
            option = ring_color_option,
            name = ring_legend,
            oob = scales::squish,
            guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                                   barheight = grid::unit(25, "mm"))
          )
      }
    } else {
      p <- p +
        geom_point(
          data = df_ring, aes(x = x_plot, y = y_plot),
          shape = 21, fill = NA, color = ring_color_fixed,
          stroke = ring_stroke, size = spot_size, alpha = 0.95
        )
    }
  }

  p +
    coord_fixed(xlim = c(0, img_w), ylim = c(0, img_h), expand = FALSE, clip = "off") +
    theme_void(base_size = 11, base_family = "Arial") +
    theme(
      legend.position = if (isTRUE(show_legend)) "right" else "none",
      legend.background = element_rect(fill = scales::alpha("white", 0.96), color = NA),
      plot.margin = grid::unit(c(3, 3, 3, 3), "mm"),
      plot.title = element_text(hjust = 0.5, face = "bold")
    ) +
    labs(title = title)
}

# =========================================================

# =========================================================
make_spatial_fill_scale_gray <- function(legend_title = "Expression") {
  scale_fill_gradient(
    low = "#f7f7f7", high = "#252525",
    name = legend_title,
    guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                           barheight = grid::unit(25, "mm"))
  )
}

.bin_by_quantile_safe <- function(x, n_bins = 3) {
  x <- as.numeric(x)
  x[!is.finite(x)] <- NA_real_
  if (all(is.na(x))) return(factor(rep(NA_character_, length(x))))

  u <- sort(unique(stats::na.omit(x)))
  if (length(u) <= 2) {
    med <- stats::median(u, na.rm = TRUE)
    out <- ifelse(x <= med, 1L, 2L)
    return(factor(out, levels = c(1,2)))
  }

  probs <- seq(0, 1, length.out = n_bins + 1)
  br <- unique(as.numeric(stats::quantile(x, probs = probs, na.rm = TRUE, type = 7)))
  if (length(br) < 3) {
    br <- unique(as.numeric(pretty(x, n = n_bins)))
  }
  if (length(br) < 3) {
    out <- ifelse(x <= stats::median(x, na.rm = TRUE), 1L, 2L)
    return(factor(out, levels = c(1,2)))
  }
  out <- cut(x, breaks = br, include.lowest = TRUE, labels = FALSE)
  factor(out, levels = sort(unique(out)))
}

.resolve_ev_hi_lo <- function(ev_vec,
                              mode = c("auto","value","threshold"),
                              expr_value = -1, noexpr_value = -2,
                              pos_threshold = 1, neg_threshold = 0) {
  mode <- match.arg(mode)
  ev <- as.numeric(ev_vec)
  ev[!is.finite(ev)] <- NA_real_
  u <- sort(unique(stats::na.omit(ev)))

  if (mode == "auto") {
    has_expr   <- any(u == expr_value)
    has_noexpr <- any(u == noexpr_value)
    if (has_expr && has_noexpr) mode <- "value" else mode <- "threshold"
  }

  if (mode == "value") {
    hi <- ev == expr_value
    lo <- ev == noexpr_value
  } else {
    hi <- ev >= pos_threshold
    lo <- ev <= neg_threshold
  }

  list(mode_used = mode, hi = hi, lo = lo, unique_values = u)
}

plot_spatial_gene_ev_4way <- function(img, img_w, img_h,
                                      df_all_spots, df_gene_ev,
                                      gene_col = "gene_value",
                                      ev_col   = "ev_value",
                                      title = NULL,
                                      gene_high_quantile = 0.75,
                                      ev_mode = c("auto","value","threshold"),
                                      ev_expr_value = -1, ev_noexpr_value = -2,
                                      ev_pos_threshold = 1, ev_neg_threshold = 0,
                                      spot_size = SPOT_SIZE_SPATIAL,
                                      show_legend = TRUE) {
  ev_mode <- match.arg(ev_mode)
  if (!all(c(gene_col, ev_col) %in% names(df_gene_ev))) stop("df_gene_ev is missing gene_col/ev_col")

  df_all_spots <- .add_plot_xy(df_all_spots, img_w, img_h)
  df_gene_ev   <- .add_plot_xy(df_gene_ev,   img_w, img_h)

  bg_raster <- build_faded_he_raster(img, HE_FADE_TO_WHITE, BG_BRIGHTNESS, BG_ALPHA)

  g <- as.numeric(df_gene_ev[[gene_col]])
  g[!is.finite(g)] <- NA_real_
  thr <- stats::quantile(g, probs = gene_high_quantile, na.rm = TRUE, type = 7)

  ev_res <- .resolve_ev_hi_lo(
    ev_vec = df_gene_ev[[ev_col]],
    mode = ev_mode,
    expr_value = ev_expr_value, noexpr_value = ev_noexpr_value,
    pos_threshold = ev_pos_threshold, neg_threshold = ev_neg_threshold
  )

  gene_hi <- g >= thr
  ev_hi   <- ev_res$hi

  cat4 <- dplyr::case_when(
    gene_hi & ev_hi ~ "Gene high & EV high",
    gene_hi & !ev_hi ~ "Gene high only",
    !gene_hi & ev_hi ~ "EV high only",
    TRUE ~ "Both low"
  )
  df_gene_ev$cat4 <- factor(cat4, levels = c("Both low","Gene high only","EV high only","Gene high & EV high"))

  pal <- c(
    "Both low" = "#e5e5e5",
    "Gene high only" = "#377eb8",
    "EV high only" = "#ff7f00",
    "Gene high & EV high" = "#984ea3"
  )

  ggplot() +
    annotation_raster(bg_raster, xmin = 0, xmax = img_w, ymin = 0, ymax = img_h) +
    geom_point(data = df_all_spots, aes(x = x_plot, y = y_plot),
               shape = 21, fill = "#b9b9b9", color = "transparent",
               stroke = 0, size = spot_size, alpha = SPOT_ALPHA_BG) +
    geom_point(data = df_gene_ev, aes(x = x_plot, y = y_plot, fill = cat4),
               shape = 21, color = "transparent", stroke = 0,
               size = spot_size, alpha = SPOT_ALPHA_FG) +
    scale_fill_manual(values = pal, name = "Joint state") +
    coord_fixed(xlim = c(0, img_w), ylim = c(0, img_h), expand = FALSE, clip = "off") +
    theme_void(base_size = 11, base_family = "Arial") +
    theme(
      legend.position = if (isTRUE(show_legend)) "right" else "none",
      legend.background = element_rect(fill = scales::alpha("white", 0.96), color = NA),
      plot.margin = grid::unit(c(3, 3, 3, 3), "mm"),
      plot.title = element_text(hjust = 0.5, face = "bold")
    ) +
    labs(title = title)
}

# =========================================================

# =========================================================
.bivar_palette_3x3 <- function(style = BIVAR_PALETTE_STYL) {
  s <- tolower(as.character(style %||% "teal"))

  if (s %in% c("teal","default","v51")) {
    return(matrix(c(
      "#e8e8e8", "#b5c0da", "#6c83b5",
      "#b8d6be", "#90b2b3", "#567994",
      "#73ae80", "#5a9178", "#2a5a5b"
    ), nrow = 3, byrow = TRUE))
  }


  if (s %in% c("dkblue","stevens_dkblue","purpleblue","pb")) {
    return(matrix(c(
      "#e8e8e8", "#ace4e4", "#5ac8c8",
      "#dfb0d6", "#a5add3", "#5698b9",
      "#be64ac", "#8c62aa", "#3b4994"
    ), nrow = 3, byrow = TRUE))
  }


  if (s %in% c("redblue","stevens_redblue","rb")) {
    return(matrix(c(
      "#e8e8e8", "#e4acac", "#c85a5a",
      "#b0d5df", "#ad9ea5", "#985356",
      "#64acbe", "#627f8c", "#574249"
    ), nrow = 3, byrow = TRUE))
  }


  if (s %in% c("brownblue","bb")) {
    return(matrix(c(
      "#f0f0f0", "#c7d8e8", "#7aa6d6",
      "#e6c7b2", "#b8b4c8", "#6e7bb0",
      "#c18f6a", "#8a6a88", "#3b4a7a"
    ), nrow = 3, byrow = TRUE))
  }

  # fallback
  matrix(c(
    "#e8e8e8", "#b5c0da", "#6c83b5",
    "#b8d6be", "#90b2b3", "#567994",
    "#73ae80", "#5a9178", "#2a5a5b"
  ), nrow = 3, byrow = TRUE)
}

make_bivar_legend_plot <- function(pal_mat, xlab = "Gene ->", ylab = "EV ->") {
  df <- expand.grid(gbin = 1:ncol(pal_mat), ebin = 1:nrow(pal_mat))
  df$fill <- as.vector(pal_mat)
  ggplot(df, aes(x = gbin, y = ebin, fill = fill)) +
    geom_tile(color = "white", size = 0.3) +
    scale_fill_identity() +
    scale_x_continuous(breaks = c(1,2,3), labels = c("Low","Med","High"), expand = c(0,0)) +
    scale_y_continuous(breaks = c(1,2,3), labels = c("Low","Med","High"), expand = c(0,0)) +
    coord_fixed() +
    theme_void(base_size = 10) +
    theme(
      plot.margin = grid::unit(c(2,2,2,2), "mm"),
      axis.text = element_text(size = 8),
      axis.title = element_text(size = 9, face = "bold")
    ) +
    labs(x = xlab, y = ylab)
}

plot_spatial_gene_ev_bivariate <- function(img, img_w, img_h,
                                           df_all_spots, df_gene_ev,
                                           gene_col = "gene_value",
                                           ev_col   = "ev_value",
                                           title = NULL,
                                           n_bins = 3,
                                           palette_style = BIVAR_PALETTE_STYL,
                                           spot_size = SPOT_SIZE_SPATIAL,
                                           show_legend = TRUE) {
  if (!all(c(gene_col, ev_col) %in% names(df_gene_ev))) stop("df_gene_ev is missing gene_col/ev_col")

  df_all_spots <- .add_plot_xy(df_all_spots, img_w, img_h)
  df_gene_ev   <- .add_plot_xy(df_gene_ev,   img_w, img_h)

  bg_raster <- build_faded_he_raster(img, HE_FADE_TO_WHITE, BG_BRIGHTNESS, BG_ALPHA)

  gbin <- .bin_by_quantile_safe(df_gene_ev[[gene_col]], n_bins)
  ebin <- .bin_by_quantile_safe(df_gene_ev[[ev_col]],   n_bins)

  df_gene_ev$gbin <- as.integer(as.character(gbin))
  df_gene_ev$ebin <- as.integer(as.character(ebin))

  pal <- .bivar_palette_3x3(palette_style)
  if (nrow(pal) != n_bins || ncol(pal) != n_bins) {
    pal <- matrix(colorRampPalette(c("#e8e8e8","#3b4994"))(n_bins*n_bins), nrow = n_bins, byrow = TRUE)
  }

  df_gene_ev$bi_class <- paste0("E", df_gene_ev$ebin, "_G", df_gene_ev$gbin)

  pal_named <- c()
  for (e in seq_len(n_bins)) {
    for (g in seq_len(n_bins)) {
      pal_named[paste0("E", e, "_G", g)] <- pal[e, g]
    }
  }

  p <- ggplot() +
    annotation_raster(bg_raster, xmin = 0, xmax = img_w, ymin = 0, ymax = img_h) +
    geom_point(data = df_all_spots, aes(x = x_plot, y = y_plot),
               shape = 21, fill = "#b9b9b9", color = "transparent",
               stroke = 0, size = spot_size, alpha = SPOT_ALPHA_BG) +
    geom_point(data = df_gene_ev, aes(x = x_plot, y = y_plot, fill = bi_class),
               shape = 21, color = "transparent", stroke = 0,
               size = spot_size, alpha = SPOT_ALPHA_FG) +
    scale_fill_manual(values = pal_named, guide = "none") +
    coord_fixed(xlim = c(0, img_w), ylim = c(0, img_h), expand = FALSE, clip = "off") +
    theme_void(base_size = 11, base_family = "Arial") +
    theme(
      plot.margin = grid::unit(c(3, 3, 3, 3), "mm"),
      plot.title = element_text(hjust = 0.5, face = "bold"),
      legend.position = if (isTRUE(show_legend)) "right" else "none"
    ) +
    labs(title = title)

  p
}


plot_spatial_gene_ev_outline <- function(img, img_w, img_h,
                                         df_all_spots, df_gene_ev,
                                         gene_col = "gene_value",
                                         ev_col   = "ev_value",
                                         title = NULL,
                                         gene_gray = TRUE,
                                         ev_mode = c("auto","value","threshold"),
                                         ev_expr_value = -1, ev_noexpr_value = -2,
                                         ev_pos_threshold = 1, ev_neg_threshold = 0,
                                         ev_color_by_value = TRUE,
                                         ev_color_option = "turbo",
                                         ev_color_fixed = "#e41a1c",
                                         ev_stroke = 0.55,
                                         spot_size = SPOT_SIZE_SPATIAL,
                                         show_legend = TRUE) {
  ev_mode <- match.arg(ev_mode)
  if (!all(c(gene_col, ev_col) %in% names(df_gene_ev))) stop("df_gene_ev is missing gene_col/ev_col")

  df_all_spots <- .add_plot_xy(df_all_spots, img_w, img_h)
  df_gene_ev   <- .add_plot_xy(df_gene_ev,   img_w, img_h)

  bg_raster <- build_faded_he_raster(img, HE_FADE_TO_WHITE, BG_BRIGHTNESS, BG_ALPHA)

  ev_res <- .resolve_ev_hi_lo(
    ev_vec = df_gene_ev[[ev_col]],
    mode = ev_mode,
    expr_value = ev_expr_value, noexpr_value = ev_noexpr_value,
    pos_threshold = ev_pos_threshold, neg_threshold = ev_neg_threshold
  )
  df_ring <- df_gene_ev[which(ev_res$hi %in% TRUE), , drop = FALSE]

  p <- ggplot() +
    annotation_raster(bg_raster, xmin = 0, xmax = img_w, ymin = 0, ymax = img_h) +
    geom_point(data = df_all_spots, aes(x = x_plot, y = y_plot),
               shape = 21, fill = "#b9b9b9", color = "transparent",
               stroke = 0, size = spot_size, alpha = SPOT_ALPHA_BG) +
    geom_point(data = df_gene_ev, aes(x = x_plot, y = y_plot, fill = .data[[gene_col]]),
               shape = 21, color = "transparent", stroke = 0,
               size = spot_size, alpha = SPOT_ALPHA_FG) +
    (if (isTRUE(gene_gray)) make_spatial_fill_scale_gray("Gene (LogNorm)") else make_spatial_fill_scale("Gene (LogNorm)"))

  if (isTRUE(ev_color_by_value)) {
    p <- p +
      geom_point(
        data = df_ring, aes(x = x_plot, y = y_plot, colour = .data[[ev_col]]),
        shape = 21, fill = NA,
        stroke = ev_stroke, size = spot_size, alpha = 0.95
      )

    opt <- tolower(as.character(ev_color_option %||% "turbo"))
    if (opt %in% c("white_red","white2red","wr","whitered")) {
      p <- p +
        scale_colour_gradient(
          low = "#ffffff", high = "#e41a1c",
          name = "EV (count)",
          oob = scales::squish,
          guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                                barheight = grid::unit(25, "mm"))
        )
    } else {
      p <- p +
        scale_colour_viridis_c(
          option = ev_color_option,
          name = "EV (count)",
          oob = scales::squish,
          guide = guide_colorbar(barwidth = grid::unit(4, "mm"),
                                barheight = grid::unit(25, "mm"))
        )
    }

  } else {
    p <- p +
      geom_point(data = df_ring, aes(x = x_plot, y = y_plot),
                 shape = 21, fill = NA, color = ev_color_fixed,
                 stroke = ev_stroke, size = spot_size, alpha = 0.95)
  }

  p +
    coord_fixed(xlim = c(0, img_w), ylim = c(0, img_h), expand = FALSE, clip = "off") +
    theme_void(base_size = 11, base_family = "Arial") +
    theme(
      legend.position = if (isTRUE(show_legend)) "right" else "none",
      legend.background = element_rect(fill = scales::alpha("white", 0.96), color = NA),
      plot.margin = grid::unit(c(3, 3, 3, 3), "mm"),
      plot.title = element_text(hjust = 0.5, face = "bold")
    ) +
    labs(title = title)
}

assemble_spatial_grid_page_v53 <- function(plots, title_text, footer_text = "", ncol_fixed = 3,
                                           legend_grob = NULL, legend_width = 0.14) {
  if (!length(plots)) return(ggplot() + theme_void() + labs(title = title_text, subtitle = footer_text))

  ncol_grid <- min(as.integer(ncol_fixed), length(plots))
  ncol_grid <- max(1, ncol_grid)

  if (is.null(legend_grob)) {
    legend_grob <- tryCatch({
      cowplot::get_legend(plots[[1]] + theme(legend.position = "right"))
    }, error = function(e) grid::nullGrob())
  }

  grid_plots <- cowplot::plot_grid(plotlist = lapply(plots, function(p) p + theme(legend.position = "none")),
                                   ncol = ncol_grid, align = "hv")

  title_bar <- cowplot::ggdraw() +
    cowplot::draw_label(title_text, fontface = "bold", size = 16, x = 0.5, hjust = 0.5)

  footer <- cowplot::ggdraw() +
    cowplot::draw_label(footer_text, size = 10, x = 0, hjust = 0)

  cowplot::plot_grid(
    title_bar,
    cowplot::plot_grid(grid_plots, legend_grob, rel_widths = c(1, legend_width)),
    footer,
    ncol = 1,
    rel_heights = c(0.08, 0.86, 0.06)
  )
}

.overlay_method_note_en <- function(method,
                                    gene_high_q = OVERALL_4WAY_GENE_HIGH_QUANTILE,
                                    ev_mode = OVERALL_4WAY_EV_MODE,
                                    ev_thr = OVERALL_4WAY_EV_POS_THRESHOLD,
                                    ev_min_ring = OVERALL_OVERLAY_EV_MIN,
                                    bivar_style = BIVAR_PALETTE_STYL) {
  method <- tolower(method)
  if (method == "4way") {
    paste0(
      "Method: 4-way categorical overlay. Spots are classified by Gene-high (top ",
      round((1 - gene_high_q) * 100), "%) x EV-high. ",
      "Purple=both high; Blue=gene-only; Orange=EV-only; Gray=both low. ",
      "EV-high rule: mode=", ev_mode, ", threshold=", ev_thr, "."
    )
  } else if (method == "bivar") {
    paste0(
      "Method: bivariate 3x3 quantile bins. Gene and EV are each binned into Low/Med/High; ",
      "colors encode the joint state (see legend: Gene increases left->right, EV increases bottom->top). ",
      "Palette style=", bivar_style, "."
    )
  } else if (method == "outline") {
    paste0(
      "Method: continuous gene heatmap (fill; grayscale by default) with EV-high spots highlighted by outlines. ",
      "In V5.5, outline color can optionally represent EV count (gradient)."
    )
  } else if (method == "ring") {
    paste0(
      "Method: gene fill + EV ring (colored by EV value). ",
      "ring_mode=", OVERALL_OVERLAY_EV_RING_MODE, ", EV_min=", ev_min_ring, "."
    )
  } else {
    "Method: (unknown)"
  }
}

.mix_to_white <- function(hex, factor = 0.5) {
  factor <- max(0, min(1, as.numeric(factor)))
  rgb <- grDevices::col2rgb(hex) / 255
  rgb2 <- (1 - factor) * rgb + factor * 1
  grDevices::rgb(rgb2[1,], rgb2[2,], rgb2[3,])
}


# =========================================================

# =========================================================
spatial_smooth_labels <- function(labels_named, coords_df, tolerance = 0.0, knn_k = 6) {
  tolerance <- as.numeric(tolerance)
  tolerance <- max(0, min(1, tolerance))
  if (tolerance <= 1e-9) return(labels_named)

  required_majority <- max(0.5, 1 - 0.5 * tolerance)
  n_iter <- max(1, ceiling(1 + 2 * tolerance))

  use_array <- all(c("array_row","array_col") %in% names(coords_df)) &&
    all(is.finite(coords_df$array_row)) && all(is.finite(coords_df$array_col))

  xy <- if (use_array) as.matrix(coords_df[, c("array_row","array_col")]) else as.matrix(coords_df[, c("x_img","y_img")])
  rownames(xy) <- coords_df$Barcode

  k_use <- max(1, as.integer(knn_k))
  nn <- RANN::nn2(data = xy, query = xy, k = k_use + 1)

  nn_idx <- nn$nn.idx
  bcs <- coords_df$Barcode

  for (it in seq_len(n_iter)) {
    new_labels <- labels_named
    for (i in seq_along(bcs)) {
      bc <- bcs[i]
      nb_idx <- nn_idx[i, ]
      nb_idx <- nb_idx[nb_idx != i]
      if (!length(nb_idx)) next
      nb_bcs <- bcs[nb_idx]
      nb_lab <- labels_named[nb_bcs]
      nb_lab <- nb_lab[!is.na(nb_lab)]
      if (!length(nb_lab)) next

      frac1 <- mean(nb_lab == "cluster1")
      frac2 <- 1 - frac1
      if (frac1 >= required_majority) new_labels[bc] <- "cluster1"
      else if (frac2 >= required_majority) new_labels[bc] <- "cluster2"
    }
    labels_named <- new_labels
  }
  labels_named
}

select_clusters_by_abundance_threshold <- function(ab_vec, threshold, coords_df, tolerance, knn_k) {
  threshold <- as.numeric(threshold)

  ab0 <- ab_vec
  names(ab0) <- norm_barcode(names(ab0))

  coords_df <- coords_df %>% mutate(Barcode = norm_barcode(Barcode))
  common <- intersect(names(ab0), coords_df$Barcode)
  if (!length(common)) stop(": abundance Barcode positions (common=0).")

  ab_use <- ab0[common]
  labels <- ifelse(ab_use >= threshold, "cluster1", "cluster2")
  names(labels) <- names(ab_use)

  coords_use <- coords_df %>% filter(Barcode %in% common)
  coords_use <- coords_use[match(names(labels), coords_use$Barcode), , drop = FALSE]

  labels_sm <- spatial_smooth_labels(labels, coords_use, tolerance, knn_k)

  list(
    cluster1 = names(labels_sm)[labels_sm == "cluster1"],
    cluster2 = names(labels_sm)[labels_sm == "cluster2"],
    labels  = labels_sm,
    required_majority = max(0.5, 1 - 0.5 * max(0, min(1, tolerance))),
    n_iter = max(1, ceiling(1 + 2 * max(0, min(1, tolerance))))
  )
}

apply_ev_count_filter_within_cluster <- function(cluster_bcs, gene_count_vec, mode, value, direction, consider_zero = TRUE) {
  if (!length(cluster_bcs)) return(character(0))
  cluster_bcs <- unique(norm_barcode(cluster_bcs))
  v <- gene_count_vec[cluster_bcs]
  v[is.na(v)] <- 0
  if (!isTRUE(consider_zero)) v <- v[v > 0]
  if (!length(v)) return(character(0))
  select_barcodes_by_rule(v, mode, value, direction = direction)
}

split_barcodes_by_ev_for_subcluster <- function(parent_bcs, gene_count_vec,
                                               method = c("auto","value","threshold"),
                                               expr_value, noexpr_value,
                                               pos_threshold = 1, neg_threshold = 0,
                                               drop_other = TRUE,
                                               fallback_to_threshold = TRUE) {
  method <- match.arg(method)
  parent_bcs <- unique(norm_barcode(parent_bcs))
  if (!length(parent_bcs)) {
    return(list(pos = character(0), neg = character(0), other = character(0),
                method_used = method, unique_values = numeric(0)))
  }

  v <- gene_count_vec[parent_bcs]
  v[is.na(v)] <- 0
  u <- sort(unique(v))

  method_used <- method
  if (method_used == "auto") {
    has_expr   <- any(u == expr_value)
    has_noexpr <- any(u == noexpr_value)
    if (has_expr && has_noexpr) method_used <- "value" else method_used <- "threshold"
  }

  do_split <- function(m) {
    if (m == "value") {
      pos <- names(v)[v == expr_value]
      neg <- names(v)[v == noexpr_value]
      other <- setdiff(names(v), union(pos, neg))
    } else {
      pos <- names(v)[v >= pos_threshold]
      neg <- names(v)[v <= neg_threshold]
      other <- setdiff(names(v), union(pos, neg))
    }
    list(pos = unique(pos), neg = unique(neg), other = unique(other))
  }

  sp <- do_split(method_used)

  if (isTRUE(fallback_to_threshold) &&
      method_used == "value" &&
      length(sp$pos) == 0 && length(sp$neg) == 0 &&
      (any(v == 0) || any(v > 0))) {
    sp <- do_split("threshold")
    method_used <- "value->threshold"
  }

  list(pos = sp$pos, neg = sp$neg, other = sp$other,
       method_used = method_used, unique_values = u)
}


# =========================================================
# 7) DESeq2
# =========================================================
run_deseq2_between_groups <- function(mat, sample_name, analysis_tag,
                                     g1_barcodes, g2_barcodes,
                                     g1_name = "group1", g2_name = "group2",
                                     out_dir, warn_file = NULL) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  tag <- safe_tag(analysis_tag)

  message("    [DESeq2] Harmonize barcodes ...")
  g1 <- harmonize_barcodes(g1_barcodes, colnames(mat))
  g2 <- harmonize_barcodes(g2_barcodes, colnames(mat))
  all_sel <- unique(c(g1, g2))
  keep_barcodes <- intersect(colnames(mat), all_sel)

  message("    [DESeq2] Matched spots: ", length(keep_barcodes))
  append_log(warn_file, c(paste0("[INFO][", Sys.time(), "][DESeq2] matched_spots=", length(keep_barcodes))))

  if (length(keep_barcodes) < DE_MIN_TOTAL_SPOTS) {
    writeLines(paste0("DESeq2 skipped: matched spots too few: ", length(keep_barcodes)),
               file.path(out_dir, paste0(sample_name, "_", tag, "_DE_ERROR.txt")))
    return(invisible(FALSE))
  }

  group <- ifelse(keep_barcodes %in% g1, g1_name, g2_name)
  if (sum(group == g1_name) < DE_MIN_SPOTS_PER_GROUP || sum(group == g2_name) < DE_MIN_SPOTS_PER_GROUP) {
    writeLines(paste0("DESeq2 skipped: spots per group too few: ",
                      g1_name, "=", sum(group==g1_name), " ",
                      g2_name, "=", sum(group==g2_name)),
               file.path(out_dir, paste0(sample_name, "_", tag, "_DE_ERROR.txt")))
    return(invisible(FALSE))
  }

  sub <- mat[, keep_barcodes, drop = FALSE]
  counts_m <- as.matrix(sub)
  storage.mode(counts_m) <- "numeric"
  counts_m <- round(counts_m)
  storage.mode(counts_m) <- "integer"

  rs <- rowSums(counts_m)
  keep_rows <- which(rs >= DE_MIN_ROW_SUM_COUNTS)
  counts_m <- counts_m[keep_rows, , drop = FALSE]

  if (is.finite(DESEQ2_MAX_GENES) && !is.na(DESEQ2_MAX_GENES)) {
    nmax <- as.integer(DESEQ2_MAX_GENES)
    if (nrow(counts_m) > nmax) {
      ord <- order(rowSums(counts_m), decreasing = TRUE)
      counts_m <- counts_m[ord[seq_len(nmax)], , drop = FALSE]
      append_log(warn_file, c(paste0("[INFO][", Sys.time(), "][DESeq2] Apply DESEQ2_MAX_GENES=", nmax)))
    }
  }

  coldata <- data.frame(
    spot = colnames(counts_m),
    group = factor(group, levels = c(g1_name, g2_name))
  )
  rownames(coldata) <- coldata$spot

  dds <- with_warning_log_immediate(
    DESeq2::DESeqDataSetFromMatrix(countData = counts_m, colData = coldata, design = ~ group),
    warn_file, stage = "DESeq2::DESeqDataSetFromMatrix"
  )
  dds <- with_warning_log_immediate(
    DESeq2::estimateSizeFactors(dds, type = DESEQ2_SIZEFACTOR_TYPE),
    warn_file, stage = paste0("DESeq2::estimateSizeFactors(", DESEQ2_SIZEFACTOR_TYPE, ")")
  )
  dds <- with_warning_log_immediate(
    suppressMessages(DESeq2::DESeq(dds, quiet = TRUE, fitType = DESEQ2_FITTYPE)),
    warn_file, stage = "DESeq2::DESeq"
  )

  res <- with_warning_log_immediate(
    DESeq2::results(dds, contrast = c("group", g2_name, g1_name)),
    warn_file, stage = "DESeq2::results"
  )

  res_df <- as.data.frame(res) %>%
    tibble::rownames_to_column("gene_raw") %>%
    mutate(gene_clean = strip_prefix_gene(gene_raw)) %>%
    arrange(padj)

  out_csv <- file.path(out_dir, paste0(sample_name, "_", tag, "_DESeq2_", safe_tag(g2_name), "_vs_", safe_tag(g1_name), ".csv"))
  readr::write_csv(res_df, out_csv)

  writeLines(c(
    paste0("Sample: ", sample_name),
    paste0("Tag: ", analysis_tag),
    paste0(g1_name, " spots: ", sum(group==g1_name)),
    paste0(g2_name, " spots: ", sum(group==g2_name)),
    paste0("Genes used: ", nrow(counts_m)),
    paste0("sizefactor_type: ", DESEQ2_SIZEFACTOR_TYPE),
    paste0("fitType: ", DESEQ2_FITTYPE),
    paste0("Output: ", out_csv)
  ), file.path(out_dir, paste0(sample_name, "_", tag, "_DE_info.txt")))

  append_log(warn_file, c(paste0("[INFO][", Sys.time(), "][DESeq2] Done: ", out_csv)))
  invisible(TRUE)
}


# =========================================================
# 8) Violin
# =========================================================
make_violin_plots_pdf_v5 <- function(so_full, sample_name, analysis_tag,
                                     g1_barcodes, g2_barcodes,
                                     g1_name = "group1", g2_name = "group2",
                                     col_g1 = COL_CLUSTER1, col_g2 = COL_CLUSTER2,
                                     out_pdf,
                                     plot_genes = PLOT_GENES,
                                     drop_zero = VIOLIN_DROP_ZERO_EXPR,
                                     warn_file = NULL) {
  counts_layer <- get_counts_layer(so_full, assay = "RNA")

  message("    [Violin] Harmonize barcodes ...")
  g1 <- harmonize_barcodes(g1_barcodes, colnames(counts_layer))
  g2 <- harmonize_barcodes(g2_barcodes, colnames(counts_layer))
  keep <- intersect(unique(c(g1, g2)), colnames(counts_layer))

  message("    [Violin] Matched spots: ", length(keep))
  if (length(keep) < DE_MIN_TOTAL_SPOTS) {
    writeLines(
      paste0("Violin skipped: matched spots too few (", length(keep), ")."),
      sub("\\.pdf$", "_VIOLIN_ERROR.txt", out_pdf)
    )
    return(invisible(FALSE))
  }

  grp <- ifelse(keep %in% g1, g1_name, g2_name)
  grp <- factor(grp, levels = c(g1_name, g2_name))

  feature_map <- lapply(plot_genes, function(g) {
    f <- find_feature_in_mat(rownames(counts_layer), g)
    data.frame(requested = g, feature_in_mat = f, stringsAsFactors = FALSE)
  }) %>% bind_rows()

  missing_genes <- feature_map %>% filter(is.na(feature_in_mat)) %>% pull(requested)
  present <- feature_map %>% filter(!is.na(feature_in_mat))
  if (!nrow(present)) {
    writeLines(
      paste0("Violin skipped: none of requested genes found in matrix. Missing: ", paste(missing_genes, collapse = ", ")),
      sub("\\.pdf$", "_VIOLIN_ERROR.txt", out_pdf)
    )
    return(invisible(FALSE))
  }

  build_long_df <- function(value_type = c("expr","count")) {
    value_type <- match.arg(value_type)

    if (value_type == "expr") {
      lst <- lapply(seq_len(nrow(present)), function(i) {
        req  <- present$requested[i]
        feat <- present$feature_in_mat[i]

        v <- FetchData(so_full, vars = feat)
        v <- v[keep, , drop = FALSE]
        colnames(v)[1] <- "value"
        data.frame(group = grp, value = as.numeric(v$value), gene = req, stringsAsFactors = FALSE)
      })
      df_long <- bind_rows(lst)
    } else {
      lst <- lapply(seq_len(nrow(present)), function(i) {
        req  <- present$requested[i]
        feat <- present$feature_in_mat[i]

        cnt <- as.numeric(counts_layer[feat, keep])
        data.frame(group = grp, value = cnt, gene = req, stringsAsFactors = FALSE)
      })
      df_long <- bind_rows(lst)
    }

    df_long$gene <- factor(df_long$gene, levels = present$requested)
    if (isTRUE(drop_zero)) df_long <- df_long %>% filter(value != 0)
    df_long
  }

  df_expr  <- build_long_df("expr")
  df_count <- build_long_df("count")

  if (!nrow(df_expr)) {
    writeLines(
      paste0("Violin skipped: all values filtered out (drop_zero=TRUE)."),
      sub("\\.pdf$", "_VIOLIN_ERROR.txt", out_pdf)
    )
    return(invisible(FALSE))
  }

  cols <- c(setNames(col_g1, g1_name), setNames(col_g2, g2_name))

  base_theme <- theme_bw(base_size = 11) +
    theme(
      plot.title = element_text(face = "bold", size = 12),
      axis.title.x = element_blank(),
      panel.grid.major.x = element_blank()
    )

  p_expr_all <- ggplot(df_expr, aes(x = gene, y = value, fill = group)) +
    geom_violin(position = position_dodge(width = 0.8), width = 0.75, alpha = 0.85, trim = TRUE) +
    geom_jitter(aes(color = group),
                position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.8),
                size = 0.8, alpha = 0.55) +
    scale_fill_manual(values = cols) +
    scale_color_manual(values = cols) +
    labs(
      title = paste0(sample_name, " | LogNormalized | ", analysis_tag),
      subtitle = if (isTRUE(drop_zero)) "Filtered: value==0 removed per-gene" else NULL,
      y = "LogNormalized expression"
    ) +
    base_theme +
    theme(axis.text.x = element_text(angle = 35, hjust = 1))

  if (length(missing_genes)) {
    p_expr_all <- p_expr_all + labs(caption = paste0("Not found: ", paste(missing_genes, collapse = ", ")))
  }

  plots_each <- lapply(levels(df_expr$gene), function(g) {
    d <- df_expr %>% filter(gene == g)
    ggplot(d, aes(x = group, y = value, fill = group)) +
      geom_violin(width = 0.85, alpha = 0.85, trim = TRUE) +
      geom_jitter(aes(color = group), width = 0.15, size = 0.8, alpha = 0.55) +
      scale_fill_manual(values = cols) +
      scale_color_manual(values = cols) +
      labs(title = g, y = "LogNormalized expression") +
      base_theme +
      theme(legend.position = "none", plot.title = element_text(size = 11, face = "bold"))
  })
  ncol_grid <- ifelse(length(plots_each) >= 4, 4, length(plots_each))
  p_expr_grid <- cowplot::plot_grid(plotlist = plots_each, ncol = ncol_grid, align = "hv")

  if (!nrow(df_count)) {
    p_count_all <- ggplot() + theme_void() +
      labs(title = paste0(sample_name, " | Raw Count | (empty after filtering zeros)"))
  } else {
    p_count_all <- ggplot(df_count, aes(x = gene, y = value, fill = group)) +
      geom_violin(position = position_dodge(width = 0.8), width = 0.75, alpha = 0.85, trim = TRUE) +
      geom_jitter(aes(color = group),
                  position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.8),
                  size = 0.8, alpha = 0.55) +
      scale_fill_manual(values = cols) +
      scale_color_manual(values = cols) +
      labs(
        title = paste0(sample_name, " | Raw Count | ", analysis_tag),
        subtitle = if (isTRUE(drop_zero)) "Filtered: value==0 removed per-gene" else NULL,
        y = "Raw count"
      ) +
      base_theme +
      theme(axis.text.x = element_text(angle = 35, hjust = 1))
  }

  message("    [Violin] Write PDF -> ", out_pdf)
  dir.create(dirname(out_pdf), recursive = TRUE, showWarnings = FALSE)
  pdf(out_pdf, width = PDF_WIDTH, height = PDF_HEIGHT, onefile = TRUE)
  print(p_expr_all)
  print(p_expr_grid)
  print(p_count_all)
  dev.off()

  readr::write_csv(feature_map, sub("\\.pdf$", "_gene_feature_map.csv", out_pdf))
  invisible(TRUE)
}


# =========================================================

# =========================================================
make_spatial_cluster_pdfs_v5 <- function(
  so_full, coords_in, sample_name, ev_gene,
  cluster1_bcs, cluster2_bcs,
  ev_gene_count_vec,
  out_pdf_std_c1, out_pdf_std_c2,
  out_pdf_grid_c1, out_pdf_grid_c2,
  out_pdf_fullpages_c1, out_pdf_fullpages_c2,
  warn_file = NULL
) {
  pdf_device <- .make_pdf_device()

  coords_in <- coords_in %>% mutate(Barcode = norm_barcode(Barcode))
  img_meta <- attr(coords_in, "img_meta")
  if (is.null(img_meta)) stop("coords_in img_meta")
  img <- img_meta$img; img_w <- img_meta$width; img_h <- img_meta$height

  cluster1_bcs <- unique(norm_barcode(cluster1_bcs))
  cluster2_bcs <- unique(norm_barcode(cluster2_bcs))

  df_clusters <- coords_in %>%
    transmute(
      Barcode = Barcode,
      group = dplyr::case_when(
        Barcode %in% cluster1_bcs ~ "cluster1",
        Barcode %in% cluster2_bcs ~ "cluster2",
        TRUE ~ NA_character_
      ),
      x_img = x_img,
      y_img = y_img
    ) %>%
    filter(!is.na(group))

  p_cluster_map <- plot_spatial_groups_discrete(
    img = img, img_w = img_w, img_h = img_h,
    df_all_spots = coords_in,
    df_groups = df_clusters,
    group_col = "group",
    title = paste0(sample_name, " | EV=", ev_gene, " | Cluster Regions"),
    palette_named = c(cluster1 = COL_CLUSTER1, cluster2 = COL_CLUSTER2),
    legend_title = "Cluster"
  )

  build_ev_page_rawcount <- function(cluster_label, cluster_bcs) {
    v <- ev_gene_count_vec
    names(v) <- norm_barcode(names(v))
    cluster_bcs <- norm_barcode(cluster_bcs)
    vv <- v[cluster_bcs]
    vv[is.na(vv)] <- 0
    df_expr <- data.frame(Barcode = names(vv), value = as.numeric(vv), stringsAsFactors = FALSE)
    df_val <- coords_in %>% inner_join(df_expr, by = "Barcode")
    if (!nrow(df_val)) {
      return(ggplot() + theme_void() + labs(title = paste0(sample_name, " | EV=", ev_gene, " | ", cluster_label, " | No matched spots")))
    }
    if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_val <- df_val %>% filter(value != 0)

    plot_spatial_continuous(
      img = img, img_w = img_w, img_h = img_h,
      df_all_spots = coords_in,
      df_value = df_val,
      value_col = "value",
      title = paste0(sample_name, " | EV=", ev_gene, " | ", cluster_label, " | EV Raw Count (from bas)"),
      legend_title = "Count",
      show_legend = TRUE,
      spot_size = SPOT_SIZE_SPATIAL
    )
  }

  feature_map <- lapply(PLOT_GENES, function(g) {
    f <- find_feature_in_mat(rownames(so_full[["RNA"]]), g)
    data.frame(requested = g, feature_in_mat = f, stringsAsFactors = FALSE)
  }) %>% bind_rows()
  present <- feature_map %>% filter(!is.na(feature_in_mat))
  missing <- feature_map %>% filter(is.na(feature_in_mat)) %>% pull(requested)

  build_gene_fullpage_plot <- function(req_gene, feat_gene, cluster_label, cluster_bcs) {
    df_expr <- FetchData(so_full, vars = feat_gene)
    df_expr$Barcode <- norm_barcode(rownames(df_expr))
    colnames(df_expr)[1] <- "value"
    df_expr <- df_expr %>% filter(Barcode %in% cluster_bcs)
    df_val <- coords_in %>% inner_join(df_expr, by = "Barcode")
    if (!nrow(df_val)) return(ggplot() + theme_void() + labs(title = paste0(req_gene, " (no spots)")))
    if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_val <- df_val %>% filter(value != 0)

    plot_spatial_continuous(
      img = img, img_w = img_w, img_h = img_h,
      df_all_spots = coords_in,
      df_value = df_val,
      value_col = "value",
      title = paste0(sample_name, " | EV=", ev_gene, " | ", cluster_label, " | ", req_gene),
      legend_title = "LogNormalized",
      show_legend = TRUE,
      spot_size = SPOT_SIZE_SPATIAL
    )
  }

  build_grid_page <- function(cluster_label, cluster_bcs) {
    if (!nrow(present)) {
      return(ggplot() + theme_void() + labs(title = paste0(sample_name, " | ", cluster_label, " | None of PLOT_GENES found in matrix")))
    }

    spot_grid <- SPOT_SIZE_SPATIAL * max(0.10, as.numeric(HE_GRID_SPOT_SIZE_FACTOR))

    plots <- lapply(seq_len(nrow(present)), function(i) {
      req  <- present$requested[i]
      feat <- present$feature_in_mat[i]

      df_expr <- FetchData(so_full, vars = feat)
      df_expr$Barcode <- norm_barcode(rownames(df_expr))
      colnames(df_expr)[1] <- "value"
      df_expr <- df_expr %>% filter(Barcode %in% cluster_bcs)
      df_val <- coords_in %>% inner_join(df_expr, by = "Barcode")
      if (!nrow(df_val)) return(ggplot() + theme_void() + labs(title = paste0(req, " (no spots)")))
      if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_val <- df_val %>% filter(value != 0)

      plot_spatial_continuous(
        img = img, img_w = img_w, img_h = img_h,
        df_all_spots = coords_in,
        df_value = df_val,
        value_col = "value",
        title = req,
        legend_title = "LogNormalized",
        show_legend = FALSE,
        spot_size = spot_grid
      ) + theme(plot.title = element_text(size = 11, face = "bold", hjust = 0.5))
    })

    n_plots <- length(plots)
    ncol_grid <- min(as.integer(HE_GRID_MAX_COL), n_plots)
    ncol_grid <- max(1, ncol_grid)

    p_leg_src <- plots[[1]] + theme(legend.position = "right")
    legend <- cowplot::get_legend(p_leg_src + theme(legend.position = "right"))

    grid_plots <- cowplot::plot_grid(plotlist = plots, ncol = ncol_grid, align = "hv")

    title_bar <- cowplot::ggdraw() +
      cowplot::draw_label(
        paste0(sample_name, " | EV=", ev_gene, " | ", cluster_label, " | PLOT_GENES"),
        fontface = "bold", size = 16, x = 0.5, hjust = 0.5
      )

    note_txt <- if (length(missing)) paste0("Not found: ", paste(missing, collapse = ", ")) else ""
    footer <- cowplot::ggdraw() + cowplot::draw_label(note_txt, size = 10, x = 0, hjust = 0)

    cowplot::plot_grid(
      title_bar,
      cowplot::plot_grid(grid_plots, legend, rel_widths = c(1, 0.12)),
      footer,
      ncol = 1,
      rel_heights = c(0.08, 0.86, 0.06)
    )
  }

  .write_pdf_pages <- function(out_pdf, width_cm, height_cm, plot_list) {
    dir.create(dirname(out_pdf), recursive = TRUE, showWarnings = FALSE)
    pdf_device(out_pdf, width = width_cm/2.54, height = height_cm/2.54, onefile = TRUE)
    for (p in plot_list) print(p)
    dev.off()
  }

  write_std_pdf <- function(cluster_label, out_pdf) {
    if (cluster_label == "cluster1") {
      .write_pdf_pages(out_pdf, HE_STD_PLOT_WIDTH_CM, HE_STD_PLOT_HEIGHT_CM, list(
        p_cluster_map,
        build_ev_page_rawcount("cluster1", cluster1_bcs)
      ))
    } else {
      .write_pdf_pages(out_pdf, HE_STD_PLOT_WIDTH_CM, HE_STD_PLOT_HEIGHT_CM, list(
        p_cluster_map,
        build_ev_page_rawcount("cluster2", cluster2_bcs)
      ))
    }
  }

  write_grid_pdf <- function(cluster_label, cluster_bcs, out_pdf) {
    .write_pdf_pages(out_pdf, HE_GRID_PLOT_WIDTH_CM, HE_GRID_PLOT_HEIGHT_CM, list(
      build_grid_page(cluster_label, cluster_bcs)
    ))
  }

  write_fullpages_pdf <- function(cluster_label, cluster_bcs, out_pdf) {
    plots <- list()
    plots[[length(plots)+1]] <- build_ev_page_rawcount(cluster_label, cluster_bcs)

    if (!nrow(present)) {
      plots[[length(plots)+1]] <- ggplot() + theme_void() +
        labs(title = paste0(sample_name, " | ", cluster_label, " | None of PLOT_GENES found in matrix"))
    } else {
      for (i in seq_len(nrow(present))) {
        req  <- present$requested[i]
        feat <- present$feature_in_mat[i]
        plots[[length(plots)+1]] <- build_gene_fullpage_plot(req, feat, cluster_label, cluster_bcs)
      }
    }
    .write_pdf_pages(out_pdf, HE_FULL_PLOT_WIDTH_CM, HE_FULL_PLOT_HEIGHT_CM, plots)
  }

  with_warning_log_immediate(write_std_pdf("cluster1", out_pdf_std_c1), warn_file, stage = "HE::STD_cluster1")
  with_warning_log_immediate(write_std_pdf("cluster2", out_pdf_std_c2), warn_file, stage = "HE::STD_cluster2")
  with_warning_log_immediate(write_grid_pdf("cluster1", cluster1_bcs, out_pdf_grid_c1), warn_file, stage = "HE::GRID_cluster1")
  with_warning_log_immediate(write_grid_pdf("cluster2", cluster2_bcs, out_pdf_grid_c2), warn_file, stage = "HE::GRID_cluster2")
  with_warning_log_immediate(write_fullpages_pdf("cluster1", cluster1_bcs, out_pdf_fullpages_c1), warn_file, stage = "HE::FULL_cluster1")
  with_warning_log_immediate(write_fullpages_pdf("cluster2", cluster2_bcs, out_pdf_fullpages_c2), warn_file, stage = "HE::FULL_cluster2")

  invisible(TRUE)
}


# =========================================================

# =========================================================
resolve_overall_gene_features <- function(mat_rownames, requested_genes) {
  rn_raw <- mat_rownames
  rn_clean <- strip_prefix_gene(rn_raw)

  out <- list()
  missing_base <- character(0)

  for (g in requested_genes) {
    g_up <- toupper(g)

    if (g_up == "ITGA") {
      idx <- grep("^ITGA\\d", toupper(rn_clean))
      if (!length(idx)) missing_base <- c(missing_base, g)
      else for (j in idx) out[[length(out)+1]] <- data.frame(
        requested = "ITGA", display_gene = rn_clean[j], feature_in_mat = rn_raw[j],
        stringsAsFactors = FALSE
      )
      next
    }

    if (g_up == "ITGB") {
      idx <- grep("^ITGB\\d", toupper(rn_clean))
      if (!length(idx)) missing_base <- c(missing_base, g)
      else for (j in idx) out[[length(out)+1]] <- data.frame(
        requested = "ITGB", display_gene = rn_clean[j], feature_in_mat = rn_raw[j],
        stringsAsFactors = FALSE
      )
      next
    }

    feat <- find_feature_in_mat(rn_raw, g)
    if (is.na(feat)) missing_base <- c(missing_base, g)
    else out[[length(out)+1]] <- data.frame(
      requested = g, display_gene = strip_prefix_gene(feat), feature_in_mat = feat,
      stringsAsFactors = FALSE
    )
  }

  df <- if (length(out)) bind_rows(out) else data.frame(
    requested = character(0), display_gene = character(0), feature_in_mat = character(0),
    stringsAsFactors = FALSE
  )

  df$requested <- factor(df$requested, levels = requested_genes)
  df <- df %>% arrange(requested, display_gene)

  list(map = df, missing_requested = unique(missing_base))
}

calc_overall_pdf_size_cm <- function(n_plots, max_col,
                                     panel_w_cm, panel_h_cm,
                                     legend_w_cm = OVERALL_LEGEND_W_CM,
                                     title_h_cm  = OVERALL_TITLE_H_CM,
                                     footer_h_cm = OVERALL_FOOTER_H_CM,
                                     margin_w_cm = OVERALL_MARGIN_W_CM,
                                     margin_h_cm = OVERALL_MARGIN_H_CM) {
  n_plots <- as.integer(n_plots)
  if (!is.finite(n_plots) || n_plots < 1) {
    return(list(width_cm = panel_w_cm + legend_w_cm + 2*margin_w_cm,
                height_cm = panel_h_cm + title_h_cm + footer_h_cm + 2*margin_h_cm,
                ncol = 1, nrow = 1))
  }
  ncol <- min(as.integer(max_col), n_plots)
  ncol <- max(1, ncol)
  nrow <- ceiling(n_plots / ncol)

  width_cm  <- ncol * panel_w_cm + legend_w_cm + 2 * margin_w_cm
  height_cm <- nrow * panel_h_cm + title_h_cm + footer_h_cm + 2 * margin_h_cm

  list(width_cm = width_cm, height_cm = height_cm, ncol = ncol, nrow = nrow)
}


# =========================================================
# 10.1) V5.5:OVERALL EV-region ring+fill(PD-L1 EV / ICAM EV / Co-express)
# =========================================================
run_overall_evregion_ringfill_one_sample <- function(sample_name, out_sample_dir, warn_file,
                                                    so_full, coords_in, gene_count_obj, ab_file) {
  if (!isTRUE(RUN_OVERALL_EVREGION_RINGFILL) || !isTRUE(STEP_RUN_OVERALL_EVREGION)) return(invisible(NULL))
  if (is.null(coords_in)) return(invisible(NULL))
  if (is.null(gene_count_obj) || is.null(gene_count_obj$wide_df)) return(invisible(NULL))
  if (is.null(ab_file) || is.na(ab_file) || !file.exists(ab_file)) {
    append_log(warn_file, c(paste0("[WARN][", Sys.time(), "][EVREGION] celltype_abundance file missing: ", ab_file)))
  }

  img_meta <- attr(coords_in, "img_meta")
  img <- img_meta$img; img_w <- img_meta$width; img_h <- img_meta$height
  # use same grid spot sizing as OVERALL GeneEV covis outline to reduce overlap
  spot_size <- SPOT_SIZE_SPATIAL * max(0.10, OVERALL_GRID_SPOT_SIZE_FACTOR)

  # --- EV1 / EV2 vectors (from bas) with fuzzy matching ---
  ev1_res <- get_gene_count_vec_fuzzy(gene_count_obj$wide_df, OVERALL_EVREGION_EV1, coords_in$Barcode)
  ev2_res <- get_gene_count_vec_fuzzy(gene_count_obj$wide_df, OVERALL_EVREGION_EV2, coords_in$Barcode)
  ev1_vec <- ev1_res$vec; ev2_vec <- ev2_res$vec

  ev1_name_used <- ev1_res$hit_col %||% OVERALL_EVREGION_EV1
  ev2_name_used <- ev2_res$hit_col %||% OVERALL_EVREGION_EV2

  df_ev <- data.frame(
    Barcode = coords_in$Barcode,
    ev1_value = as.numeric(ev1_vec[coords_in$Barcode]),
    ev2_value = as.numeric(ev2_vec[coords_in$Barcode]),
    stringsAsFactors = FALSE
  )
  df_ev$ev1_value[is.na(df_ev$ev1_value)] <- 0
  df_ev$ev2_value[is.na(df_ev$ev2_value)] <- 0

  # EV-high masks
  ev1_hi <- .resolve_ev_hi_lo(
    ev_vec = df_ev$ev1_value,
    mode = OVERALL_EVREGION_EV_MODE,
    expr_value = OVERALL_EVREGION_EV_EXPR_VALUE,
    noexpr_value = OVERALL_EVREGION_EV_NOEXPR_VALUE,
    pos_threshold = OVERALL_EVREGION_EV_POS_THRESHOLD,
    neg_threshold = OVERALL_EVREGION_EV_NEG_THRESHOLD
  )$hi

  ev2_hi <- .resolve_ev_hi_lo(
    ev_vec = df_ev$ev2_value,
    mode = OVERALL_EVREGION_EV_MODE,
    expr_value = OVERALL_EVREGION_EV_EXPR_VALUE,
    noexpr_value = OVERALL_EVREGION_EV_NOEXPR_VALUE,
    pos_threshold = OVERALL_EVREGION_EV_POS_THRESHOLD,
    neg_threshold = OVERALL_EVREGION_EV_NEG_THRESHOLD
  )$hi

  # V5.5 fix:


  bcs_ev1_region <- df_ev$Barcode[which(ev1_hi)]
  bcs_ev2_region <- df_ev$Barcode[which(ev2_hi)]
  bcs_coexpr     <- df_ev$Barcode[which(ev1_hi & ev2_hi)]

  # targets to plot
  fill_mode <- tolower(as.character(OVERALL_EVREGION_FILL_MODE %||% "abundance"))
  targets <- character(0)
  if (fill_mode == "gene") {
    targets <- OVERALL_EVREGION_FILL_GENES
  } else {
    targets <- OVERALL_EVREGION_FILL_CELLTYPES
  }
  targets <- unique(targets)
  if (!length(targets)) targets <- if (fill_mode == "gene") c("CD8A") else c("CD8T")

  pdf_device <- .make_pdf_device()
  out_pdfs <- character(0)

  for (tg in targets) {
    tg_tag <- safe_tag(tg)
    out_pdf <- file.path(out_sample_dir, paste0(sample_name, "_EVregion_", tg_tag, OVERALL_EVREGION_PDF_SUFFIX))

    if (isTRUE(SKIP_IF_OUTPUT_EXISTS) && file.exists(out_pdf)) {
      message("  [EVREGION] Skip existing: ", out_pdf)
      out_pdfs <- c(out_pdfs, out_pdf)
      next
    }

    # build fill values
    if (fill_mode == "gene") {
      feat <- find_feature_in_mat(rownames(so_full[["RNA"]]), tg)
      if (is.na(feat)) {
        append_log(warn_file, c(paste0("[WARN][", Sys.time(), "][EVREGION] gene not found in h5: ", tg)))
        next
      }
      df_fill0 <- FetchData(so_full, vars = feat)
      df_fill0$Barcode <- norm_barcode(rownames(df_fill0))
      colnames(df_fill0)[1] <- "fill_value"
      fill_legend <- paste0("Gene(LogNorm): ", tg)
    } else {
      v <- tryCatch(read_celltype_abundance_vec(ab_file, tg), error = function(e) {
        append_log(warn_file, c(paste0("[WARN][", Sys.time(), "][EVREGION] celltype not found: ", tg, " | ", conditionMessage(e))))
        NULL
      })
      if (is.null(v)) next
      df_fill0 <- data.frame(Barcode = names(v), fill_value = as.numeric(v), stringsAsFactors = FALSE)
      fill_legend <- paste0("Celltype: ", tg)
    }

    df_fill0$Barcode <- norm_barcode(df_fill0$Barcode)
    df_fill0$fill_value <- as.numeric(df_fill0$fill_value)
    df_fill0$fill_value[!is.finite(df_fill0$fill_value)] <- NA_real_

    # merge coords + EV + fill
    df_merge <- coords_in %>%
      inner_join(df_ev, by = "Barcode") %>%
      inner_join(df_fill0, by = "Barcode")

    # helpers to build plots for each region
    make_one <- function(region_label, bcs_region, ring_value_col, ring_by_value, ring_fixed) {
      df_r <- df_merge %>% filter(Barcode %in% bcs_region)
      if (!nrow(df_r)) return(ggplot() + theme_void() + labs(title = paste0(region_label, " (no spots)")))

      df_fill <- df_r %>% select(Barcode, x_img, y_img, fill_value)
      df_ring <- df_r %>% select(Barcode, x_img, y_img, ring_value = .data[[ring_value_col]])

      plot_spatial_evregion_ringfill(
        img = img, img_w = img_w, img_h = img_h,
        df_all_spots = coords_in,
        df_fill = df_fill,
        df_ring = df_ring,
        fill_col = "fill_value",
        ring_col = "ring_value",
        title = paste0(sample_name, " | ", fill_legend, " | ", region_label),
        fill_legend = fill_legend,
        ring_legend = "EV count",
        ring_color_by_value = ring_by_value,
        ring_color_option = OVERALL_EVREGION_RING_COLOR_OPTION,
        ring_color_fixed = ring_fixed,
        ring_stroke = OVERALL_EVREGION_RING_STROKE,
        spot_size = spot_size,
        show_legend = TRUE
      )
    }

    p1 <- make_one(
      region_label = paste0(ev1_name_used, " EV region"),
      bcs_region = bcs_ev1_region,
      ring_value_col = "ev1_value",
      ring_by_value = isTRUE(OVERALL_EVREGION_RING_COLOR_BY_VALUE),
      ring_fixed = "#e41a1c"
    )
    p2 <- make_one(
      region_label = paste0(ev2_name_used, " EV region"),
      bcs_region = bcs_ev2_region,
      ring_value_col = "ev2_value",
      ring_by_value = isTRUE(OVERALL_EVREGION_RING_COLOR_BY_VALUE),
      ring_fixed = "#377eb8"
    )
    p3 <- make_one(
      region_label = paste0("Co-express region (", ev1_name_used, " & ", ev2_name_used, ")"),
      bcs_region = bcs_coexpr,
      ring_value_col = "ev1_value",
      ring_by_value = FALSE,
      ring_fixed = OVERALL_EVREGION_RING_COLOR_FIXED_COEXPR
    )

    dir.create(dirname(out_pdf), recursive = TRUE, showWarnings = FALSE)
    pdf_device(out_pdf, width = HE_STD_PLOT_WIDTH_CM/2.54, height = HE_STD_PLOT_HEIGHT_CM/2.54, onefile = TRUE)
    print(p1); print(p2); print(p3)
    dev.off()

    out_pdfs <- c(out_pdfs, out_pdf)
  }

  invisible(out_pdfs)
}


# =========================================================

# =========================================================
.safe_filename_tag <- function(x) {
  x <- as.character(x %||% "")
  x <- gsub("[^A-Za-z0-9]+", "_", x)
  x <- gsub("^_+|_+$", "", x)
  if (!nzchar(x)) "NA" else x
}

.make_violin_box_scatter <- function(df, group_col, y_col, title, ylab = NULL,
                                    add_signif = TRUE,
                                    test_method = c("wilcox"),
                                    p_adjust_method = "BH") {
  if (!nrow(df)) return(NULL)

  test_method <- match.arg(test_method)

  df[[group_col]] <- as.character(df[[group_col]])
  df[[y_col]] <- suppressWarnings(as.numeric(df[[y_col]]))
  df <- df[is.finite(df[[y_col]]) & !is.na(df[[group_col]]) & nzchar(df[[group_col]]), , drop = FALSE]
  if (!nrow(df)) return(NULL)

  # keep level order as they appear
  df[[group_col]] <- factor(df[[group_col]], levels = unique(df[[group_col]]))
  lv <- levels(df[[group_col]])

  # basic violin + box + scatter
  p <- ggplot2::ggplot(df, ggplot2::aes_string(x = group_col, y = y_col, fill = group_col)) +
    ggplot2::geom_violin(trim = FALSE, scale = "width", alpha = 0.70, color = NA) +
    ggplot2::geom_boxplot(width = 0.18, outlier.shape = NA, alpha = 0.55) +
    ggplot2::geom_jitter(ggplot2::aes_string(color = group_col),
                         width = 0.14, size = 0.85, alpha = 0.55) +
    ggplot2::theme_bw(base_size = 12) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold", hjust = 0.5),
      legend.position = "none",
      panel.grid.major.x = ggplot2::element_blank(),
      plot.caption = ggplot2::element_text(size = 9, hjust = 0)
    ) +
    ggplot2::labs(title = title, x = NULL, y = ylab %||% y_col) +
    ggplot2::scale_color_discrete(drop = FALSE) +
    ggplot2::scale_fill_discrete(drop = FALSE)

  # significance annotations (pairwise, between groups on x-axis)
  if (isTRUE(add_signif) && length(lv) >= 2) {
    # helper: pvalue to stars
    p_to_star <- function(pv) {
      if (!is.finite(pv) || is.na(pv)) return("NA")
      if (pv < 0.0001) return("****")
      if (pv < 0.001)  return("***")
      if (pv < 0.01)   return("**")
      if (pv < 0.05)   return("*")
      "ns"
    }

    # build comparisons
    comps <- combn(lv, 2, simplify = FALSE)

    # compute p-values (wilcox rank-sum)
    p_raw <- vapply(comps, function(cp) {
      d1 <- df[df[[group_col]] == cp[1], y_col]
      d2 <- df[df[[group_col]] == cp[2], y_col]
      if (length(d1) < 2 || length(d2) < 2) return(NA_real_)
      tryCatch({
        stats::wilcox.test(d1, d2, exact = FALSE)$p.value
      }, error = function(e) NA_real_)
    }, numeric(1))

    p_adj <- stats::p.adjust(p_raw, method = p_adjust_method)
    ann  <- vapply(p_adj, p_to_star, character(1))

    # y positions (stacked, avoid overlap)
    yv <- df[[y_col]]
    y_rng <- diff(range(yv, na.rm = TRUE))
    if (!is.finite(y_rng) || y_rng <= 0) y_rng <- max(1, abs(max(yv, na.rm = TRUE)))
    y_base <- max(yv, na.rm = TRUE) + 0.06 * y_rng
    y_step <- 0.08 * y_rng
    y_pos  <- y_base + y_step * seq_along(comps)

    # caption for scientific clarity
    caption_txt <- paste0("Pairwise Wilcoxon rank-sum test (two-sided), p adjusted by ", p_adjust_method, ".")

    p <- p +
      ggsignif::geom_signif(
        comparisons = comps,
        annotations = ann,
        y_position  = y_pos,
        tip_length  = 0.01,
        textsize    = 3.2,
        vjust       = 0.15
      ) +
      ggplot2::coord_cartesian(ylim = c(min(yv, na.rm = TRUE), max(y_pos, na.rm = TRUE) + 0.06 * y_rng)) +
      ggplot2::labs(caption = caption_txt)
  }

  p
}

run_overall_evregion_violin_one_sample <- function(sample_name, out_sample_dir, warn_file,
                                                   coords_in, gene_count_obj, ab_file) {
  if (!isTRUE(RUN_OVERALL_EVREGION_VIOLIN) || !isTRUE(STEP_RUN_OVERALL_EVREGION_VIOLIN)) return(invisible(NULL))
  if (is.null(coords_in)) return(invisible(NULL))
  if (is.null(gene_count_obj) || is.null(gene_count_obj$wide_df)) return(invisible(NULL))
  if (is.null(ab_file) || is.na(ab_file) || !file.exists(ab_file)) {
    append_log(warn_file, c(paste0("[WARN][", Sys.time(), "][EVREGION_VIOLIN] celltype_abundance file missing: ", ab_file)))
    return(invisible(NULL))
  }

  # read abundance vector
  ab_vec <- tryCatch(read_celltype_abundance_vec(ab_file, OVERALL_EVREGION_VIOLIN_CELLTYPE), error = function(e) {
    append_log(warn_file, c(paste0("[ERROR][", Sys.time(), "][EVREGION_VIOLIN] read abundance failed: ", conditionMessage(e))))
    NULL
  })
  if (is.null(ab_vec)) return(invisible(NULL))

  # EV1 / EV2 vectors (from bas) with fuzzy matching
  ev1_res <- get_gene_count_vec_fuzzy(gene_count_obj$wide_df, OVERALL_EVREGION_EV1, coords_in$Barcode)
  ev2_res <- get_gene_count_vec_fuzzy(gene_count_obj$wide_df, OVERALL_EVREGION_EV2, coords_in$Barcode)

  ev1_vec <- ev1_res$vec; ev2_vec <- ev2_res$vec
  ev1_name_used <- ev1_res$hit_col %||% OVERALL_EVREGION_EV1
  ev2_name_used <- ev2_res$hit_col %||% OVERALL_EVREGION_EV2

  df <- data.frame(
    Barcode = coords_in$Barcode,
    abundance = as.numeric(ab_vec[coords_in$Barcode]),
    ev1_value = as.numeric(ev1_vec[coords_in$Barcode]),
    ev2_value = as.numeric(ev2_vec[coords_in$Barcode]),
    stringsAsFactors = FALSE
  )
  df$abundance[is.na(df$abundance)] <- 0
  df$ev1_value[is.na(df$ev1_value)] <- 0
  df$ev2_value[is.na(df$ev2_value)] <- 0

  # EV-high masks
  ev1_hi <- .resolve_ev_hi_lo(
    ev_vec = df$ev1_value,
    mode = OVERALL_EVREGION_EV_MODE,
    expr_value = OVERALL_EVREGION_EV_EXPR_VALUE,
    noexpr_value = OVERALL_EVREGION_EV_NOEXPR_VALUE,
    pos_threshold = OVERALL_EVREGION_EV_POS_THRESHOLD,
    neg_threshold = OVERALL_EVREGION_EV_NEG_THRESHOLD
  )$hi
  ev2_hi <- .resolve_ev_hi_lo(
    ev_vec = df$ev2_value,
    mode = OVERALL_EVREGION_EV_MODE,
    expr_value = OVERALL_EVREGION_EV_EXPR_VALUE,
    noexpr_value = OVERALL_EVREGION_EV_NOEXPR_VALUE,
    pos_threshold = OVERALL_EVREGION_EV_POS_THRESHOLD,
    neg_threshold = OVERALL_EVREGION_EV_NEG_THRESHOLD
  )$hi

  df$ev1_hi <- as.logical(ev1_hi)
  df$ev2_hi <- as.logical(ev2_hi)
  df$coexpr <- df$ev1_hi & df$ev2_hi

  # optional drop zero
  if (isTRUE(OVERALL_EVREGION_VIOLIN_DROP_ZERO)) {
    df <- df[df$abundance != 0, , drop = FALSE]
  }
  if (!nrow(df)) return(invisible(NULL))

  cell_tag <- .safe_filename_tag(OVERALL_EVREGION_VIOLIN_CELLTYPE)
  out_pdf <- file.path(out_sample_dir, paste0(sample_name, "_EVregion_", cell_tag, "_violin_V55.pdf"))
  if (isTRUE(SKIP_IF_OUTPUT_EXISTS) && file.exists(out_pdf)) return(invisible(out_pdf))

  # ---- Plot 1: EV1+ vs EV1- ----
  df1 <- df
  df1$Group <- ifelse(df1$ev1_hi, paste0(ev1_name_used, "+ region"), paste0(ev1_name_used, "- region"))
  p1 <- .make_violin_box_scatter(df1, "Group", "abundance",
                                 title = paste0(sample_name, " | CD8T abundance | ", ev1_name_used, "+ vs -"),
                                 ylab = "CD8T abundance")

  # ---- Plot 2: EV2+ vs EV2- ----
  df2 <- df
  df2$Group <- ifelse(df2$ev2_hi, paste0(ev2_name_used, "+ region"), paste0(ev2_name_used, "- region"))
  p2 <- .make_violin_box_scatter(df2, "Group", "abundance",
                                 title = paste0(sample_name, " | CD8T abundance | ", ev2_name_used, "+ vs -"),
                                 ylab = "CD8T abundance")

  # ---- Plot 3: Co-express vs Non-coexpress ----
  df3 <- df
  df3$Group <- ifelse(df3$coexpr, paste0(ev1_name_used, "&", ev2_name_used, " co-express region"),
                      paste0("Non-", ev1_name_used, "&", ev2_name_used, " co-express region"))
  p3 <- .make_violin_box_scatter(df3, "Group", "abundance",
                                 title = paste0(sample_name, " | CD8T abundance | Co-express vs Non-coexpress"),
                                 ylab = "CD8T abundance")

  # ---- Plot 4: EV1 region vs EV2 region vs Co-express region ----
  group_mode <- tolower(as.character(OVERALL_EVREGION_VIOLIN_GROUPMODE %||% "inclusive"))
  if (group_mode == "exclusive") {
    df4 <- df[df$ev1_hi | df$ev2_hi, , drop = FALSE]
    df4$Group <- ifelse(df4$coexpr, paste0(ev1_name_used, "&", ev2_name_used, " co-express"),
                        ifelse(df4$ev1_hi, paste0(ev1_name_used, " only"), paste0(ev2_name_used, " only")))
  } else {
    df4 <- rbind(
      transform(df[df$ev1_hi, , drop = FALSE], Group = paste0(ev1_name_used, " region")),
      transform(df[df$ev2_hi, , drop = FALSE], Group = paste0(ev2_name_used, " region")),
      transform(df[df$coexpr, , drop = FALSE], Group = paste0(ev1_name_used, "&", ev2_name_used, " co-express"))
    )
  }
  p4 <- .make_violin_box_scatter(df4, "Group", "abundance",
                                 title = paste0(sample_name, " | CD8T abundance | EV regions (", group_mode, ")"),
                                 ylab = "CD8T abundance")

  pdf(out_pdf, width = 8.2, height = 6.6, onefile = TRUE)
  if (!is.null(p1)) print(p1)
  if (!is.null(p2)) print(p2)
  if (!is.null(p3)) print(p3)
  if (!is.null(p4)) print(p4)
  dev.off()

  invisible(out_pdf)
}
run_overall_analysis_one_sample <- function(
  sample_name, out_sample_dir, warn_file,
  so_full, coords_in, gene_count_obj, ab_file
) {
  res_violin <- data.frame()
  spatial_ok <- !is.null(coords_in)

  gf <- resolve_overall_gene_features(rownames(so_full[["RNA"]]), OVERALL_GENES)
  gene_map <- gf$map
  missing_requested <- gf$missing_requested

  out_pdf_genes   <- file.path(out_sample_dir, paste0(sample_name, "_OVERALL_HE_GENES.pdf"))
  out_pdf_ev      <- file.path(out_sample_dir, paste0(sample_name, "_OVERALL_EV_RAWCOUNT.pdf"))
  out_pdf_overlay <- file.path(out_sample_dir, paste0(sample_name, OVERALL_GENE_EV_OVERLAY_PDF_SUFFIX))

  if (spatial_ok) {
    pdf_device <- .make_pdf_device()
    img_meta <- attr(coords_in, "img_meta")
    img <- img_meta$img; img_w <- img_meta$width; img_h <- img_meta$height
    spot_grid <- SPOT_SIZE_SPATIAL * max(0.10, as.numeric(OVERALL_GRID_SPOT_SIZE_FACTOR))

    # ---- Genes grid ----
    if (!isTRUE(SKIP_IF_OUTPUT_EXISTS) || !file.exists(out_pdf_genes)) {
      plots_gene <- list()
      if (nrow(gene_map)) {
        for (i in seq_len(nrow(gene_map))) {
          disp <- gene_map$display_gene[i]
          feat <- gene_map$feature_in_mat[i]

          df_expr <- FetchData(so_full, vars = feat)
          df_expr$Barcode <- norm_barcode(rownames(df_expr))
          colnames(df_expr)[1] <- "value"

          df_val <- coords_in %>% inner_join(df_expr, by = "Barcode")
          if (!nrow(df_val)) next
          if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_val <- df_val %>% filter(value != 0)

          p <- plot_spatial_continuous(
            img = img, img_w = img_w, img_h = img_h,
            df_all_spots = coords_in,
            df_value = df_val,
            value_col = "value",
            title = disp,
            legend_title = "LogNormalized",
            show_legend = FALSE,
            spot_size = spot_grid
          ) + theme(plot.title = element_text(size = 11, face = "bold", hjust = 0.5))

          plots_gene[[length(plots_gene)+1]] <- p
        }
      }

      footer_gene <- if (length(missing_requested)) paste0("Not found (requested): ", paste(missing_requested, collapse = ", ")) else ""
      page_genes <- assemble_spatial_grid_page_v53(
        plots = plots_gene,
        title_text = paste0(sample_name, " | OVERALL | Genes on HE (", paste(OVERALL_GENES, collapse = ", "), ")"),
        footer_text = footer_gene,
        ncol_fixed = OVERALL_GRID_MAX_COL
      )

      size_genes <- calc_overall_pdf_size_cm(
        n_plots = length(plots_gene),
        max_col = OVERALL_GRID_MAX_COL,
        panel_w_cm = OVERALL_PANEL_W_CM,
        panel_h_cm = OVERALL_PANEL_H_CM
      )

      dir.create(dirname(out_pdf_genes), recursive = TRUE, showWarnings = FALSE)
      pdf_device(out_pdf_genes, width = size_genes$width_cm/2.54, height = size_genes$height_cm/2.54, onefile = TRUE)
      print(page_genes)
      dev.off()
    } else {
      message("  [OVERALL] Skip existing: ", out_pdf_genes)
    }

    # ---- EV RawCount grid ----
    if (!isTRUE(SKIP_IF_OUTPUT_EXISTS) || !file.exists(out_pdf_ev)) {
      ev_list <- if (isTRUE(OVERALL_PLOT_ALL_EV_FROM_BAS)) gene_count_obj$genes else CLUSTER_GENES
      ev_list <- unique(ev_list)

      plots_ev <- list()
      for (ev in ev_list) {
        v <- get_gene_count_vec(gene_count_obj$wide_df, ev, coords_in$Barcode)
        df_cnt <- data.frame(Barcode = names(v), value = as.numeric(v), stringsAsFactors = FALSE)
        df_val <- coords_in %>% inner_join(df_cnt, by = "Barcode")
        if (!nrow(df_val)) next
        if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_val <- df_val %>% filter(value != 0)

        p <- plot_spatial_continuous(
          img = img, img_w = img_w, img_h = img_h,
          df_all_spots = coords_in,
          df_value = df_val,
          value_col = "value",
          title = ev,
          legend_title = "RawCount",
          show_legend = FALSE,
          spot_size = spot_grid
        ) + theme(plot.title = element_text(size = 11, face = "bold", hjust = 0.5))

        plots_ev[[length(plots_ev)+1]] <- p
      }

      footer_ev <- "EV RawCount source: *_bas_cell_barcode.csv (gene/count aggregated)."
      page_ev <- assemble_spatial_grid_page_v53(
        plots = plots_ev,
        title_text = paste0(sample_name, " | OVERALL | EV RawCount on HE (n=", length(ev_list), ")"),
        footer_text = footer_ev,
        ncol_fixed = OVERALL_GRID_MAX_COL
      )

      size_ev <- calc_overall_pdf_size_cm(
        n_plots = length(plots_ev),
        max_col = OVERALL_GRID_MAX_COL,
        panel_w_cm = OVERALL_PANEL_W_CM,
        panel_h_cm = OVERALL_PANEL_H_CM
      )

      dir.create(dirname(out_pdf_ev), recursive = TRUE, showWarnings = FALSE)
      pdf_device(out_pdf_ev, width = size_ev$width_cm/2.54, height = size_ev$height_cm/2.54, onefile = TRUE)
      print(page_ev)
      dev.off()
    } else {
      message("  [OVERALL] Skip existing: ", out_pdf_ev)
    }

    # ---- OVERALL Gene-EV co-visualization ----
    if (isTRUE(RUN_OVERALL_GENE_EV_OVERLAY) && isTRUE(STEP_RUN_OVERALL_COVIS)) {
      if (isTRUE(SKIP_IF_OUTPUT_EXISTS) && file.exists(out_pdf_overlay)) {
        message("  [OVERALL_COVIS] Skip existing: ", out_pdf_overlay)
      } else {
        overlay_map <- resolve_overall_gene_features(rownames(so_full[["RNA"]]), OVERALL_GENE_EV_OVERLAY_GENES)$map
        overlay_map <- overlay_map %>% distinct(display_gene, feature_in_mat)

        ev_for_overlay <- OVERALL_GENE_EV_OVERLAY_EV_GENE
        ev_vec <- get_gene_count_vec(gene_count_obj$wide_df, ev_for_overlay, coords_in$Barcode)
        df_ev <- data.frame(Barcode = names(ev_vec), ev_value = as.numeric(ev_vec), stringsAsFactors = FALSE)

        methods <- unique(tolower(OVERALL_GENE_EV_OVERLAY_METHODS))
        methods <- methods[methods %in% c("4way","bivar","outline","ring")]
        if (!length(methods)) methods <- c("4way","outline")

        size_overlay <- calc_overall_pdf_size_cm(
          n_plots = max(1L, nrow(overlay_map)),
          max_col = OVERALL_GRID_MAX_COL,
          panel_w_cm = OVERALL_PANEL_W_CM,
          panel_h_cm = OVERALL_PANEL_H_CM
        )

        dir.create(dirname(out_pdf_overlay), recursive = TRUE, showWarnings = FALSE)
        pdf_device(out_pdf_overlay, width = size_overlay$width_cm/2.54, height = size_overlay$height_cm/2.54, onefile = TRUE)

        # ---- Intro page ----
        intro <- cowplot::ggdraw() +
          cowplot::draw_label(
            paste0(sample_name, " | OVERALL | Gene-EV co-visualization (EV=", ev_for_overlay, ")"),
            fontface = "bold", size = 18, x = 0.5, y = 0.92, hjust = 0.5
          ) +
          cowplot::draw_label(
            paste0(
              "Goal: show EV count and gene expression on a single H&E image.\n",
              "This PDF first provides reference pages (gene-only and EV-only), then multiple co-visualization strategies.\n",
              "Each method page includes an English note in the footer."
            ),
            size = 12, x = 0.05, y = 0.72, hjust = 0, lineheight = 1.2
          ) +
          cowplot::draw_label(
            paste0("Methods: ", paste(methods, collapse = ", "), " | BIVAR_PALETTE_STYL=", BIVAR_PALETTE_STYL),
            size = 12, x = 0.05, y = 0.56, hjust = 0
          )
        print(intro)

        # ---- V5.5: Reference pages (gene-only + EV-only) ----
        if (isTRUE(OVERALL_COVIS_INCLUDE_REFERENCE_PAGES)) {
          # Gene-only reference grid
          plots_ref_gene <- list()
          if (nrow(overlay_map)) {
            for (i in seq_len(nrow(overlay_map))) {
              disp <- overlay_map$display_gene[i]
              feat <- overlay_map$feature_in_mat[i]

              df_gene <- FetchData(so_full, vars = feat)
              df_gene$Barcode <- norm_barcode(rownames(df_gene))
              colnames(df_gene)[1] <- "gene_value"

              df_val <- coords_in %>% inner_join(df_gene, by = "Barcode")
              if (!nrow(df_val)) next
              if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_val <- df_val %>% filter(gene_value != 0)

              p <- plot_spatial_continuous(
                img = img, img_w = img_w, img_h = img_h,
                df_all_spots = coords_in,
                df_value = df_val,
                value_col = "gene_value",
                title = disp,
                legend_title = "Gene(LogNorm)",
                show_legend = FALSE,
                spot_size = spot_grid
              ) + theme(plot.title = element_text(size = 11, face = "bold", hjust = 0.5))

              plots_ref_gene[[length(plots_ref_gene)+1]] <- p
            }
          }

          page_ref_gene <- assemble_spatial_grid_page_v53(
            plots = plots_ref_gene,
            title_text = paste0(sample_name, " | Reference | Gene-only heatmaps (overlay genes)"),
            footer_text = "Reference: single-variable gene expression (LogNormalized) on H&E.",
            ncol_fixed = OVERALL_GRID_MAX_COL
          )
          print(page_ref_gene)

          # EV-only reference page
          df_ev_val <- coords_in %>% inner_join(df_ev, by = "Barcode")
          if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_ev_val <- df_ev_val %>% filter(ev_value != 0)

          p_ev_ref <- plot_spatial_continuous(
            img = img, img_w = img_w, img_h = img_h,
            df_all_spots = coords_in,
            df_value = df_ev_val,
            value_col = "ev_value",
            title = paste0("EV = ", ev_for_overlay),
            legend_title = "EV RawCount",
            show_legend = TRUE,
            spot_size = spot_grid
          )

          page_ref_ev <- assemble_spatial_grid_page_v53(
            plots = list(p_ev_ref),
            title_text = paste0(sample_name, " | Reference | EV-only RawCount heatmap"),
            footer_text = "Reference: single-variable EV raw count (from bas) on H&E.",
            ncol_fixed = 1
          )
          print(page_ref_ev)
        }

        build_overlay_plots <- function(method) {
          plots <- list()
          if (!nrow(overlay_map)) return(plots)

          for (i in seq_len(nrow(overlay_map))) {
            disp <- overlay_map$display_gene[i]
            feat <- overlay_map$feature_in_mat[i]

            df_gene <- FetchData(so_full, vars = feat)
            df_gene$Barcode <- norm_barcode(rownames(df_gene))
            colnames(df_gene)[1] <- "gene_value"

            df_merge <- coords_in %>%
              inner_join(df_gene, by = "Barcode") %>%
              inner_join(df_ev, by = "Barcode")

            if (tolower(method) == "4way") {
              p <- plot_spatial_gene_ev_4way(
                img = img, img_w = img_w, img_h = img_h,
                df_all_spots = coords_in,
                df_gene_ev = df_merge,
                gene_col = "gene_value",
                ev_col   = "ev_value",
                title = disp,
                gene_high_quantile = OVERALL_4WAY_GENE_HIGH_QUANTILE,
                ev_mode = OVERALL_4WAY_EV_MODE,
                ev_expr_value = OVERALL_4WAY_EV_EXPR_VALUE,
                ev_noexpr_value = OVERALL_4WAY_EV_NOEXPR_VALUE,
                ev_pos_threshold = OVERALL_4WAY_EV_POS_THRESHOLD,
                ev_neg_threshold = OVERALL_4WAY_EV_NEG_THRESHOLD,
                spot_size = spot_grid,
                show_legend = FALSE
              )
            } else if (tolower(method) == "bivar") {
              p <- plot_spatial_gene_ev_bivariate(
                img = img, img_w = img_w, img_h = img_h,
                df_all_spots = coords_in,
                df_gene_ev = df_merge,
                gene_col = "gene_value",
                ev_col   = "ev_value",
                title = disp,
                n_bins = OVERALL_BIVAR_N_BINS,
                palette_style = BIVAR_PALETTE_STYL,
                spot_size = spot_grid,
                show_legend = FALSE
              )
            } else if (tolower(method) == "outline") {
              p <- plot_spatial_gene_ev_outline(
                img = img, img_w = img_w, img_h = img_h,
                df_all_spots = coords_in,
                df_gene_ev = df_merge,
                gene_col = "gene_value",
                ev_col   = "ev_value",
                title = disp,
                gene_gray = OVERALL_OUTLINE_GENE_GRAY,
                ev_mode = OVERALL_OUTLINE_EV_MODE,
                ev_expr_value = OVERALL_OUTLINE_EV_EXPR_VALUE,
                ev_noexpr_value = OVERALL_OUTLINE_EV_NOEXPR_VALUE,
                ev_pos_threshold = OVERALL_OUTLINE_EV_POS_THRESHOLD,
                ev_neg_threshold = OVERALL_OUTLINE_EV_NEG_THRESHOLD,
                ev_color_by_value = OVERALL_OUTLINE_EV_COLOR_BY_VALUE,
                ev_color_option = OVERALL_OUTLINE_EV_COLOR_OPTION,
                ev_color_fixed = OVERALL_OUTLINE_EV_COLOR_FIXED,
                ev_stroke = OVERALL_OUTLINE_EV_STROKE,
                spot_size = spot_grid,
                show_legend = FALSE
              )
            } else {
              p <- plot_spatial_gene_ev_overlay(
                img = img, img_w = img_w, img_h = img_h,
                df_all_spots = coords_in,
                df_gene_ev = df_merge,
                gene_col = "gene_value",
                ev_col   = "ev_value",
                title = paste0(disp, " | EV=", ev_for_overlay),
                gene_legend = "Gene(LogNorm)",
                ev_legend   = "EV",
                spot_size   = spot_grid,
                show_legend = FALSE
              )
            }

            p <- p + theme(plot.title = element_text(size = 11, face = "bold", hjust = 0.5))
            plots[[length(plots) + 1]] <- p
          }
          plots
        }

        for (method in methods) {
          plots_overlay <- build_overlay_plots(method)

          legend_grob <- NULL
          if (tolower(method) == "bivar") {
            legend_grob <- make_bivar_legend_plot(.bivar_palette_3x3(BIVAR_PALETTE_STYL), xlab = "Gene", ylab = "EV")
          } else if (length(plots_overlay)) {
            legend_grob <- tryCatch(cowplot::get_legend(plots_overlay[[1]] + theme(legend.position = "right")),
                                   error = function(e) grid::nullGrob())
          }

          footer_overlay <- .overlay_method_note_en(method)
          page_overlay <- assemble_spatial_grid_page_v53(
            plots = plots_overlay,
            title_text = paste0(sample_name, " | OVERALL | Gene-EV | method=", method, " (EV=", ev_for_overlay, ")"),
            footer_text = footer_overlay,
            ncol_fixed = OVERALL_GRID_MAX_COL,
            legend_grob = legend_grob,
            legend_width = ifelse(tolower(method) == "bivar", 0.18, 0.14)
          )
          print(page_overlay)
        }

        dev.off()
      }
    }
    # ---- V5.5: EV-region ring+fill (PD-L1 EV / ICAM EV / Co-express) ----
    if (isTRUE(RUN_OVERALL_EVREGION_RINGFILL) && isTRUE(STEP_RUN_OVERALL_EVREGION)) {
      tryCatch({
        run_overall_evregion_ringfill_one_sample(
          sample_name = sample_name,
          out_sample_dir = out_sample_dir,
          warn_file = warn_file,
          so_full = so_full,
          coords_in = coords_in,
          gene_count_obj = gene_count_obj,
          ab_file = ab_file
        )
      }, error = function(e) {
        append_log(warn_file, c(paste0("[ERROR][", Sys.time(), "][EVREGION] ", conditionMessage(e))))
        writeLines(paste0("EVREGION failed: ", conditionMessage(e)),
                   file.path(out_sample_dir, paste0(sample_name, "_EVREGION_ERROR.txt")))
        NULL
      })

# ---- V5.5: EV-region violin (CD8T abundance) ----
if (isTRUE(RUN_OVERALL_EVREGION_VIOLIN) && isTRUE(STEP_RUN_OVERALL_EVREGION_VIOLIN)) {
  tryCatch({
    run_overall_evregion_violin_one_sample(
      sample_name = sample_name,
      out_sample_dir = out_sample_dir,
      warn_file = warn_file,
      coords_in = coords_in,
      gene_count_obj = gene_count_obj,
      ab_file = ab_file
    )
  }, error = function(e) {
    append_log(warn_file, c(paste0("[ERROR][", Sys.time(), "][EVREGION_VIOLIN] ", conditionMessage(e))))
    writeLines(paste0("EVREGION_VIOLIN failed: ", conditionMessage(e)),
               file.path(out_sample_dir, paste0(sample_name, "_EVREGION_VIOLIN_ERROR.txt")))
    NULL
  })
}
    }


  }


  if (nrow(gene_map)) {
    for (i in seq_len(nrow(gene_map))) {
      disp <- gene_map$display_gene[i]
      feat <- gene_map$feature_in_mat[i]

      df_expr <- FetchData(so_full, vars = feat)
      colnames(df_expr)[1] <- "value"
      df_expr$Barcode <- norm_barcode(rownames(df_expr))
      df_expr$Sample <- sample_name
      df_expr$Gene <- disp

      if (isTRUE(OVERALL_VIOLIN_DROP_ZERO_EXPR)) df_expr <- df_expr %>% filter(value != 0)
      res_violin <- bind_rows(res_violin, df_expr %>% select(Sample, Gene, value))
    }
  }

  report_lines <- c(
    paste0("Sample: ", sample_name),
    paste0("RUN_OVERALL_ANALYSIS: ", RUN_OVERALL_ANALYSIS),
    paste0("OVERALL_GENES requested: ", paste(OVERALL_GENES, collapse = ", ")),
    paste0("Resolved genes displayed: ", if (nrow(gene_map)) paste(unique(gene_map$display_gene), collapse = ", ") else "(none)"),
    paste0("Missing requested: ", if (length(missing_requested)) paste(missing_requested, collapse = ", ") else "(none)"),
    paste0("OVERALL genes pdf: ", out_pdf_genes),
    paste0("OVERALL EV pdf: ", out_pdf_ev),
    paste0("RUN_OVERALL_GENE_EV_OVERLAY: ", RUN_OVERALL_GENE_EV_OVERLAY),
    paste0("RUN_OVERALL_EVREGION_RINGFILL: ", RUN_OVERALL_EVREGION_RINGFILL),
    paste0("OVERALL overlay pdf: ", out_pdf_overlay),
    paste0("COVIS methods: ", paste(OVERALL_GENE_EV_OVERLAY_METHODS, collapse = ", ")),
    paste0("BIVAR_PALETTE_STYL: ", BIVAR_PALETTE_STYL),
    paste0("Panel size (cm): ", OVERALL_PANEL_W_CM, " x ", OVERALL_PANEL_H_CM),
    paste0("OVERALL_VIOLIN_DROP_ZERO_EXPR: ", OVERALL_VIOLIN_DROP_ZERO_EXPR),
    paste0("SPATIAL_COLOR_MODE: ", SPATIAL_COLOR_MODE),
    paste0("FG_STROKE_WIDTH: ", FG_STROKE_WIDTH),
    paste0("SPATIAL_SPOT_SIZE_FACTOR: ", SPATIAL_SPOT_SIZE_FACTOR),
    paste0("SKIP_IF_OUTPUT_EXISTS: ", SKIP_IF_OUTPUT_EXISTS)
  )
  writeLines(report_lines, file.path(out_sample_dir, paste0(sample_name, "_OVERALL_REPORT_V55.txt")))

  list(
    overall_pdf = out_pdf_genes,
    overall_ev_pdf = out_pdf_ev,
    overall_overlay_pdf = out_pdf_overlay,
    violin_df = res_violin
  )
}

write_overall_violin_pdf_all_samples <- function(df_all, out_pdf) {
  if (!nrow(df_all)) {
    writeLines("No overall violin data (df_all empty).", sub("\\.pdf$", "_EMPTY.txt", out_pdf))
    return(invisible(FALSE))
  }

  df_all$Sample <- factor(df_all$Sample, levels = unique(df_all$Sample))
  gene_levels <- unique(df_all$Gene)
  df_all$Gene <- factor(df_all$Gene, levels = gene_levels)

  base_theme <- theme_bw(base_size = 11) +
    theme(
      axis.title.x = element_blank(),
      plot.title = element_text(face = "bold"),
      panel.grid.major.x = element_blank()
    )

  p_facet <- ggplot(df_all, aes(x = Sample, y = value)) +
    geom_violin(trim = TRUE, alpha = 0.85) +
    geom_jitter(width = 0.15, size = 0.5, alpha = 0.35) +
    facet_wrap(~ Gene, scales = "free_y") +
    labs(
      title = "OVERALL | Violin across ALL samples",
      subtitle = if (isTRUE(OVERALL_VIOLIN_DROP_ZERO_EXPR)) "Filtered: value==0 removed per-gene per-sample" else NULL,
      y = "LogNormalized expression"
    ) +
    base_theme +
    theme(axis.text.x = element_text(angle = 30, hjust = 1))

  dir.create(dirname(out_pdf), recursive = TRUE, showWarnings = FALSE)
  pdf(out_pdf, width = 16, height = 10, onefile = TRUE)
  print(p_facet)
  dev.off()

  invisible(TRUE)
}


# =========================================================

# =========================================================
run_subcluster_analysis_loaded <- function(
  files, out_sample_dir, sample_warn_file,
  mat, so_full, coords_in,
  gene_count_obj, abundance_for_threshold
) {
  if (is.null(coords_in)) stop("[SUBCLUSTER] Yes spatial , :", files$sample_name)

  message("  [SUBCLUSTER] Initial split by abundance only ...")
  ab_vec <- abundance_for_threshold
  names(ab_vec) <- norm_barcode(names(ab_vec))

  cl <- with_warning_log_immediate(
    select_clusters_by_abundance_threshold(
      ab_vec = ab_vec,
      threshold = AB_THRESHOLD,
      coords_df = coords_in %>% mutate(Barcode = norm_barcode(Barcode)),
      tolerance = SPATIAL_TOLERANCE,
      knn_k = SPATIAL_KNN_K
    ),
    sample_warn_file, stage = "SUBCLUSTER::Initial cluster by abundance_threshold"
  )

  msgs <- character(0)

  for (ev in CLUSTER_GENES) {
    ev_tag <- safe_tag(ev)
    out_ev_dir <- file.path(out_sample_dir, paste0("EV_", ev_tag), "SUBCLUSTER_by_EV")
    dir.create(out_ev_dir, recursive = TRUE, showWarnings = FALSE)

    gene_count_vec <- get_gene_count_vec(gene_count_obj$wide_df, ev, union(coords_in$Barcode, gene_count_obj$barcodes))
    names(gene_count_vec) <- norm_barcode(names(gene_count_vec))

    for (parent in SUBCLUSTER_TARGET_CLUSTERS) {
      parent <- tolower(parent)
      if (!parent %in% c("cluster1","cluster2")) next

      parent_bcs <- if (parent == "cluster1") cl$cluster1 else cl$cluster2
      parent_bcs <- unique(norm_barcode(parent_bcs))

      sp <- split_barcodes_by_ev_for_subcluster(
        parent_bcs = parent_bcs,
        gene_count_vec = gene_count_vec,
        method = SUBCLUSTER_EV_SPLIT_METHOD,
        expr_value = SUBCLUSTER_EV_EXPR_VALUE,
        noexpr_value = SUBCLUSTER_EV_NOEXPR_VALUE,
        pos_threshold = SUBCLUSTER_EV_POS_THRESHOLD,
        neg_threshold = SUBCLUSTER_EV_NEG_THRESHOLD,
        drop_other = SUBCLUSTER_DROP_OTHER_VALUES
      )

      sub1_bcs <- sp$pos
      sub2_bcs <- sp$neg

      split_used <- sp$method_used
      ev_unique_values <- sp$unique_values

      g1_name <- paste0(parent, "-1")
      g2_name <- paste0(parent, "-2")

      base_col <- if (parent == "cluster1") COL_CLUSTER1 else COL_CLUSTER2
      col1 <- base_col
      col2 <- .mix_to_white(base_col, SUBCLUSTER_LIGHTEN_FACTOR)

      out_parent_dir <- file.path(out_ev_dir, toupper(parent))
      dir.create(out_parent_dir, recursive = TRUE, showWarnings = FALSE)

      v_parent <- gene_count_vec[parent_bcs]
      v_parent[is.na(v_parent)] <- 0
      dist_df <- as.data.frame(table(v_parent), stringsAsFactors = FALSE)
      colnames(dist_df) <- c("EV_value", "n_spots")
      readr::write_csv(dist_df, file.path(out_parent_dir, paste0(files$sample_name, "_", ev_tag, "_", toupper(parent), "_EV_value_distribution.csv")))

      if (!is.null(coords_in)) {
        img_meta <- attr(coords_in, "img_meta")
        img <- img_meta$img; img_w <- img_meta$width; img_h <- img_meta$height

        df_groups <- coords_in %>%
          transmute(
            Barcode = Barcode,
            group = case_when(
              Barcode %in% sub1_bcs ~ g1_name,
              Barcode %in% sub2_bcs ~ g2_name,
              TRUE ~ NA_character_
            ),
            x_img = x_img,
            y_img = y_img
          ) %>% filter(!is.na(group))

        p_sub_map <- plot_spatial_groups_discrete(
          img = img, img_w = img_w, img_h = img_h,
          df_all_spots = coords_in,
          df_groups = df_groups,
          group_col = "group",
          title = paste0(files$sample_name, " | EV=", ev, " | ", toupper(parent), " subclusters"),
          palette_named = setNames(c(col1, col2), c(g1_name, g2_name)),
          legend_title = "Subcluster"
        )

        df_cnt <- data.frame(Barcode = names(v_parent), value = as.numeric(v_parent), stringsAsFactors = FALSE)
        df_val <- coords_in %>% inner_join(df_cnt, by = "Barcode")
        if (isTRUE(SPATIAL_DROP_ZERO_EXPR)) df_val <- df_val %>% filter(value != 0)

        p_ev <- plot_spatial_continuous(
          img = img, img_w = img_w, img_h = img_h,
          df_all_spots = coords_in,
          df_value = df_val,
          value_col = "value",
          title = paste0(files$sample_name, " | EV=", ev, " | ", toupper(parent), " | EV RawCount (parent spots)"),
          legend_title = "EV",
          show_legend = TRUE,
          spot_size = SPOT_SIZE_SPATIAL
        )

        out_pdf_spatial <- file.path(out_parent_dir, paste0(files$sample_name, "_", ev_tag, "_", toupper(parent), "_SUBCLUSTER_SPATIAL.pdf"))
        pdf_device <- .make_pdf_device()
        pdf_device(out_pdf_spatial, width = HE_STD_PLOT_WIDTH_CM/2.54, height = HE_STD_PLOT_HEIGHT_CM/2.54, onefile = TRUE)
        print(p_sub_map)
        print(p_ev)
        dev.off()
      }

      de_ok <- NA
      if (isTRUE(RUN_DESEQ2)) {
        de_dir <- file.path(out_parent_dir, "DE_by_subcluster")
        de_ok <- tryCatch({
          run_deseq2_between_groups(
            mat = mat, sample_name = files$sample_name,
            analysis_tag = paste0("SUBCLUSTER_", toupper(parent), "_EV=", ev),
            g1_barcodes = sub1_bcs, g2_barcodes = sub2_bcs,
            g1_name = g1_name, g2_name = g2_name,
            out_dir = de_dir, warn_file = sample_warn_file
          )
        }, error = function(e) {
          dir.create(de_dir, recursive = TRUE, showWarnings = FALSE)
          writeLines(paste0("DESeq2 failed: ", conditionMessage(e)),
                     file.path(de_dir, paste0(files$sample_name, "_", ev_tag, "_", toupper(parent), "_DE_ERROR.txt")))
          append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][SUBCLUSTER_DESeq2] ", conditionMessage(e))))
          FALSE
        })
      }

      violin_ok <- tryCatch({
        out_violin <- file.path(out_parent_dir, paste0(files$sample_name, "_", ev_tag, "_", toupper(parent), "_SUBCLUSTER_violin.pdf"))
        make_violin_plots_pdf_v5(
          so_full = so_full, sample_name = files$sample_name,
          analysis_tag = paste0("SUBCLUSTER ", toupper(parent), " | EV=", ev, " | ", g2_name, " vs ", g1_name),
          g1_barcodes = sub1_bcs, g2_barcodes = sub2_bcs,
          g1_name = g1_name, g2_name = g2_name,
          col_g1 = col1, col_g2 = col2,
          out_pdf = out_violin,
          plot_genes = PLOT_GENES,
          drop_zero = VIOLIN_DROP_ZERO_EXPR,
          warn_file = sample_warn_file
        )
      }, error = function(e) {
        append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][SUBCLUSTER_Violin] ", conditionMessage(e))))
        FALSE
      })

      report_lines <- c(
        paste0("Sample: ", files$sample_name),
        paste0("EV: ", ev),
        paste0("Parent cluster: ", parent),
        paste0("Split method (requested): ", SUBCLUSTER_EV_SPLIT_METHOD),
        paste0("Split method (used): ", split_used),
        paste0("expr_value: ", SUBCLUSTER_EV_EXPR_VALUE),
        paste0("noexpr_value: ", SUBCLUSTER_EV_NOEXPR_VALUE),
        paste0("pos_threshold: ", SUBCLUSTER_EV_POS_THRESHOLD, " ; neg_threshold: ", SUBCLUSTER_EV_NEG_THRESHOLD),
        paste0("Unique EV values (parent): ", paste(head(ev_unique_values, 20), collapse = ", "), ifelse(length(ev_unique_values) > 20, " ...", "")),
        paste0("drop_other: ", SUBCLUSTER_DROP_OTHER_VALUES),
        paste0("Parent spots: ", length(parent_bcs)),
        paste0(g1_name, " spots: ", length(sub1_bcs)),
        paste0(g2_name, " spots: ", length(sub2_bcs)),
        paste0("Violin OK: ", violin_ok),
        paste0("DESeq2 OK: ", de_ok),
        paste0("Warnings log: ", sample_warn_file)
      )
      writeLines(report_lines, file.path(out_parent_dir, paste0(files$sample_name, "_", ev_tag, "_", toupper(parent), "_SUBCLUSTER_REPORT_V55.txt")))

      msgs <- c(msgs, paste0(ev, ":", parent, "(", g1_name, "=", length(sub1_bcs), ", ", g2_name, "=", length(sub2_bcs),
                             ") VIOLIN_OK=", violin_ok, " DE_OK=", de_ok))
    }
  }

  paste(msgs, collapse = " | ")
}


# =========================================================

# =========================================================
find_sample_files_v33 <- function(sample_dir) {
  h5_file <- list.files(sample_dir, pattern = "filtered_feature_bc_matrix\\.h5$", full.names = TRUE)[1]
  bas_file <- list.files(sample_dir, pattern = "_bas_cell_barcode\\.csv$", full.names = TRUE, ignore.case = TRUE)[1]
  ab_file  <- list.files(sample_dir, pattern = "_celltype_abundance\\.csv$", full.names = TRUE, ignore.case = TRUE)[1]
  list(sample_name = basename(sample_dir), sample_dir = sample_dir,
       h5_file = h5_file, bas_file = bas_file, ab_file = ab_file)
}

validate_sample_files_v33 <- function(files) {
  missing <- c()
  if (is.na(files$h5_file)  || !file.exists(files$h5_file))  missing <- c(missing, "filtered_feature_bc_matrix.h5")
  if (is.na(files$bas_file) || !file.exists(files$bas_file)) missing <- c(missing, "*_bas_cell_barcode.csv")
  if (is.na(files$ab_file)  || !file.exists(files$ab_file))  missing <- c(missing, "*_celltype_abundance.csv")
  missing
}

is_real_sample_dir <- function(sample_dir) {
  f <- find_sample_files_v33(sample_dir)
  !length(validate_sample_files_v33(f))
}


# =========================================================

# =========================================================
run_cluster_analysis_loaded <- function(
  files, out_sample_dir, sample_warn_file,
  mat, so_full, coords_in,
  gene_count_obj,
  abundance_for_threshold, abundance_c1_rule, abundance_c2_rule,
  all_barcodes
) {
  per_ev_msgs <- character(0)

  for (ev in CLUSTER_GENES) {
    message("\n [EV|cluster]", ev)
    ev_tag <- safe_tag(ev)
    out_ev_dir <- file.path(out_sample_dir, paste0("EV_", ev_tag))
    dir.create(out_ev_dir, recursive = TRUE, showWarnings = FALSE)

    append_log(sample_warn_file, c(paste0("[INFO][", Sys.time(), "][EV] ", ev)))

    gene_count_vec <- get_gene_count_vec(gene_count_obj$wide_df, ev, all_barcodes)

    cluster1_raw <- character(0)
    cluster2_raw <- character(0)
    method_note <- character(0)

    if (tolower(CLUSTER_METHOD) == "abundance_threshold") {
      if (is.null(coords_in)) stop("Yes spatial , :", files$sample_name)

      ab_vec <- abundance_for_threshold
      names(ab_vec) <- norm_barcode(names(ab_vec))

      cl <- with_warning_log_immediate(
        select_clusters_by_abundance_threshold(
          ab_vec = ab_vec,
          threshold = AB_THRESHOLD,
          coords_df = coords_in %>% mutate(Barcode = norm_barcode(Barcode)),
          tolerance = SPATIAL_TOLERANCE,
          knn_k = SPATIAL_KNN_K
        ),
        sample_warn_file, stage = paste0("Cluster threshold+smooth (", ev, ")")
      )

      cluster1_raw <- cl$cluster1
      cluster2_raw <- cl$cluster2

      method_note <- c(
        "CLUSTER_METHOD=abundance_threshold",
        paste0("AB_CELLTYPE_NAME=", AB_CELLTYPE_NAME),
        paste0("AB_THRESHOLD=", AB_THRESHOLD),
        paste0("SPATIAL_TOLERANCE=", SPATIAL_TOLERANCE),
        paste0("SPATIAL_KNN_K=", SPATIAL_KNN_K),
        paste0("smooth_required_majority=", cl$required_majority),
        paste0("smooth_iterations=", cl$n_iter)
      )

    } else if (tolower(CLUSTER_METHOD) == "rule") {
      ab1 <- rep(0, length(all_barcodes)); names(ab1) <- all_barcodes
      ab2 <- rep(0, length(all_barcodes)); names(ab2) <- all_barcodes
      ab1[names(abundance_c1_rule)] <- abundance_c1_rule
      ab2[names(abundance_c2_rule)] <- abundance_c2_rule

      c1_cell_pass <- select_barcodes_by_rule(ab1, C1_CELLTYPE_MODE, C1_CELLTYPE_VALUE, direction = "top")
      c2_cell_pass <- select_barcodes_by_rule(ab2, C2_CELLTYPE_MODE, C2_CELLTYPE_VALUE, direction = "top")

      cluster1_raw <- c1_cell_pass
      cluster2_raw <- setdiff(c2_cell_pass, cluster1_raw)

      method_note <- c(
        "CLUSTER_METHOD=rule",
        paste0("C1_CELLTYPE_NAME=", C1_CELLTYPE_NAME, " ", C1_CELLTYPE_MODE, "=", C1_CELLTYPE_VALUE),
        paste0("C2_CELLTYPE_NAME=", C2_CELLTYPE_NAME, " ", C2_CELLTYPE_MODE, "=", C2_CELLTYPE_VALUE)
      )
    } else {
      stop("CLUSTER_METHOD:", CLUSTER_METHOD)
    }

    if (isTRUE(APPLY_EV_COUNT_FILTER)) {
      c1_keep <- apply_ev_count_filter_within_cluster(
        cluster_bcs = cluster1_raw,
        gene_count_vec = gene_count_vec,
        mode = C1_GENE_MODE, value = C1_GENE_VALUE,
        direction = "top",
        consider_zero = TRUE
      )
      c2_keep <- apply_ev_count_filter_within_cluster(
        cluster_bcs = cluster2_raw,
        gene_count_vec = gene_count_vec,
        mode = C2_GENE_MODE, value = C2_GENE_VALUE,
        direction = "bottom",
        consider_zero = C2_CONSIDER_ZERO
      )

      cluster1_bcs <- unique(c1_keep)
      cluster2_bcs <- setdiff(unique(c2_keep), cluster1_bcs)
    } else {
      cluster1_bcs <- unique(cluster1_raw)
      cluster2_bcs <- setdiff(unique(cluster2_raw), cluster1_bcs)
    }

    de_ok <- NA
    if (isTRUE(RUN_DESEQ2)) {
      de_dir <- file.path(out_ev_dir, "DE_by_cluster_rule")
      de_ok <- tryCatch({
        run_deseq2_between_groups(
          mat = mat, sample_name = files$sample_name,
          analysis_tag = paste0("CLUSTER_EV=", ev),
          g1_barcodes = cluster1_bcs, g2_barcodes = cluster2_bcs,
          g1_name = "cluster1", g2_name = "cluster2",
          out_dir = de_dir, warn_file = sample_warn_file
        )
        TRUE
      }, error = function(e) {
        dir.create(de_dir, recursive = TRUE, showWarnings = FALSE)
        writeLines(paste0("DESeq2 failed: ", conditionMessage(e)),
                   file.path(de_dir, paste0(files$sample_name, "_", safe_tag(ev), "_DE_ERROR.txt")))
        append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][DESeq2] ", conditionMessage(e))))
        FALSE
      })
    }

    violin_pdf <- file.path(out_ev_dir, paste0(files$sample_name, "_", ev_tag, "_checkpoint_genes_violin.pdf"))
    v_ok <- tryCatch({
      make_violin_plots_pdf_v5(
        so_full = so_full, sample_name = files$sample_name,
        analysis_tag = paste0("Group by EV=", ev, " | cluster2 vs cluster1"),
        g1_barcodes = cluster1_bcs, g2_barcodes = cluster2_bcs,
        g1_name = "cluster1", g2_name = "cluster2",
        col_g1 = COL_CLUSTER1, col_g2 = COL_CLUSTER2,
        out_pdf = violin_pdf,
        plot_genes = PLOT_GENES,
        drop_zero = VIOLIN_DROP_ZERO_EXPR,
        warn_file = sample_warn_file
      )
      TRUE
    }, error = function(e) {
      writeLines(paste0("Violin failed: ", conditionMessage(e)),
                 file.path(out_ev_dir, paste0(files$sample_name, "_", ev_tag, "_VIOLIN_ERROR.txt")))
      append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][Violin] ", conditionMessage(e))))
      FALSE
    })

    he_ok <- NA
    if (!is.null(coords_in)) {
      he_dir <- file.path(out_ev_dir, "Spatial_HE_heatmaps")
      dir.create(he_dir, recursive = TRUE, showWarnings = FALSE)

      std_c1  <- file.path(he_dir, paste0(files$sample_name, "_", ev_tag, "_cluster1_HE_heatmaps.pdf"))
      std_c2  <- file.path(he_dir, paste0(files$sample_name, "_", ev_tag, "_cluster2_HE_heatmaps.pdf"))
      grid_c1 <- file.path(he_dir, paste0(files$sample_name, "_", ev_tag, "_cluster1_PLOTGENES_grid.pdf"))
      grid_c2 <- file.path(he_dir, paste0(files$sample_name, "_", ev_tag, "_cluster2_PLOTGENES_grid.pdf"))
      full_c1 <- file.path(he_dir, paste0(files$sample_name, "_", ev_tag, "_cluster1_PLOTGENES_fullpages.pdf"))
      full_c2 <- file.path(he_dir, paste0(files$sample_name, "_", ev_tag, "_cluster2_PLOTGENES_fullpages.pdf"))

      he_ok <- tryCatch({
        make_spatial_cluster_pdfs_v5(
          so_full = so_full, coords_in = coords_in, sample_name = files$sample_name, ev_gene = ev,
          cluster1_bcs = cluster1_bcs, cluster2_bcs = cluster2_bcs,
          ev_gene_count_vec = gene_count_vec,
          out_pdf_std_c1 = std_c1, out_pdf_std_c2 = std_c2,
          out_pdf_grid_c1 = grid_c1, out_pdf_grid_c2 = grid_c2,
          out_pdf_fullpages_c1 = full_c1, out_pdf_fullpages_c2 = full_c2,
          warn_file = sample_warn_file
        )
        TRUE
      }, error = function(e) {
        writeLines(paste0("HE PDFs failed: ", conditionMessage(e)),
                   file.path(he_dir, paste0(files$sample_name, "_", ev_tag, "_HE_ERROR.txt")))
        append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][HE] ", conditionMessage(e))))
        FALSE
      })
    }

    report_lines <- c(
      paste0("Sample: ", files$sample_name),
      paste0("EV gene: ", ev),
      paste0("CLUSTER_METHOD: ", CLUSTER_METHOD),
      method_note,
      paste0("APPLY_EV_COUNT_FILTER: ", APPLY_EV_COUNT_FILTER),
      paste0("cluster1 n: ", length(cluster1_bcs)),
      paste0("cluster2 n: ", length(cluster2_bcs)),
      paste0("Violin PDF: ", violin_pdf),
      paste0("Violin OK: ", v_ok),
      paste0("RUN_DESEQ2: ", RUN_DESEQ2),
      paste0("DESeq2 OK: ", de_ok),
      paste0("HE PDFs OK: ", he_ok),
      paste0("Warnings log: ", sample_warn_file)
    )
    writeLines(report_lines, file.path(out_ev_dir, paste0(files$sample_name, "_", ev_tag, "_RUN_REPORT_V55_CLUSTER.txt")))

    per_ev_msgs <- c(
      per_ev_msgs,
      paste0(ev, ": c1=", length(cluster1_bcs), ", c2=", length(cluster2_bcs),
             ", VIOLIN_OK=", v_ok, ", DE_OK=", de_ok, ", HE_OK=", he_ok)
    )

    message("[EV|cluster]", ev)
  }

  paste(per_ev_msgs, collapse = " | ")
}


# =========================================================

# =========================================================
run_one_sample_v54 <- function(sample_dir) {
  files <- find_sample_files_v33(sample_dir)
  miss <- validate_sample_files_v33(files)
  if (length(miss)) {
    message("[]", files$sample_name, ":", paste(miss, collapse = "; "))
    return(list(sample = files$sample_name, ok = FALSE, msg = paste(miss, collapse = "; "), overall_violin = data.frame()))
  }

  message("\n[|V5.5]", files$sample_name)
  out_sample_dir <- file.path(OUTPUT_BASE_DIR, files$sample_name)
  dir.create(out_sample_dir, recursive = TRUE, showWarnings = FALSE)

  sample_warn_file <- file.path(out_sample_dir, paste0(files$sample_name, "_WARNINGS.txt"))
  init_warning_log(sample_warn_file)

  append_log(sample_warn_file, c(
    paste0("[INFO][", Sys.time(), "] sample=", files$sample_name),
    paste0("RUN_CLUSTER_ANALYSIS=", RUN_CLUSTER_ANALYSIS),
    paste0("RUN_SUBCLUSTER_ANALYSIS=", RUN_SUBCLUSTER_ANALYSIS),
    paste0("RUN_OVERALL_ANALYSIS=", RUN_OVERALL_ANALYSIS),
    paste0("RUN_OVERALL_EVREGION_RINGFILL=", RUN_OVERALL_EVREGION_RINGFILL),
    paste0("STEP_BUILD_GENE_COUNT=", STEP_BUILD_GENE_COUNT),
    paste0("STEP_BUILD_SEURAT=", STEP_BUILD_SEURAT),
    paste0("STEP_PREPARE_SPATIAL=", STEP_PREPARE_SPATIAL),
    paste0("STEP_RUN_OVERALL_PDFS=", STEP_RUN_OVERALL_PDFS),
    paste0("STEP_RUN_OVERALL_COVIS=", STEP_RUN_OVERALL_COVIS),
    paste0("STEP_RUN_OVERALL_EVREGION=", STEP_RUN_OVERALL_EVREGION),
    paste0("STEP_RUN_OVERALL_EVREGION=", STEP_RUN_OVERALL_EVREGION),
    paste0("STEP_RUN_SUBCLUSTER=", STEP_RUN_SUBCLUSTER),
    paste0("STEP_RUN_CLUSTER=", STEP_RUN_CLUSTER),
    paste0("USE_CACHE_RDS=", USE_CACHE_RDS),
    paste0("FORCE_REBUILD_RDS=", FORCE_REBUILD_RDS),
    paste0("SKIP_IF_OUTPUT_EXISTS=", SKIP_IF_OUTPUT_EXISTS),
    paste0("HE_IMAGE_DOWNSAMPLE=", HE_IMAGE_DOWNSAMPLE),
    paste0("DESEQ2_SIZEFACTOR_TYPE=", DESEQ2_SIZEFACTOR_TYPE),
    paste0("DESEQ2_FITTYPE=", DESEQ2_FITTYPE),
    paste0("DESEQ2_MAX_GENES=", ifelse(is.na(DESEQ2_MAX_GENES), "NA", DESEQ2_MAX_GENES)),
    paste0("FG_STROKE_WIDTH=", FG_STROKE_WIDTH),
    paste0("SPATIAL_COLOR_MODE=", SPATIAL_COLOR_MODE),
    paste0("BIVAR_PALETTE_STYL=", BIVAR_PALETTE_STYL)
  ))


  abundance_for_threshold <- with_warning_log_immediate(
    read_celltype_abundance_vec(files$ab_file, AB_CELLTYPE_NAME),
    sample_warn_file, stage = "Read abundance threshold"
  )
  abundance_c1_rule <- with_warning_log_immediate(
    read_celltype_abundance_vec(files$ab_file, C1_CELLTYPE_NAME),
    sample_warn_file, stage = "Read abundance rule c1"
  )
  abundance_c2_rule <- with_warning_log_immediate(
    read_celltype_abundance_vec(files$ab_file, C2_CELLTYPE_NAME),
    sample_warn_file, stage = "Read abundance rule c2"
  )

  all_ab_barcodes <- unique(c(names(abundance_for_threshold), names(abundance_c1_rule), names(abundance_c2_rule)))


  need_overall <- isTRUE(RUN_OVERALL_ANALYSIS) && (isTRUE(STEP_RUN_OVERALL_PDFS) || (isTRUE(RUN_OVERALL_GENE_EV_OVERLAY) && isTRUE(STEP_RUN_OVERALL_COVIS)))
  need_subcluster <- isTRUE(RUN_SUBCLUSTER_ANALYSIS) && isTRUE(STEP_RUN_SUBCLUSTER)
  need_cluster    <- isTRUE(RUN_CLUSTER_ANALYSIS) && isTRUE(STEP_RUN_CLUSTER)

  need_gene_count <- need_overall || need_subcluster || need_cluster
  need_spatial    <- need_overall || need_subcluster || need_cluster
  need_seurat     <- need_overall || need_subcluster || need_cluster


  gene_count_obj <- NULL
  if (need_gene_count) {
    cache_gene_count_rds <- file.path(out_sample_dir, paste0(files$sample_name, "_gene_count_wide.rds"))
    gene_count_obj <- .cache_load_or_build(
      cache_file = cache_gene_count_rds,
      build_fun = function() {
        build_and_write_gene_count_wide(
          bas_file = files$bas_file,
          sample_name = files$sample_name,
          out_dir = out_sample_dir,
          extra_barcodes = all_ab_barcodes
        )
      },
      allow_build = isTRUE(STEP_BUILD_GENE_COUNT),
      use_cache = USE_CACHE_RDS,
      force_rebuild = FORCE_REBUILD_RDS,
      save_cache = SAVE_CACHE_GENE_COUNT,
      tag = "gene_count_wide"
    )
  }

  all_barcodes <- if (!is.null(gene_count_obj)) {
    sort(unique(c(gene_count_obj$barcodes, all_ab_barcodes))) %>% norm_barcode()
  } else {
    sort(unique(all_ab_barcodes)) %>% norm_barcode()
  }


  coords_in <- NULL
  if (need_spatial) {
    cache_coords_rds <- file.path(out_sample_dir, paste0(files$sample_name, "_coords_in_downsample.rds"))
    coords_in <- .cache_load_or_build(
      cache_file = cache_coords_rds,
      build_fun = function() prepare_spatial_coords_and_image(sample_dir),
      allow_build = isTRUE(STEP_PREPARE_SPATIAL),
      use_cache = USE_CACHE_RDS,
      force_rebuild = FORCE_REBUILD_RDS,
      save_cache = SAVE_CACHE_COORDS,
      tag = "coords_in(spatial)"
    )
    if (is.null(coords_in)) {
      message("  [I/O] Spatial assets NOT found/readable.")
    } else {
      img_meta <- attr(coords_in, "img_meta")
      message("  [I/O] Spatial OK: in_tissue spots=", nrow(coords_in),
              " | image(WxH)=", img_meta$width, "x", img_meta$height,
              " | downsample=", img_meta$downsample)
    }
  }


  so_full <- NULL
  mat <- NULL

  if (need_seurat) {
    cache_so_rds <- file.path(out_sample_dir, paste0(files$sample_name, "_so_full_LogNormalize.rds"))
    so_full <- .cache_load_or_build(
      cache_file = cache_so_rds,
      build_fun = function() {
        # build from h5
        mat0 <- with_warning_log_immediate(read_10x_h5_counts(files$h5_file), sample_warn_file, stage = "Read10X_h5")
        message("  [I/O] Matrix dim: genes=", nrow(mat0), " spots=", ncol(mat0))

        so0 <- with_warning_log_immediate(
          CreateSeuratObject(counts = mat0, assay = "RNA", project = files$sample_name),
          sample_warn_file, stage = "Seurat::CreateSeuratObject(full)"
        )
        so0 <- with_warning_log_immediate(
          NormalizeData(so0, normalization.method = "LogNormalize", scale.factor = 10000, verbose = FALSE),
          sample_warn_file, stage = "Seurat::NormalizeData(full)"
        )
        so0
      },
      allow_build = isTRUE(STEP_BUILD_SEURAT),
      use_cache = USE_CACHE_RDS,
      force_rebuild = FORCE_REBUILD_RDS,
      save_cache = SAVE_CACHE_SEURAT,
      tag = "so_full(LogNormalize)"
    )


    mat <- get_counts_layer(so_full, assay = "RNA")
  } else {

    mat <- NULL
  }

  overall_violin_df <- data.frame()
  overall_msg <- ""
  if (need_overall) {
    message("  [OVERALL] Start overall analysis (no cluster split) ...")
    ov <- tryCatch({
      run_overall_analysis_one_sample(
        sample_name = files$sample_name,
        out_sample_dir = out_sample_dir,
        warn_file = sample_warn_file,
        so_full = so_full,
        coords_in = coords_in,
        gene_count_obj = gene_count_obj,
        ab_file = files$ab_file
      )
    }, error = function(e) {
      append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][OVERALL] ", conditionMessage(e))))
      writeLines(paste0("OVERALL failed: ", conditionMessage(e)),
                 file.path(out_sample_dir, paste0(files$sample_name, "_OVERALL_ERROR.txt")))
      list(overall_pdf = NA_character_, overall_ev_pdf = NA_character_, overall_overlay_pdf = NA_character_, violin_df = data.frame())
    })
    overall_violin_df <- ov$violin_df
    overall_msg <- paste0("OVERALL_GENES_PDF=", ov$overall_pdf,
                          " | OVERALL_EV_PDF=", ov$overall_ev_pdf,
                          " | OVERALL_OVERLAY_PDF=", ov$overall_overlay_pdf)
  }

  subcluster_msg <- ""
  if (need_subcluster) {
    message("  [SUBCLUSTER] Start subcluster analysis ...")
    subcluster_msg <- tryCatch({
      run_subcluster_analysis_loaded(
        files = files,
        out_sample_dir = out_sample_dir,
        sample_warn_file = sample_warn_file,
        mat = mat, so_full = so_full, coords_in = coords_in,
        gene_count_obj = gene_count_obj,
        abundance_for_threshold = abundance_for_threshold
      )
    }, error = function(e) {
      append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][SUBCLUSTER] ", conditionMessage(e))))
      writeLines(paste0("SUBCLUSTER failed: ", conditionMessage(e)),
                 file.path(out_sample_dir, paste0(files$sample_name, "_SUBCLUSTER_ERROR.txt")))
      "SUBCLUSTER_FAILED"
    })
  }

  cluster_msg <- ""
  if (need_cluster) {
    message("  [CLUSTER] Start cluster analysis ...")
    cluster_msg <- tryCatch({
      run_cluster_analysis_loaded(
        files = files,
        out_sample_dir = out_sample_dir,
        sample_warn_file = sample_warn_file,
        mat = mat, so_full = so_full, coords_in = coords_in,
        gene_count_obj = gene_count_obj,
        abundance_for_threshold = abundance_for_threshold,
        abundance_c1_rule = abundance_c1_rule,
        abundance_c2_rule = abundance_c2_rule,
        all_barcodes = all_barcodes
      )
    }, error = function(e) {
      append_log(sample_warn_file, c(paste0("[ERROR][", Sys.time(), "][CLUSTER] ", conditionMessage(e))))
      writeLines(paste0("CLUSTER failed: ", conditionMessage(e)),
                 file.path(out_sample_dir, paste0(files$sample_name, "_CLUSTER_ERROR.txt")))
      "CLUSTER_FAILED"
    })
  }

  message("[|V5.5]", files$sample_name)

  msg <- paste(
    if (nzchar(overall_msg)) overall_msg else NULL,
    if (nzchar(subcluster_msg)) paste0("SUBCLUSTER: ", subcluster_msg) else NULL,
    if (nzchar(cluster_msg)) paste0("CLUSTER: ", cluster_msg) else NULL,
    sep = " | "
  )

  list(sample = files$sample_name, ok = TRUE, msg = msg, overall_violin = overall_violin_df)
}


# =========================================================
# 16) main(V5.5)
# =========================================================
main <- function() {
  dir.create(OUTPUT_BASE_DIR, recursive = TRUE, showWarnings = FALSE)

  sample_dirs_all <- list.dirs(INPUT_BASE_DIR, full.names = TRUE, recursive = FALSE)
  exclude_names <- unique(c("spatial", basename(OUTPUT_BASE_DIR)))
  sample_dirs_all <- sample_dirs_all[!(basename(sample_dirs_all) %in% exclude_names)]
  sample_dirs <- sample_dirs_all[vapply(sample_dirs_all, is_real_sample_dir, logical(1))]

  message("Directory:", INPUT_BASE_DIR)
  message("Output directory: ", OUTPUT_BASE_DIR)
  message("():", length(sample_dirs))
  message("RUN_OVERALL_ANALYSIS: ", RUN_OVERALL_ANALYSIS)
  message("RUN_OVERALL_GENE_EV_OVERLAY: ", RUN_OVERALL_GENE_EV_OVERLAY)
  message("RUN_OVERALL_EVREGION_RINGFILL: ", RUN_OVERALL_EVREGION_RINGFILL)
  message("STEP_RUN_OVERALL_EVREGION: ", STEP_RUN_OVERALL_EVREGION)
  message("RUN_SUBCLUSTER_ANALYSIS: ", RUN_SUBCLUSTER_ANALYSIS)
  message("RUN_CLUSTER_ANALYSIS: ", RUN_CLUSTER_ANALYSIS)
  message("CLUSTER_METHOD: ", CLUSTER_METHOD)
  message("CLUSTER_GENES: ", paste(CLUSTER_GENES, collapse = ", "))
  message("OVERALL_GENES: ", paste(OVERALL_GENES, collapse = ", "))
  message("BIVAR_PALETTE_STYL: ", BIVAR_PALETTE_STYL)
  message("SPATIAL_COLOR_MODE: ", SPATIAL_COLOR_MODE)
  message("FG_STROKE_WIDTH: ", FG_STROKE_WIDTH)
  message("SKIP_IF_OUTPUT_EXISTS: ", SKIP_IF_OUTPUT_EXISTS)
  message("USE_CACHE_RDS: ", USE_CACHE_RDS, " | FORCE_REBUILD_RDS: ", FORCE_REBUILD_RDS)

  message("\n=== (V5.5) ===")
  res_list <- lapply(sample_dirs, run_one_sample_v54)

  res_df <- dplyr::bind_rows(lapply(res_list, function(x) {
    data.frame(sample = x$sample, ok = x$ok, msg = x$msg, stringsAsFactors = FALSE)
  }))

  report_file <- file.path(OUTPUT_BASE_DIR, "ALL_samples_run_report_V55.txt")
  detail <- apply(res_df, 1, function(x) paste0(x[["sample"]], "\t", x[["msg"]]))
  writeLines(c(
    paste0("Run time: ", Sys.time()),
    paste0("Total samples: ", nrow(res_df)),
    paste0("RUN_OVERALL_ANALYSIS: ", RUN_OVERALL_ANALYSIS),
    paste0("RUN_OVERALL_GENE_EV_OVERLAY: ", RUN_OVERALL_GENE_EV_OVERLAY),
    paste0("RUN_SUBCLUSTER_ANALYSIS: ", RUN_SUBCLUSTER_ANALYSIS),
    paste0("RUN_CLUSTER_ANALYSIS: ", RUN_CLUSTER_ANALYSIS),
    paste0("STEP_BUILD_GENE_COUNT: ", STEP_BUILD_GENE_COUNT),
    paste0("STEP_BUILD_SEURAT: ", STEP_BUILD_SEURAT),
    paste0("STEP_PREPARE_SPATIAL: ", STEP_PREPARE_SPATIAL),
    paste0("STEP_RUN_OVERALL_PDFS: ", STEP_RUN_OVERALL_PDFS),
    paste0("STEP_RUN_OVERALL_COVIS: ", STEP_RUN_OVERALL_COVIS),
    paste0("STEP_RUN_SUBCLUSTER: ", STEP_RUN_SUBCLUSTER),
    paste0("STEP_RUN_CLUSTER: ", STEP_RUN_CLUSTER),
    paste0("USE_CACHE_RDS: ", USE_CACHE_RDS),
    paste0("FORCE_REBUILD_RDS: ", FORCE_REBUILD_RDS),
    paste0("SKIP_IF_OUTPUT_EXISTS: ", SKIP_IF_OUTPUT_EXISTS),
    paste0("CLUSTER_METHOD: ", CLUSTER_METHOD),
    paste0("CLUSTER_GENES: ", paste(CLUSTER_GENES, collapse = ", ")),
    paste0("OVERALL_GENES: ", paste(OVERALL_GENES, collapse = ", ")),
    paste0("BIVAR_PALETTE_STYL: ", BIVAR_PALETTE_STYL),
    paste0("SPATIAL_COLOR_MODE: ", SPATIAL_COLOR_MODE),
    paste0("FG_STROKE_WIDTH: ", FG_STROKE_WIDTH),
    "---- Details ----",
    detail
  ), report_file)

  if (isTRUE(RUN_OVERALL_ANALYSIS) && isTRUE(STEP_RUN_OVERALL_PDFS)) {
    df_all <- bind_rows(lapply(res_list, function(x) x$overall_violin))
    out_violin_pdf <- file.path(OUTPUT_BASE_DIR, "ALL_samples_OVERALL_violin_V55.pdf")
    write_overall_violin_pdf_all_samples(df_all, out_violin_pdf)
  }

  message("\n=== (V5.5)===")
  message(":", report_file)
  invisible(res_df)
}

main()
