library(tidyverse)
library(here)
library(glue)
library(sf)
library(rajudas)
library(jsonlite)

# read geodata
data_geo = read_sf(here("countries/countries.geojson"))


# files on github
path_images = paste0("https://raw.githubusercontent.com/RobinKohrs/mapsME/main/atlas/output_", data_geo$name, ".png")

df = data.frame(
  name = data_geo$name,
  path_images = path_images
) %>% filter(
  str_detect(name, "Dekelia|Vereinigte", negate=T)
)

op = makePath(here("output/flourish/df.csv"))
write_csv(df, op)
