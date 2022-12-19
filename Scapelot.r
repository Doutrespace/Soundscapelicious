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
soundscape_df


#polar with data

fig <- plot_ly(
  type = 'scatterpolar',
  mode = 'lines')

fig <- fig %>%
add_trace(
  type = "scatterpolar",
  values = soundscape_df_long$RecordID,
  #customdata = soundscape_df[,], 
  #r = c(3,5,6),
  theta = c('pleasant', 'vibrant', 'eventful', 'chaotic','annoying', 'monotonous', 'uneventful', 'calm'), #theta = c('pleasant', 'vibrant', 'eventful', 'chaotic','annoying', 'monotonous', 'uneventful', 'calm'),
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



# use EX1 and EX2 from soundscpe_df to build a scatter polar plot
# Create a data frame with the data
df <- data.frame(
  group = factor(rep(letters[1:2], each = 4)),
  x = c(pleasant, vibrant, eventful, chaotic, annoying, monotonous, uneventful, calm),
  y = c(pleasant, vibrant, eventful, chaotic, annoying, monotonous, uneventful, calm)
)

# Make the plot
ggplot(soundscape_df_long, aes(variable, value)) +
  geom_bar() +
  #coord_polar(theta = "RecordID") +
  theme_void()

# Refactoring the data
dd <- data.frame(category = c(1,2,3,4), value = c(2, 7, 4, 2))

# Almost identical to coord_polar()
coord_straightpolar <- function(theta = 'x', start = 0, direction = 1, clip = "on") {
  theta <- match.arg(theta, c("x", "y"))
  r <- if (theta == "x") 
    "y"
  else "x"
  ggproto(NULL, CoordPolar, theta = theta, r = r, start = start,
          direction = sign(direction), clip = clip,
          # This is the different bit
          is_linear = function(){TRUE})
}


#wide to long
library(reshape2)
soundscape_df_long <- melt(soundscape_df, id.vars= "RecordID")


ggplot(soundscape_df_long, aes(x = variable, y = value, group=1)) +
  coord_straightpolar(theta = 'x') +
  geom_path(color = 'blue') +
  scale_x_continuous(limits = c(1,4), breaks = 1:3, labels = LETTERS[1:3]) +
  scale_y_continuous(limits = c(0, NA)) +
  geom_point()


