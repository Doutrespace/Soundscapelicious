# SoundscapeR

## How to analyse and represent soundscape perception data


## How to analyse and represent soundscape perception data in R

This notebook contains examples and custom functions for analyzing and visualizing data from the International Soundscape Database (ISD). The ISD is a collection of survey and acoustic data gathered in urban public areas with the aim of creating a comprehensive dataset for the development of a soundscape prediction model and a set of soundscape indices. The goal of the new visualization method presented in this notebook is to enable sophisticated statistical analyses and accurately represent the range of responses for a given location. Through this notebook, you will learn how to use the code and understand the soundscape perception of urban spaces.
>>>>>>> 0101ae7ef0134c10f42ad9f75be0e6587d51fee7

![](https://img.shields.io/badge/EAGLE-Design-blue) ![](https://img.shields.io/badge/Approval-pending-red)


![](https://github.com/Doutrespace/SoundscapeR/blob/main/resources/eyecatcher.png)           

## The ISO 12913 framework
This study focuses on using questionnaire-based soundscape assessment (Method A) to collect data, as outlined in ISO12913 Part 2. This method involves asking participants to rate the soundscape of a location based on eight perceptual attributes (PAs): pleasant, vibrant, eventful, chaotic, annoying, monotonous, uneventful, and calm. These PAs are typically evaluated independently, but they are thought to form a two-dimensional circumplex model with pleasantness and eventfulness on the x- and y-axes, respectively. A third dimension, familiarity, was also identified in a previous study (Axelsson et al., 2010), but it only accounted for a small amount of variance and is not typically included in the standard circumplex model. The circumplex model is useful for representing the overall perception of a soundscape because it takes into account all of the PAs and their relationships.

### Coordinate transformation

To analyze responses to the perceptual attributes (PAs), responses on a Likert scale are coded as ordinal variables ranging from 1 (strongly disagree) to 5 (strongly agree). In order to simplify the analysis, ISO 12913 Part 3 provides a trigonometric transformation that combines the responses to the eight PAs into a single pair of coordinates on the pleasantness and eventfulness dimensions. This transformation takes into account the $45\degree$ relationship between the diagonal axes and the pleasantness and eventfulness axes, and projects the coded values from the individual PAs onto these dimensions. The resulting coordinate pair is intended to represent the responses to all eight PAs in a more easily understandable and analyzable form.

The ISO coordinates are thus calculated by:

$$
ISOPleasant = [(pleasant - annoying) + \cos{45\degree} * (calm - chaotic) + \cos{45\degree} * (vibrant - monotonous)] * \frac{1}{(4 + \sqrt{32})}
$$

$$
ISOEventful = [(eventful - uneventful) + \cos{45\degree} * (chaotic - calm) + \cos{45\degree} * (vibrant - monotonous)] * \frac{1}{(4 + \sqrt{32})}
$$

The perceptual attributes (PAs) are arranged around a circumplex as shown in Figure 1. The $\cos{45\degree}$ is used to project the diagonal terms onto the x and y axes, and the scaling factor of $\frac{1}{4 + \sqrt{32}}$ ensures that the resulting coordinates are in the range (-1, 1). This transformation is illustrated in Figure 1.

## Probabilistic soundscape representation with maschine learning



### **Outlook**

### Acknowledgements

Mitchell, A., Aletta, F., & Kang, J. (2022). How to analyse and represent quantitative soundscape data. JASA Express Letters, 2, 37201.

