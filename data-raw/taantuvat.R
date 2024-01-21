## code to prepare `taantuvat` dataset goes here
pkgs <- c(
  "dplyr",
  "sf"
)
uninst <- pkgs[!pkgs %in% installed.packages()]
if (length(uninst) > 0) install.packages()
lapply(pkgs, library, character.only = TRUE)

load("data/kunnat.rda")
load("data/aluejaot.rda")
load("data/vaestonmuutos.rda")

# Classification based on 2010-2022 population change
vaestonmuutos <- vaestonmuutos |>
  group_by(kunta) |>
  summarise(kokmuutos_2010_2022 = sum(kokmuutos, na.rm = TRUE), vaesto = mean(vaesto, na.rm = TRUE)) |>
  mutate(suht_muutos_2010_2022 = (kokmuutos_2010_2022 / vaesto)*100) |>
  mutate(luokka = cut(suht_muutos_2010_2022,
                      breaks = c(-Inf, -10, -5, 0, 5, 10, Inf),
                      labels = c("Voimakkaasti taantuva", "Taantuva", "Hieman taantuva", "Hieman kasvava", "Kasvava", "Voimakkaasti kasvava"))) |>
  select(kunta, kokmuutos_2010_2022, suht_muutos_2010_2022, luokka)


taantuvat <- kunnat |>
  left_join(vaestonmuutos, by = join_by("kunta_nimi" == "kunta")) |>
  left_join(aluejaot, by = join_by("kunta_nimi" == "Kunta", "kunta_nro" == "id"))

usethis::use_data(taantuvat, overwrite = TRUE)
