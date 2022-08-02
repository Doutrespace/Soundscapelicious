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

#add data from table to plot



