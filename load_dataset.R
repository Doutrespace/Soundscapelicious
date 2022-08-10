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
SSIDVL2_02 <- read_delim("data/SSIDVL2.02.csv", delim = ",", escape_double = FALSE, trim_ws = TRUE)
View(SSIDVL2_02)


#write table
write.table(SSIDVL2_02, file = "C:\\Users\\nik43jm\\Documents\\PhD\\Sience\\SoundscapeR\\SoundscapeR\\data\\SSIDVL2_new.csv", sep = ",",col.names = NA)



# Save an object to a file
saveRDS(SSIDVL2_02, file = "C:\\Users\\nik43jm\\Documents\\PhD\\Sience\\SoundscapeR\\SoundscapeR\\data\\my_data.rds")

# Restore the object
my_data <- readRDS(SSIDVL2_02 = "C:\\Users\\nik43jm\\Documents\\PhD\\Sience\\SoundscapeR\\SoundscapeR\\data\\my_data.rds")

# Saving on object in RData format
save(SSIDVL2_02, file = "C:\\Users\\nik43jm\\Documents\\PhD\\Sience\\SoundscapeR\\SoundscapeR\\data\\data2.RData")

SSIDVL2_02_new <- load("C:\\Users\\nik43jm\\Documents\\PhD\\Sience\\SoundscapeR\\SoundscapeR\\data\\data2.RData")

library(knitr)
kable(SSIDVL2_02)


