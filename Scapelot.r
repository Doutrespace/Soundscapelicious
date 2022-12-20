
install.packages("tidyverse")
install.packages("ggraph")install.packages("ggplot2")
install.packages("ggcircle")
install.packages("devtools")
devtools::install_github("ricardo-bion/ggradar", 
                         dependencies = TRUE)

library(usethis)
library(devtools)
library(ggradar)


library(ggplot2)
library(circular)

library(tidyverse)
library(ggraph)

#sample data
sample_dict <- list(
  RecordID = c("EX1", "EX2"),
  pleasant = c(4, 2),
  vibrant = c(4, 3),
  eventful = c(4, 5),
  chaotic = c(2, 5),
  annoying = c(1, 5),
  monotonous = c(3, 5),
  uneventful = c(3, 3),
  calm = c(4, 1)
)

#df it
sample_df <- data.frame(sample_dict)

#df long
sample_df_long <- pivot_longer(sample_df, cols = -RecordID, names_to = "Attribute", values_to = "Score")

#plot it
ggraph(sample_df_long, layout = "circle") +
  geom_edge_link(aes(x = Attribute, y = Score, group = RecordID), end_cap = circle(10, 'mm')) +
  geom_node_point(aes(x = Attribute, y = Score, group = RecordID, color = RecordID)) +
  theme_void()



ggraph(sample_df_long, layout = "circle") +
  geom_edge_arc(aes(x = Attribute, y = Score, group = RecordID, color = RecordID), alpha = 0.8, start_cap = circle(10, 'mm'), end_cap = circle(10, 'mm')) +
  geom_node_point(aes(x = Attribute, y = Score, group = RecordID, color = RecordID), size = 3) +
  theme_void()

circle.control(data = sample_df_long, x = Attribute, y = Score, group = RecordID, color = RecordID)

<<<<<<< HEAD
# Join the variables to create a data frame
soundscape_df <- data.frame(RecordID,pleasant,vibrant,eventful,chaotic,annoying,monotonous,uneventful,calm)
soundscape_df

=======
ggradar(sample_df_long, aes(x = Attribute, y = Score, group = RecordID, color = RecordID)) +
  theme_void()

ggraph(sample_df_long, layout = "circle") +
  geom_radar(aes(x = Attribute, y = Score, group = RecordID, color = RecordID)) +
  theme_void()
>>>>>>> 6e4df6b3a8b12a183bdc5bf7415f5b005c491006



<<<<<<< HEAD
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

=======

>>>>>>> 6e4df6b3a8b12a183bdc5bf7415f5b005c491006

