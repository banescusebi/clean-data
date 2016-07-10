# CodeBook

This code book that modifies and updates the codebooks available in the UCI HAR Dataset with the data to indicate all the variables and summaries calculated in the tidy dataset, along with units, and any other relevant information.


Variable Name | Unit | Possible Values or Range | Description
--------------|------|--------------------------|------------
activityName | Factor | LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS | A descriptive name of the activity performed by the subject.
subjectId | Integer | 1..30 | Identification (ID) number of the subject that performed the activity.
signal | Factor | tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, fBodyAcc, fBodyAccJerk, fBodyGyro | "The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ. (Note the 'f' to indicate frequency domain signals)." -- (Source: features_info.txt)
measure | Factor | mean, std | The type of measuring function applied to the signal i.e. mean or standard deviation (std).
axis | Factor | X, Y, Z | The axis along which the measurement is performed.
value | Double | -1..1 | The actual measurement value. 
