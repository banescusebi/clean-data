# CodeBook

This code book that modifies and updates the codebooks available in the UCI HAR Dataset with the data to indicate all the variables and summaries calculated in the tidy dataset, along with units, and any other relevant information.

Column Name | Unit | Possible Values or Range | Description
------------|------|--------------------------|------------
activityName | Factor | LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS | A descriptive name of the activity performed by a subject during the measurement corresponding to the current row.
subject | Integer | 1..30 | Identification (ID) number of the subject that performed the activity for the current row.
tBodyAcc.{mean|std}.{X|Y|Z} | Double | -1..1 | Mean value of body accelleration signal along

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag
