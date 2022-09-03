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



# Create variables
RecordID <- c("EX1", "EX2")
pleasant <- c(4, 2)
vibrant <- c(4, 3)
eventful <- c(4, 5)
chaotic <-c(2, 5)
annoying <-c(3, 5)
monotonous <-c(3, 3)
uneventful <-c(4, 1)
calm <-c(4, 3)

# Join the variables to create a data frame
soundscape_df <- data.frame(RecordID,pleasant,vibrant,eventful,chaotic,annoying,monotonous,uneventful,calm)
df

#resahpe to long
library(reshape2)
soundscape_df_long <- melt(soundscape_df, id.vars = c("RecordID"))
soundscape_df_wide <- data.frame(RecordID,pleasant,vibrant,eventful,chaotic,annoying,monotonous,uneventful,calm)

#polar with data

fig <- plot_ly(
  type = 'scatterpolar',
  mode = 'lines')

fig <- fig %>%
add_trace(
  type = "scatterpolar",
  r = soundscape_df_long[,"RecordID"],
  #theta = c('pleasant', 'vibrant', 'eventful', 'chaotic','annoying', 'monotonous', 'uneventful', 'calm'), #theta = c('pleasant', 'vibrant', 'eventful', 'chaotic','annoying', 'monotonous', 'uneventful', 'calm'),
  mode = "markers",
  theta.labels = c('pleasant', 'vibrant', 'eventful', 'chaotic','annoying', 'monotonous', 'uneventful', 'calm'),
  fill = 'toself',
  legend = TRUE
)
fig

#load plotly
library(plotly)
library(ggplot2)
library(plyr)
library(reshape2)
library(ggthemes)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              



library(plotly)

fig <- plot_ly(
  type = 'scatterpolar',
  mode = 'lines'
) 
fig <- fig %>%
  add_trace(
    r = c(5, 4, 2, 4, 5),
    theta = c("a", "b", "c", "d", "a"),
    name = 'angular categories',
    fill = 'toself'
  ) 
fig <- fig %>%
  add_trace(
    r = c("a", "b", "c", "d", "b", "f", "a"),
    theta = c(1, 4, 2, 1.5, 1.5, 6, 5),
    thetaunit = 'radians',
    name = 'radial categories',
    fill = 'toself',
    subplot = 'polar2'
  ) 
fig <- fig %>%
  add_trace(
    r = c(5, 4, 2, 4, 5),
    theta = c("a", "b", "c", "d", "a"),
    name = 'angular categories (w/ categoryarray)',
    fill = 'toself',
    subplot = 'polar3'
  ) 
fig <- fig %>%
  add_trace(
    r = c("a", "b", "c", "d", "b", "f", "a", "a"),
    theta = c(45, 90, 180, 200, 300, 15, 20, 45),
    name = 'radial categories (w/ category descending)',
    fill = 'toself',
    subplot = 'polar4'
  ) 
fig <- fig %>%
  layout(
    polar = list(
      domain = list(
        x = c(0,0.46),
        y = c(0.56,1)
      ),
      radialaxis = list(
        angle = 45
      ),
      angularaxis = list(
        direction = 'clockwise',
        period = 6
      )
    ),
    polar2 = list(
      domain = list(
        x = c(0,0.46),
        y = c(0,0.44)
      ),
      radialaxis = list(
        angle = 180,
        tickangle = -180
      )
    ),
    polar3 = list(
      domain = list(
        x = c(0.54,1),
        y = c(0.56,1)
      ),
      sector = c(150,400),
      radialaxis = list(
        angle = -45
      ),
      angularaxis = list(
        categoryarray = c("d", "a", "c", "b")
      )
    ),
    polar4 = list(
      domain = list(
        x = c(0.54,1),
        y = c(0,0.44)
      ),
      radialaxis = list(
        categoryorder = "category descending"
      ),
      angularaxis = list(
        thetaunit= "radians",
        dtick = 0.3141592653589793
      )
    )
  )

fig

