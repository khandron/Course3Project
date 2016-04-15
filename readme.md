## Getting and Cleaning Data - Course Project  

###This is the course project for the Getting and Cleaning Data Coursera course. 

####The R script, `run_analysis.R`, does the following:  

It prepares the data by
Creating a directory, downloading the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzippping the data and setting the working directory


*Part 1. It loads the activity and feature info, test and training databases
 Merges the datasets, first the test and training sets by rows, then the subject, activity and data by column
*Part 2.  Picks out only the mean and standard deviation data by subsetting the data
*Part 3.  Replaces the code number with descriptive names for the activity. 
*Part 4.  Replaces the codes in the data names with descriptive terms.
*Part 5.  Creates and outputs a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.  The end result is shown in the file `tidydata.txt`.

