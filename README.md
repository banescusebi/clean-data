# README
This repository contains the following files required for the "Mentor Graded Assignment: Getting and Cleaning Data Course Project" on Coursera, namely:

* *CodeBook.md* contains a code book that indicates all the variables and summaries calculated, along with units, and any other relevant information.
* *tidyDataset.txt* contains the tidy dataset with the average of each variable for each activity and each subject in the UCI HAR Dataset. This file should be loaded into R using the read.table function with header = TRUE. The dataset is tidy because it follows the 3 rules mentioned in the paper entitled "Tidy data" by Hadley Wickham, i.e.:
  * Each variable forms a column.
  * Each observation forms a row.
  * Each type of observational unit forms a table.

  Moreover the tidy dataset does not inolve any of the common problems of messy datasets, i.e.:
  * Column headers are values, not variable names.
  * Multiple variables are stored in one column.
  * Variables are stored in both rows and columns.
  * Multiple types of observational units are stored in the same table.
  * A single observational unit is stored in multiple tables.

* *README.md* (this file) contains an explanation of the files in this repository.

* *run_analysis.R* contains a well commented R script with 2 functions. The first function is called "steps1to4" (it performs steps 1 to 4 enumerated below) and the second function is called "step5" (it performs step 5 from below):
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set 
  4. Appropriately labels the data set with descriptive variable names.
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  Function **"steps1to4"** takes as input argument, an absolute or relative path to the folder in which the unpacked UCI HAR dataset is stored, i.e. this path should contain the folders called "train" and "test" as well as files "features.txt" and "activity_labels.txt". The return value of this function is the dataset from step 4, which should be given as input to function "step5".  
  Function **"step5"** creates a tidy data set with the average of each variable for each activity and each subject of the dataset passed as input. This agurment of this function should be the return value of the "steps1to4" function. This function represents the 5th step of the  assignment and it stores the tidy dataset in a text file and also returns the tidy dataset.

  At the end of the run_analysis.R file there are a few lines of code which call the 2 functions assuming the UCI HAR Dataset is in the working directory.
