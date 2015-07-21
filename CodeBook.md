---
title: "Tidy Data Dictionary"
output: html_document
---

This CodeBook describes variables, data, and transformations performed to clean up the source data and create a tidy dataset as per requirements of the "Getting and Cleaning Data" Course Project.


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


### Description of the Tidy Data Set

The tidy data set is a data frame which has 180 observations of 81 variables:
first two columns are activity and subject and next 79 columns are average values of each measurement variable for each activity and each subject.

#### Description of variables

#### 1. activities    
  
  * Activity Type, characters
  
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
    
#### 2. subject 
  
  * integer, 1...30
    * Unique identifier of the subject who carried out the experiment

#### 3. tBodyAccMeanX
 
  * decimal, -1...1
	  * Average of Mean of the X-axial body acceleration signal obtained by subtracting the gravity from the total acceleration from the smartphone accelerometer, X-axis, in standard gravity units 'g' 
  
#### 4. tBodyAccMeanY

  * decimal, -1...1
	  * Average of Mean of the Y-axial body acceleration signal obtained by subtracting the gravity from the total acceleration from the smartphone accelerometer, Y-axis, in standard gravity units 'g' 

#### 5. tBodyAccMeanZ

  * decimal, -1...1
	  * Average of Mean of the Z-axial body acceleration signal obtained by subtracting the gravity from the total acceleration from the smartphone accelerometer, Z-axis, in standard gravity units 'g' 

#### 6. tGravityAccMeanX
  
  * decimal, -1...1
  	* Average of Mean of the X-axial gravity acceleration signal from the smartphone accelerometer, X-axis, in standard gravity units 'g'

#### 7. tGravityAccMeanY

  * decimal, -1...1
  	* Average of Mean of the Y-axial gravity acceleration signal from the smartphone accelerometer, Y-axis, in standard gravity units 'g'

#### 8. tGravityAccMeanZ

  * decimal, -1...1
  	* Average of Mean of the Z-axial gravity acceleration signal from the smartphone accelerometer, Z-axis, in standard gravity units 'g'

#### 9. tBodyAccJerkMeanX

  * decimal -1...1
	  * Average of Mean of the X-axial body linear acceleration derived in the time domain to obtain Jerk signals

#### 10. tBodyAccJerkMeanY

  * decimal -1...1
	  * Average of Mean of the Y-axial body linear acceleration derived in the time domain to obtain Jerk signals

#### 11. tBodyAccJerkMeanZ

  * decimal -1...1
	  * Average of Mean of the Z-axial body linear acceleration derived in the time domain to obtain Jerk signals

#### 12. tBodyGyroMeanX

  * decimal -1...1
	  * Average of Mean of the X-axial angular velocity measured by the gyroscope for each window sample, in radians/second

#### 13. tBodyGyroMeanY

  * decimal -1...1
	  * Average of Mean of the Y-axial angular velocity measured by the gyroscope for each window sample, in radians/second

#### 14. tBodyGyroMeanZ

  * decimal -1...1
	  * Average of Mean of the Z-axial angular velocity measured by the gyroscope for each window sample, in radians/second

#### 15. tBodyGyroJerkMeanX

  * decimal -1...1
	  * Average of Mean of the X-axial angular velocity derived in the time domain to obtain Jerk signals 

#### 16. tBodyGyroJerkMeanY

  * decimal -1...1
	  * Average of Mean of the Y-axial angular velocity derived in the time domain to obtain Jerk signals 

#### 17. tBodyGyroJerkMeanZ

  * decimal -1...1
	  * Average of Mean of the Z-axial angular velocity derived in the time domain to obtain Jerk signals 

#### 18. tBodyAccMagMean

  * decimal -1...1
 	  * Average of Mean of the magnitude of three-dimensional body linear acceleration in the time domain calculated using the Euclidean norm 

#### 19. tGravityAccMagMean

  * decimal -1...1
 	  * Average of Mean of the magnitude of three-dimensional gravity acceleration in the time domain calculated using the Euclidean norm 

#### 20. tBodyAccJerkMagMean

  * decimal -1...1
 	  * Average of Mean of the magnitude of three-dimensional body linear acceleration derived in the time to obtain Jerk signals calculated using the Euclidean norm  

#### 21. tBodyGyroMagMean

  * decimal -1...1
 	  * Average of Mean of the magnitude of three-dimensional angular velocity in the time domain calculated using the Euclidean norm 

#### 22. tBodyGyroJerkMagMean

  * decimal -1...1
	  * Average of Mean of the magnitude of three-dimension alangular velocity derived in the time to obtain Jerk signals calculated using the Euclidean norm

#### 23. fBodyAccMeanX

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to X-axial body linear acceleration signal 

#### 24. fBodyAccMeanY

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Y-axial body linear acceleration signal 

#### 25. fBodyAccMeanZ

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Z-axial body linear acceleration signal 

#### 26. fBodyAccMeanFreqX

  * decimal -1...1
    * Average of gravity acceleration mean frequency, X-axis, frequency domain 

#### 27. fBodyAccMeanFreqY

  * decimal -1...1
    * Average of gravity acceleration mean frequency, Y-axis, frequency domain 

#### 28. fBodyAccMeanFreqZ

  * decimal -1...1  
    * Average of gravity acceleration mean frequency, Z-axis, frequency domain 

#### 29. fBodyAccJerkMeanX

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to X-axial body linear acceleration to obtain Jerk signals 

#### 30. fBodyAccJerkMeanY

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Y-axial body linear acceleration to obtain Jerk signals

#### 31. fBodyAccJerkMeanZ

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Z-axial body linear acceleration to obtain Jerk signals

#### 32. fBodyAccJerkMeanFreqX

  * decimal -1...1
    * Average of body acceleration Jerk signal mean frequency, X-axis, frequency domain

#### 33. fBodyAccJerkMeanFreqY

  * decimal -1...1
    * Average of body acceleration Jerk signal mean frequency, Y-axis, frequency domain

#### 34. fBodyAccJerkMeanFreqZ

  * decimal -1...1
    * Average of body acceleration Jerk signal mean frequency, Z-axis, frequency domain

#### 35. fBodyGyroMeanX

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to X-axial angular velocity acceleration signal  

#### 36. fBodyGyroMeanY

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Y-axial angular velocity acceleration signal

#### 37. fBodyGyroMeanZ

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Z-axial angular velocity acceleration signal

#### 38. fBodyGyroMeanFreqX

  * decimal -1...1
    * Average of body gyroscope mean frequency, X-axis, frequency domain

#### 39. fBodyGyroMeanFreqY

  * decimal -1...1
    * Average of body gyroscope mean frequency, Y-axis, frequency domain

#### 40. fBodyGyroMeanFreqZ

  * decimal -1...1
    * Average of body gyroscope mean frequency, Z-axis, frequency domain

#### 41. fBodyAccMagMean

  * decimal -1...1
    * Average of body acceleration magnitude mean, frequency domain

#### 42. fBodyAccMagMeanFreq

  * decimal -1...1
    * Average of body acceleration magnitude mean freaquency

#### 43. fBodyBodyAccJerkMagMean

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to the magnitude of three-dimensional body linear acceleration derived in the time domain to obtain Jerk signals calculated using the Euclidean norm 
  
#### 44. fBodyBodyAccJerkMagMeanFreq

  * decimal -1...1
    * Average of body acceleration Jerk signal magnitude mean frequency

#### 45. fBodyBodyGyroMagMean

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to the magnitude of angular velocity calculated using the Euclidean norm

#### 46. fBodyBodyGyroMagMeanFreq

  * decimal -1...1
    * Average of body gyroscope magnitude mean frequency

#### 47. fBodyBodyGyroJerkMagMean

  * decimal -1...1
	  * Average of Mean of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to the magnitude of angular velocity derived to obtain Jerk signals calculated using the Euclidean norm 

#### 48. fBodyBodyGyroJerkMagMeanFreq

  * decimal -1...1
    * Average of body gyroscope mean Jerk signal magnitude mean frequency

#### 49. tBodyAccStdX

  * decimal -1...1
	  * Average of Standard deviation of the X-axial body acceleration signal obtained by subtracting the gravity from the total acceleration from the smartphone accelerometer, X-axis, in standard gravity units 'g' 

#### 50. tBodyAccStdY

  * decimal -1...1
	  * Average of Standard deviation of the Y-axial body acceleration signal obtained by subtracting the gravity from the total acceleration from the smartphone accelerometer, Y-axis, in standard gravity units 'g' 

#### 51. tBodyAccStdZ

  * decimal -1...1
	  * Average of Standard deviation of the Z-axial body acceleration signal obtained by subtracting the gravity from the total acceleration from the smartphone accelerometer, Z-axis, in standard gravity units 'g' 

#### 52. tGravityAccStdX

  * decimal -1...1
	  * Average of Standard deviation of the X-axial gravity acceleration signal from the smartphone accelerometer, X-axis, in standard gravity units 'g' 

#### 53. tGravityAccStdY

  * decimal -1...1
	  * Average of Standard deviation of the Y-axial gravity acceleration signal from the smartphone accelerometer, Y-axis, in standard gravity units 'g' 

#### 54. tGravityAccStdZ

  * decimal -1...1
	  * Average of Standard deviation of the Z-axial gravity acceleration signal from the smartphone accelerometer, Z-axis, in standard gravity units 'g' 

#### 55. tBodyAccJerkStdX

  * decimal -1...1
	  * Average of Standard deviation of the X-axial body linear acceleration derived in the time to obtain Jerk signals 

#### 56. tBodyAccJerkStdY

  * decimal -1...1
	  * Average of Standard deviation of the Y-axial body linear acceleration derived in the time to obtain Jerk signals 

#### 57. tBodyAccJerkStdZ

  * decimal -1...1
	  * Average of Standard deviation of the Z-axial body linear acceleration derived in the time to obtain Jerk signals 

#### 58. tBodyGyroStdX

  * decimal -1...1
	  * Average of Standard deviation of the X-axial angular velocity measured by the gyroscope for each window sample

#### 59. tBodyGyroStdY

  * decimal -1...1
	  * Average of Standard deviation of the Y-axial angular velocity measured by the gyroscope for each window sample

#### 60. tBodyGyroStdZ

  * decimal -1...1
	  * Average of Standard deviation of the Z-axial angular velocity measured by the gyroscope for each window sample

#### 61. tBodyGyroJerkStdX

  * decimal -1...1
	  * Average of Standard deviation of the X-axial angular velocity derived in the time domain to obtain Jerk signals 

#### 62. tBodyGyroJerkStdY

  * decimal -1...1
	  * Average of Standard deviation of the Y-axial angular velocity derived in the time domain to obtain Jerk signals 

#### 63. tBodyGyroJerkStdZ

  * decimal -1...1
	  * Average of Standard deviation of the Z-axial angular velocity derived in the time domain to obtain Jerk signals 

#### 64. tBodyAccMagStd

  * decimal -1...1
 	  * Average of Standard deviation of the magnitude of three-dimensional body linear acceleration calculated using the Euclidean norm 

#### 65. tGravityAccMagStd

  * decimal -1...1
 	  * Average of Standard deviation of the magnitude of three-dimensional gravity acceleration calculated using the Euclidean norm 

#### 66. tBodyAccJerkMagStd

  * decimal -1...1
 	  * Average of Standard deviationof the magnitude of three-dimensional body linear acceleration derived in the time domain to obtain Jerk signals calculated using the Euclidean norm 

#### 67. tBodyGyroMagStd

  * decimal -1...1
 	  * Average of Standard deviation of the magnitude of three-dimensional angular velocity calculated using the Euclidean norm 

#### 68. tBodyGyroJerkMagStd

  * decimal -1...1
	  * Average of Standard deviation of the magnitude of three-dimension alangular velocity   derived in the time domain to obtain Jerk signals calculated using the Euclidean norm 

#### 69. fBodyAccStdX

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to X-axial body linear acceleration signal
 

#### 70. fBodyAccStdY

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Y-axial body linear acceleration signal

#### 71. fBodyAccStdZ

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Z-axial body linear acceleration signal

#### 72. fBodyAccJerkStdX

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to X-axial body linear acceleration to obtain Jerk signals 

#### 73. fBodyAccJerkStdY

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Y-axial body linear acceleration to obtain Jerk signals 

#### 74. fBodyAccJerkStdZ

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Z-axial body linear acceleration to obtain Jerk signals 

#### 75. fBodyGyroStdX

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to X-axial angular velocity acceleration signal 

#### 76. fBodyGyroStdY

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Y-axial angular velocity acceleration signal 

#### 77. fBodyGyroStdZ

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to Z-axial angular velocity acceleration signal 

#### 78. fBodyAccMagStd

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to the magnitude of three-dmensional liner body acceleration calculated using the Euclidean norm

#### 79. fBodyBodyAccJerkMagStd

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to the magnitude of three-dimensional body linear acceleration derived to obtain Jerk signals calculated using the Euclidean norm 

#### 80. fBodyBodyGyroMagStd

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal produced by applying a Fast Fourier Transform (FFT) to the magnitude of angular velocity calculated using the Euclidean norm 

#### 81. fBodyBodyGyroJerkMagStd

  * decimal -1...1
	  * Average of Standard deviation of the frequency domain signal producted by applying a Fast Fourier Transform (FFT) to the magnitude of angular velocity derived to obtain Jerk signals calculated using the Euclidean norm 
	
