---
title: "README"
output: html_document
---

This document describes variables, data, and transformations performed to clean up the source data and create a tidy dataset as per requirements of the "Getting and Cleaning Data" Course Project.

### File List

  * ReadMe.md: this document
  * run_analysis.R: script to create tidy data set
  * CodeBook.md: describes the variables in the tidy data set

### Original Data Set

The source data experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The original data set is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Files from the original data set used for further analysis

  * features.txt: 561 rows of 2 variables - feature identifier and feature name 
  * activity_labels.txt: 6 rows of 2 variables - activity identifier and activity name
  * test/X_test.txt: Test data set, 2947 rows of 561 variables - measurement variables listed in features.txt
  * test/y_test.txt: 2947 rows of 1 variable - activity identifier for test data
  * test/subject_test.txt: 2497 rows of 1 variable - subject identifier for test data
  * train/X_train.txt: 7352 rows of 561 variables - measurement variables listed in features.txt 
  * train/y_train.txt: 7352 rows of 1 variable - activity identifier for train data
  * train/subject_train.txt: 7352 rows of 1 variable - subject identifier for train data
  

### Transformations performed on the original data set to get a tidy data set

The run_analysis.R script does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation 
for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set.
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject.

Before running run_analysis.R download the original data set from the URL mentioned above and unzips it into the R working directory to create "UCI HAR Dataset" folder.

#### Detailed steps in run_analysis.R 

  * Read "train" and "test" data sets and create data frames from them
  * Merge the training and the test sets to create one data frame 
  * Extracts a subset of data with only the measurements on the mean and standard deviation for each measurement, resulting in 81 measurement variables.
  * Update the variable names to improve readability. 
  * Appropriately label the data set with descriptive activity names
  * Create a second (tidy) data set with average of each measurement variable for each activity and each subject
  * Write the tidy data set to a text file 
  
In this way the script generates a tidy data set that meets the following principles:

  * Each variable is in one column
  * Each different observation of that variable is in a different row
  * All columns have headings

The tidy data set can be read into R with 

```{r}
read.table("tidy_data_set.txt", header=TRUE)
```
