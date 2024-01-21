## code to prepare `kunnat` dataset goes here
pkgs <- c(
  "httr2",
  "sf",
  "tidyr",
  "dplyr"
)
uninst <- pkgs[!pkgs %in% installed.packages()]
if (length(uninst) > 0) install.packages()
lapply(pkgs, library, character.only = TRUE)

url <- "https://geo.stat.fi/geoserver/tilastointialueet/wfs"

wfs <- paste0("WFS:", url)

sf::gdal_utils(util = "ogrinfo", source = wfs)  # See what layers there are

layer <- "tilastointialueet:kunta4500k_2023"

tmp <- tempfile(fileext = ".gpkg")

ogr2ogr <- "vectortranslate"

ds <- paste0(wfs, "?Typename=", layer)  #WFS:url?Typename=layer

sf::gdal_utils(util = ogr2ogr, source = ds, destination = tmp)

kunnat <- st_read(tmp, layer = layer)

unlink(tmp)

kunnat$nimi[kunnat$nimi == "Maarianhamina - Mariehamn"] <- "Maarianhamina"

kunnat <- kunnat |>
  select(kunta_nro = kunta, kunta_nimi = nimi, geom)

usethis::use_data(kunnat, overwrite = TRUE)
