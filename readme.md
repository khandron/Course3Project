### Getting and Cleaning Data - Course Project  

This is the course project for the Getting and Cleaning Data Coursera course. 

The R script, `run_analysis.R`, does the following:  

1. Creates a directory and downloads the dataset if it does not already exist 
2. Loads the activity and feature info, test and training databases
3. Merges the datasets 
3. Picks out only the mean and standard deviation data 
4. Makes the labels description 
6. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.  The end result is shown in the file `tidy.txt`.

