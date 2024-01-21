## code to prepare `aluejaot` dataset goes here
pkgs <- c(
  "readxl",
  "readr",
  "tidyr",
  "stringr"
)
uninst <- pkgs[!pkgs %in% installed.packages()]
if (length(uninst > 0)) install.packages(uninst)
lapply(pkgs, library, character.only = TRUE)

url <- "http://stat.fi/media/uploads/tup/msind/msindaluejaot10.xls"

tmp <- tempfile(fileext = ".xls")

download.file(url, destfile = tmp, mode = 'wb')

aluejaot <- readxl::read_excel(tmp)

unlink(tmp)

# Kunta id and name in same column
aluejaot[c("id", "Kunta")] <- stringr::str_split_fixed(aluejaot$Kunta, pattern = " ", n = 2)

# Kunta id to first column
aluejaot <- aluejaot[c(11, 1:10)]

usethis::use_data(aluejaot, overwrite = TRUE)
