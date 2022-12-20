library(seewave)
library(tuneR)


#Here is a function that takes a .wav file as input and iterates through all of the alpha indices available 
#in the seewave package, printing the name and value of each index:
wav_file <- "C:/Users/nik43jm/Documents/PhD/Sience/CodingIdeas/Soundscapy-main/test/data/CT101.wav"


analyze_alpha_indices <- function(wav_file) {
  # Read the .wav file into a sound object
  sound <- readWave(wav_file)
  
  # Calculate all of the alpha indices
  alpha_indices <- ACI(sound, channel = 1, wl = 512, ovlp = 0,  wn = "hamming", flim = NULL, nbwindows = 1)
  
  # Iterate through the alpha indices and print their names and values
  for (index_name in names(ACI)) {
    index_value <- ACI[[index_name]]
    print(paste(index_name, ":", index_value))
  }
}

#To use this function, you would simply call it with the path to a .wav file as the argument, like this:
analyze_alpha_indices()




#Here is a modified version of the function that calculates both the alpha indices and the beta indices for a given .wav file:

analyze_indices <- function(wav_file) {
  # Read the .wav file into a sound object
  sound <- readWave(wav_file)
  
  # Calculate the alpha and beta indices
  alpha_indices <- alpha(sound)
  beta_indices <- beta(sound)
  
  # Print the alpha indices
  print("Alpha indices:")
  for (index_name in names(alpha_indices)) {
    index_value <- alpha_indices[[index_name]]
    print(paste(index_name, ":", index_value))
  }
  
  # Print the beta indices
  print("Beta indices:")
  for (index_name in names(beta_indices)) {
    index_value <- beta_indices[[index_name]]
    print(paste(index_name, ":", index_value))
  }
}

analyze_indices("path/to/file.wav")


# This function allows you to calculate a wide range of additional spectral indices,
#such as the kurtosis, skewness, crest factor, and many others. Here is an example of how you might use the extra function to calculate these indices:

analyze_extra_indices <- function(wav_file) {
  # Read the .wav file into a sound object
  sound <- readWave(wav_file)
  
  # Calculate the extra indices
  extra_indices <- extra(sound)
  
  # Print the extra indices
  print("Extra indices:")
  for (index_name in names(extra_indices)) {
    index_value <- extra_indices[[index_name]]
    print(paste(index_name, ":", index_value))
  }
}

analyze_extra_indices("C:/Users/nik43jm/Documents/PhD/Sience/CodingIdeas/Soundscapy-main/test/data/CT101.wav")

