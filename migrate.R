# migrate.R
# Minimal script to migrate user-installed R packages
# from R 4.4 → R 4.5 (Windows LOCALAPPDATA layout).
#
# You can adjust "4.4" and "4.5" inside the script for other version jumps.

old_lib <- file.path(Sys.getenv("LOCALAPPDATA"), "R", "win-library", "4.4")
new_lib <- file.path(Sys.getenv("LOCALAPPDATA"), "R", "win-library", "4.5")
dir.create(new_lib, recursive = TRUE, showWarnings = FALSE)

had <- rownames(installed.packages(lib.loc = old_lib))
to_get <- setdiff(had, rownames(installed.packages(lib.loc = new_lib)))

if (length(to_get)) install.packages(to_get, lib = new_lib)
