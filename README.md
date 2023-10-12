---
title: "README"
author: "Fatima Zahrae"
date: "2023-10-11"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# week4-getting-and-cleaning-data
## Files in this repo

* README.md -- you are reading it right now
* CodeBook.md -- codebook describing variables, the data and transformations
* run_analysis.R -- actual R code

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  
These signals were used to estimate variables of the feature vector for each pattern:
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

**mean()**: Mean value
**std()**: Standard deviation  

## Description of the tidy DATA
The features I selected for this tidy database are the subject id the activities and the measurements on the mean and standard deviation for each measurement.
My data is considered tidy because, it contains the total number of subjects and the activities; each column is a different variable and each row represents an observation. The activities observations are labelled instead of numbers; The variables are labelled with descriptive variable names; for example : "TimeBodyAccjerkMagnitudeStd()" instead of tbodyaccjerkmagstd(), I replaced the leading t with Time and I switched the first letter of every word to capital letter. 

### Description of abbreviations of measurements
leading **Time** means it's a time domain signal.
leading **Freq** means it's a frequency domain signal.  
**Body** = related to body movement.  
**Gravity** = acceleration of gravity  
**Acc** = accelerometer measurements  
**Gyro** = gyroscopic measurements  
**Jerk** = sudden movement acceleration  
**Magnitude** = magnitude of movement  
**mean** and **SD** are calculated for each subject for each activity for each mean and SD measurements.

The units given are **g’s** for the accelerometer and **rad/sec** for the gyro and **g/sec** and **rad/sec/sec** for the corresponding jerks.

## librarys used in run_analysis.R

* library(dplyr)
* library(data.table)
