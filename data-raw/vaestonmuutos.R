## code to prepare `vaestonmuutos` dataset goes here
pkgs <- c(
  "httr2",
  "jsonlite",
  "readr",
  "tidyr",
  "dplyr"
)
uninst <- pkgs[!pkgs %in% installed.packages()]
if (length(uninst > 0)) install.packages(uninst)
lapply(pkgs, library, character.only = TRUE)

url <- "https://pxdata.stat.fi:443/PxWeb/api/v1/fi/StatFin/muutl/statfin_muutl_pxt_11ae.px"

req <- httr2::request(url)

body_raw <- scan("data-raw/vaestonmuutos_body.txt", what = "character")

resp <- httr2::req_body_raw(req, body = body_raw) |> httr2::req_perform()

results <- resp_body_json(resp)

# Pick all the pieces from list of list of lists...
vuodet <- unlist(results$dimension$Vuosi$category$label)
kunnat <- unlist(results$dimension$Alue$category$label)
columns <- unlist(results$dimension$Tiedot$category$label)
values <- results$value
values[sapply(values, is.null)] <- NA  # unlist() drops NULLs silently
values <- unlist(values)
stopifnot(length(results$value) == length(values))  # double check nothing dropped

# Values -> per column -> per muncipality -> per year
# Parse to data frame year by year
l <- list()
ln <- (length(values)/length(vuodet)) - 1
stops <- seq(from = length(values)/length(vuodet), to = length(values), length.out = length(vuodet))
for (i in seq_along(vuodet)) {
  vuosi <- vuodet[i]
  from <- stops[i] - ln
  to <- stops[i]
  l[[vuosi]] <- as_tibble(
    suppressWarnings({
      matrix(values[from:to], ncol = length(columns), byrow = T)
    })
  )
  names(l[[vuosi]]) <- names(columns)
  l[[vuosi]] <- dplyr::mutate(l[[vuosi]], kunta = kunnat, vuosi = vuosi)
  l[[vuosi]] <- l[[vuosi]][c("kunta", "vuosi", names(columns))]  # kunta column first
}

vaestonmuutos <- do.call(rbind, l)

vaestonmuutos$kunta[vaestonmuutos$kunta == "Maarianhamina - Mariehamn"] <- "Maarianhamina"

usethis::use_data(vaestonmuutos, overwrite = TRUE)
