install.packages("plotly")
library(plotly)

#build basic polar plot
fig <- plot_ly(
  type = 'scatterpolar',
  r = c(0,2,4,5),
  theta = c(0,45,90,0),
  mode = 'markers'
)

fig


#annotate theta axis with labels and add a legend
fig <- plot_ly(
  type = "scatterpolar",
  r = c(0,0.5,1,1.5,2,2.5,3,5),
  theta = c('pleasant', 'vibrant', 'eventful', 'chaotic','annoying', 'monotonous', 'uneventful', 'calm'),
  mode = "markers",
  theta.labels = c('pleasant', 'vibrant', 'eventful', 'chaotic','annoying', 'monotonous', 'uneventful', 'calm'),
  legend = TRUE
)
fig


#read in the data
library(readr)
data2 <- read_csv("C:\\Users\\nik43jm\\Documents\\PhD\\Sience\\SoundscapeR\\SoundscapeR\\SSID Lockdown Database VL0.2.2.csv", sep=",", col_names = TRUE)
data2
# df as a dataframe
data2 <- data.frame(data2)

# df as table
df <- as.data.frame(df)


fig

123 #4

