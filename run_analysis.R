## This R script was written as part of the "Mentor Graded Assignment: Getting
## and Cleaning Data Course Project" from Coursera. It does the following:
##
## - Downloads and unpacks the "Human Activity Recognition Using Smartphones
##   Dataset" from the given URL.
## - Merges the training and the test sets to create one data set.
## - Extracts only the measurements on the mean and standard deviation for each
##   measurement.
## - Uses descriptive activity names to name the activities in the data set
## - Appropriately labels the data set with descriptive variable names.
## - Creates a second, independent tidy data set with the average of each
##   variable for each activity and each subject.
##
## author: Sebastian Banescu

library(dplyr)

## This function performs the first 4 steps of the assignment. The input 
## argument of this function should be an absolute or relative path to the
## folder in which the unpacked UCI HAR dataset is stored, i.e. this path
## should contain the folders called "train" and "test" as well as files
## "features.txt" and "activity_labels.txt". The return value of this function
## is the dataset from step 4, which should be given as input to the following
## function defined in this file, called "step5".
steps1to4 = function(pathToDataset) {
  ## Download and unpakc UCI HAR dataset, if it is not already available.
  if (!file.exists(pathToDataset)) {
    if (!file.exists("./UCI_HAR_Dataset.zip")) {
      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                    destfile = "./UCI_HAR_Dataset.zip")
    }
    unzip("./UCI_HAR_Dataset.zip", exdir = pathToDataset, junkpaths = TRUE)
  }
  
  ## Load the measurements, labels and subjects for both training and test sets.
  trainingSet = read.table(paste0(pathToDataset, "/train/X_train.txt"))
  trainingLabels = read.table(paste0(pathToDataset, "/train/y_train.txt"))
  trainingSubjects = read.table(paste0(pathToDataset, "/train/subject_train.txt"))
  
  testSet = read.table(paste0(pathToDataset, "/test/X_test.txt"))
  testLabels = read.table(paste0(pathToDataset, "/test/y_test.txt"))
  testSubjects = read.table(paste0(pathToDataset, "/test/subject_test.txt"))
  
  ## Merge the training and the test sets to create one data set.
  ## The measurements are not yet merged with the labels and the subjects. This
  ## will be done after selecting only the measurements for the mean and the 
  ## standard deviation, in order to keep the select statement simple.
  uciHarDataset = rbind(trainingSet, testSet)
  uciHarLabels = rbind(trainingLabels, testLabels)
  uciHarSubjects = rbind(trainingSubjects, testSubjects)
  
  ## Create a data frame tbl for convenient coding and processing speed.
  uciHarDataset = tbl_df(uciHarDataset)
  
  ## Appropriately label the data set with descriptive variable names.
  ## Load the 561 feature names from the "features.txt" file, which gives
  ## all the names of the columns in the measurements set loaded previously.
  varNames = read.table(paste0(pathToDataset, "/features.txt"))
  
  ## When assigning the variable names, call make.names because some names may
  ## contain illegal characters such as brackets "()". The function make.names
  ## converts the illegal characters into legal ones and also makes sure the 
  ## neames are unique, since "unique = TRUE". 
  names = make.names(varNames$V2, unique = TRUE)
  ## Replace all occurances of multiple "." characters by just one ".".
  names = sapply(names, function(s) gsub("[\\.]{2, }", ".", s))
  ## Remove all occurances of "." at the end of a variable name.
  names = sapply(names, function(s) sub("\\.$", "", s))
  colnames(uciHarDataset) = names
  
  ## Extract only the measurements on the mean and standard deviation for each measurement.
  ## Only variables (columns) names which have the sequence of characters: "mean",
  ## "Mean", "std" or "Std" are selected.
  uciHarDataset = uciHarDataset %>% 
                  select(matches("[mM]ean|[sS]td"))
  
  ## Bind the labels and the subjects columns to the measurements.
  uciHarDataset$V1 = uciHarLabels$V1
  uciHarDataset$subject = uciHarSubjects$V1
  
  ## Use descriptive activity names to name the activities in the data set.
  ## Load the activity labels from "activity_labels.txt" and join them
  ## with our dataset on the "V1" column which represents the ID of the activity.
  activityLabels = read.table(paste0(pathToDataset, "/activity_labels.txt"))
  uciHarDataset = inner_join(uciHarDataset, activityLabels, by = "V1")
  
  ## Give a descriptive name to the last column which should now contain
  ## descriptive activity names, because of the previous join.
  colnames(uciHarDataset)[length(colnames(uciHarDataset))] = "activityName"
  
  ## Remove the "V1" column which indicates a nondescriptive ID of the activity.
  uciHarDataset = uciHarDataset %>% select(-V1)
  
  ## Return the dataset from step 4.
  uciHarDataset
}

## This function creates a tidy data set with the average of each variable
## for each activity and each subject of the dataset passed as input.
## This agurment of this function should be the return value of the "steps1to4"
## function defined above. This function represents the 5th step of the 
## assignment and it stores the tidy dataset in a CSV file and also returns the
## tidy dataset.
step5 = function(uciHarDataset) {
  ## First group the dataset by activity name and subject. Second, summarize
  ## each column according to the groupings where our summary function is the mean.
  tidyDataset = uciHarDataset %>% 
                group_by(activityName, subject) %>%
                summarise_each(funs(mean))
  
  ## Save the tidy dataset as a CSV file. This is the file which is also part of
  ## the Github repository.
  write.csv(tidyDataset, file = "./tidyDataset.csv")
  
  ## Return tidy dataset from step 5.
  tidyDataset
}