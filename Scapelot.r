
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

ggradar(sample_df_long, aes(x = Attribute, y = Score, group = RecordID, color = RecordID)) +
  theme_void()

ggraph(sample_df_long, layout = "circle") +
  geom_radar(aes(x = Attribute, y = Score, group = RecordID, color = RecordID)) +
  theme_void()





