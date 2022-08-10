#use python in shiny
library(reticulate)
conda_create("r-scrublet")
conda_install(envname="r-scrublet", packages ="numpy","pip","git")
conda_python(envname =  "r-scrublet")
#use miniconda

use_miniconda("r-scrublet", required=T)

os <- import("os")
os$system("pip list")

#C:\\Users\\nik43jm\\Documents\\PhD\\Sience\\SoundscapeR\\SoundscapeR\py\\
plotting <- import("scipy")


reticulate::use_miniconda('soundscaper', required = TRUE)
reticulate::source_python('plotting.py')
