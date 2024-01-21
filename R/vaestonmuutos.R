#' Migration statistics from municipalities
#'
#'
#'@source Väestönmuutokset ja väkiluku alueittain, 1990-2022, Tilastokeskus,
#'  <https://pxdata.stat.fi/PxWeb/pxweb/fi/StatFin/StatFin__muutl/statfin_muutl_pxt_11ae.px/>
#'
#' @format A data frame with 4017 rows and 23 variables:
#' \describe{
#'   \item{kunta}{Kunta}
#'   \item{vuosi}{Vuosi}
#'   \item{vm01}{Elävänä syntyneet}
#'   \item{vm11}{Kuolleet}
#'   \item{luonvalisays}{Luonnollinen väestönlisäys}
#'   \item{vm43_tulo}{Kuntien välinen tulomuutto}
#'   \item{vm43_lahto}{Kuntien välinen lähtömuutto}
#'   \item{vm43_netto}{Kuntien välinen nettomuutto}
#'   \item{vm44}{Kunnan sisäinen muutto}
#'   \item{vm41}{Maahanmuutto Suomeen}
#'   \item{vm41_nordic}{Maahanmuutto Suomeen Pohjoismaista}
#'   \item{vm41_eu}{Maahanmuutto Suomeen EU-maista}
#'   \item{vm42}{Maastamuutto Suomesta}
#'   \item{vm42_nordic}{Maastamuutto Suomesta Pohjoismaihin}
#'   \item{vm42_eu}{Maastamuutto Suomesta EU-maihin}
#'   \item{vm4142}{Nettomaahanmuutto}
#'   \item{koknetmuutto}{Kokonaisnettomuutto}
#'   \item{vm2126}{Solmitut avioliitot}
#'   \item{vm3136}{Avioerot}
#'   \item{valisays}{Väestönlisäys}
#'   \item{vakorjaus}{Väkiluvun korjaus}
#'   \item{kokmuutos}{Kokonaismuutos}
#'   \item{vaesto}{Väkiluku}
#' }
#' @examples
#' vaestonmuutos
#'
#'
"vaestonmuutos"
