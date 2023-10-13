---
title: "Codebook"
author: "Fatima Zahrae"
date: "2023-10-12"
output:
  html_document: default
  pdf_document: default
editor_options:
  markdown:
    wrap: 72
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Project Description

The purpose of this project is to demonstrate our ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis.We are required to submit: 1) a tidy data
set as described below, 2) a link to a Github repository with our script
for performing the analysis, and 3) a code book that describes the
variables, the data, and any transformations or work that we performed
to clean up the data called CodeBook.md. We should also include a
README.md in the repo with our scripts. This repo explains how all of
the scripts work and how they are connected.

## Study design and data processing

### Collection of the raw data

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Eachperson performed six
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

### Notes on the original (raw) data Here are the data for the project:

[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Creating the tidy data file

### Guide to create the tidy data file

1.  Download the data and unzip the file in your working directory.\
2.  Load necessary libraries (dplyr) and (data.table)\
3.  Read the needed text files with read.table.\
    NB: the assignment asks to merge train and test sets, so I only
    choose train_X and test_X as observations because in the the README
    file they are defined as train and test sets.\
4.  Labell the train and test variables using the V2 of the features
    file.\
5.  Labell both train and test activities data by the label (activities)
    and the train and test subjects identifiers data by the label
    (subjectid)\
6.  Bind (rbind) the activities and subject columns to both train and
    test data.\
7.  Bind (cbind) the raws of train data and test data, to have a
    complete data (100% subjects), because test data contains 30% of
    subjects and train data contains 70% of subjects.\
8.  Select only variables for which the name contains either (mean) or
    (std) or (subjectid) or (activities)\
9.  Replace the numbers in the variable (activities) with the
    appropriate activities names using the V2 of activitys_names
    dataset.\
10. Replace the variable labels with descriptive variable names.\
11. Group the data by subject ids and activities and then calculate the
    mean of the rest of variables. That's your tidy data.

## Description of the variables in the tidy_data.txt file

General description of the file:

-   Dimensions of the dataset :

```{r tidydata}
dim(tidydata)
```

-   Summary of the data :

```{r tidydata}
summary(tidydata)
```

-   Variables present in the dataset :

```{r tidydata}
variable.names(tidydata)
```
