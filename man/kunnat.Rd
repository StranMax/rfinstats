% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kunnat.R
\docType{data}
\name{kunnat}
\alias{kunnat}
\title{Kunnat data}
\format{
Data frame with columns
\describe{
\item{kunta_nro}{Three number municipality code}
\item{kunta_nimi}{Municipality name in Finnish}
\item{geom}{geometry column}
}
}
\source{
Kuntapohjaiset tilastointialueet, Tilastokeskus,
 <https://www.stat.fi/org/avoindata/paikkatietoaineistot.html#kuntapohjaiset>
}
\usage{
kunnat
}
\description{
Finnish administratory areas from municipality level
}
\examples{
if (require("sf")) {

kunnat
}

}
\keyword{datasets}
