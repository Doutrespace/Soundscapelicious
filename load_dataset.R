#download soundscape data

# Specify URL where file is stored
url <- "https://zenodo.org/record/6331810/files/SSID%20Locations%20VL0.2.1.xlsx?download=1"

# Specify destination where file should be saved
destfile <- "C:/Users/nik43jm/Documents/PhD/Sience/SoundscapeR/SoundscapeR/data/SSID_soundscapes.csv"


# Apply download.file function in R
download.file(url, destfile)


# check for newer vesion from provided URL
# if newer version is available, download it
# if not, do nothing
download.file(url, destfile, check = TRUE, force = TRUE, quiet = TRUE,
              show_progress = TRUE, show_error = TRUE)


#load file
library(readr)
SSIDVL2_02 <- read_delim("data/SSIDVL2.02.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(SSIDVL2_02)


write.table(SSIDVL2_02, file = "SSIDVL2.02.csv", sep = ",", col.names = NA,
            qmethod = "double")

read.table()