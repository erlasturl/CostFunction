#activate library
library(geosphere)

# make new dataset
datd <- mydata

# Get the min distance in the data
mind <- min(datd$dist, na.rm = T)

# Set minimum distance between points
mindist <- 2.9

# Loop that removes points and recalculates distance between points
while(mind[1] < mindist){
  
  # Get ID of points with mimum distance
  minID <- datd$ID[datd$dist == mind]
  
  # removes one data point based on minimum distance
  datd <- datd[datd$ID != minID[1],] 
  
  # Get number of datapoints left
  n <- dim(datd)[1]
  
  # Recalculate distance between datapoints
  datd$dist <- c(NA, distGeo(datd[1:(n-1), c("Longitude", "Latitude")],
                             datd[2:(n), c("Longitude", "Latitude")])) 
  
  # Get minimum distance
  mind <- min(datd$dist, na.rm = T)
  
}