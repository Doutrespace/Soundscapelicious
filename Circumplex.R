# Install and load the plotrix package
#install.packages("plotrix")
#remotes::install_github("ricardo-bion/ggradar")
#devtools::install_github("jtlandis/ggside")
library(ggplot2)
library(ggside)
library(tidyverse)
library(tidyquant)
library(devtools)
library(plotrix)
library(readr)
library(tidyverse)
library(ggraph)
library(circumplex)
library(ggradar)
library(palmerpenguins)
library(scales)
library(showtext)
library(fmsb)
library(RColorBrewer)
library(dplyr)
library(plotly)
library(ggExtra)
library(hrbrthemes)
library(ggside)



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
sample_dict_df <- data.frame(sample_dict)
#long it
sample_df_long <- pivot_longer(sample_dict_df, cols = -RecordID, names_to = "Attribute", values_to = "Score")

sample_df_long <- gather(sample_dict_df, key = "attribute", value = "rating", -RecordID)

##############################################################################################

#Circumplex plot

# Create data: note in High school for Jonathan:
set.seed(99)
data <- as.data.frame(matrix( sample( 0:10 , 24 , replace=T) , ncol=8))
colnames(data) <- c("pleasant" , "vibrant" , "eventful" , "chaotic" , "annoying", "monotonous" , "uneventful" , "calm")
rownames(data) <- paste("Ext" , letters[1:3], sep="-")


# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data <- rbind(rep(5,8) , rep(0,8) , data)

# Check your data, it has to look like this!
head(data)

# Set graphic colors
coul <- brewer.pal(3, "Pastel2")
colors_border <- coul
colors_in <- alpha(coul,0.3)

# If you remove the 2 first lines, the function compute the max and min of each variable with the available data:
radarchart( data[-c(1,2),]  , axistype=0 , maxmin=F,
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=2 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="black", cglwd=1.4,
            #custom labels
            vlcex=0.7
)

# Add a legend
legend(x=0.9, y=1.2, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=0.8, pt.cex=1)

##########################################################################################################################################
#load data
ssid  <- read_csv("~/PhD/Sience/CodingIdeas/Soundscapy/test/test_DB/TestDataOnly_2021-01-07.csv")

# Remove all rows with NA values
ssid <- ssid %>% na.omit()


#set a theme
theme_set(theme_bw())



ssid %>% 
  ggplot(aes(x=Pleasant, y=Eventful, color=LocationID, size= loudness)) +
  geom_point(alpha=0.7)
 
# Dummy data
data <- data.frame(
  var1 = rnorm(1000),
  var2 = rnorm(1000, mean=2)
)




#First, rather than calculating the median response to each PA in the location, then calculating the circumplex coordinates,
#the coordinates for each individual response are calculated. This results in a vector of ISOPleasant, ISOEventful values which are continuous variables 
#from -1 to +1 and can be analysed statistically by calculating summary statistics (mean, standard deviation, quintiles, etc.) 
#and through the use of regression modelling, which can often be simpler and more familiar than the recommended methods of analysing ordinal data. 
#This also enables each individual's response to be placed within the pleasant-eventful space. All of the responses for a location can then be plotted, 
#giving an overall scatter plot for a location, as demonstrated in (i).

  # Bin size control + color palette
ggplot(ssid, aes(x = Eventful, y = Pleasant) ) +
  geom_point() +
  stat_density_2d(aes(fill = ..level.., alpha=.6), geom = "polygon")+
  scale_fill_viridis() +
  labs(x = "Pleasant", y = "Eventful", subtitle = "Comparison of the soundscapes of urban spaces")+
  scale_x_continuous(expand = c(-1, 2),breaks = waiver()) +
  scale_y_continuous(expand = c(-1, 2),breaks = waiver()) +
  geom_hline(yintercept = 0,  linetype = "dashed") +
  geom_vline(xintercept = 0,  linetype = "dashed") +
  geom_abline(intercept = 0, slope = -1, linetype = "dashed")+
  geom_abline(intercept = 0, slope = 1, linetype = "dashed")+
  geom_label(
    label="vibrant", 
    x=0.5,
    y=0.5, 
    label.size = 0.35,
    alpha=0.6
  )+
  geom_label(
    label="monotonous", 
    x=-0.5,
    y=-0.5,
    label.size = 0.35,
    alpha=0.6
  )+
  geom_label(
    label="calm", 
    x=0.5,
    y=-0.5,
    label.size = 0.35,
    alpha=0.6
  )+
  geom_label(
    label="chaotic", 
    x=-0.5,
    y=0.5,
    label.size = 0.35,
    color = "black",
    alpha=0.6
  )


#plotting the loudness
# Chart
p <- ggplot(ssid, aes(x=x) ) +
  # Top
  stat_density( aes(x = Eventful, y = ..density..), fill="#69b3a2",alpha=.6 ) +
  geom_label( aes(x=1, y=1, label="Eventful"), color="#69b3a2") +
  # Bottom
  stat_density( aes(x = Pleasant, y = -..density..), fill= "#404080", alpha=.6) +
  geom_label( aes(x=1, y=-1, label="Pleasant"), color="#404080") +
  theme_ipsum()

p

#Fig demonstrates how this simplified representation makes it possible to compare the soundscape of several locations in a sophisticated way.

ggplot(ssid, aes(Eventful, Pleasant, colour=LocationID, fill=LocationID)) + 
  geom_point() + 
  geom_density2d(alpha=.5) + 
  labs(x = "Pleasant", y = "Eventful", subtitle = "Comparison of the soundscapes of urban spaces")+
  geom_ysidedensity(
    aes(
      x    = after_stat(density),
      fill = LocationID
    ),
    alpha    = 0.5,
    size     = 1,
    position = "stack"
  ) +
  scale_x_continuous(expand = c(-1, 2),breaks = waiver()) +
  scale_y_continuous(expand = c(-1, 2),breaks = waiver()) +
  geom_hline(yintercept = 0,  linetype = "dashed") +
  geom_vline(xintercept = 0,  linetype = "dashed") +
  geom_abline(intercept = 0, slope = -1, linetype = "dashed")+
  geom_abline(intercept = 0, slope = 1, linetype = "dashed")+
  #scale_color_tq() +
  #scale_fill_tq() +
  theme_light()+
  geom_label(
    label="vibrant", 
    x=0.5,
    y=0.5, 
    label.size = 0.35,
    color = "black",
    alpha=0.6
  )+
  geom_label(
    label="monotonous", 
    x=-0.5,
    y=-0.5,
    label.size = 0.35,
    color = "black",
    alpha=0.6
  )+
  geom_label(
    label="calm", 
    x=0.5,
    y=-0.5,
    label.size = 0.35,
    color = "black",
    alpha=0.6
  )+
  geom_label(
    label="chaotic", 
    x=-0.5,
    y=0.5,
    label.size = 0.35,
    color = "black",
    alpha=0.6
  )



