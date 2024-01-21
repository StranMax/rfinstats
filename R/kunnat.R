#' Kunnat data
#'
#' Finnish administratory areas from municipality level
#'
#' @source Kuntapohjaiset tilastointialueet, Tilastokeskus,
#'  <https://www.stat.fi/org/avoindata/paikkatietoaineistot.html#kuntapohjaiset>
#' @format Data frame with columns
#' \describe{
#' \item{kunta_nro}{Three number municipality code}
#' \item{kunta_nimi}{Municipality name in Finnish}
#' \item{geom}{geometry column}
#' }
#' @examples
#' if (require("sf")) {
#'
#' kunnat
#' }
#'
"kunnat"
