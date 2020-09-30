# GetAndClean  
  
This is for final assessment of Coursera Data Science course 3  
  
At first the data were read from the given .txt files.  
  
Then features containing mean and std were selected and  
X_train and X_test data were trimmed according to the features.  
  
subject, y and X data were joined to create test and train datasets.  
  
The two datasets were merged to create the mergedset dataset  
  
The variables were named, from the feature list available.  
  
Activities were given descriptve names  
  
Using dplyr package, the table was grouped by subject and activity,  
then mean was calculated using summarize.  
  
The resulting tibble was written to a separate file.  

This code can be used to read the file:  
data <- read.table("tidytibble.txt", header = TRUE)  

This is the tidiest form of data according to me, as it follows the tidy data rules.
