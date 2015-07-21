## This script does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.


## Read training set, activity classes, and subjects (takes time to run)
train_set <- read.table(file = "UCI HAR Dataset/train/X_train.txt",
                             header = FALSE, allowEscapes = TRUE)
train_activities <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")

## Merge loaded data into one training data set
train_data_set <- cbind(train_set, activities = train_activities,
                        subject = train_subject)


## Read test set, activity classes, and subjects
test_set <- read.table(file = "UCI HAR Dataset/test/X_test.txt",
                       header = FALSE, allowEscapes = TRUE)
test_activities <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")

## Merge loaded data into one test data set
test_data_set <- cbind(test_set, activities = test_activities,
                       subject = test_subject)


## Merge the training and the test sets to create one data set
merged_data_set <- rbind(test_data_set, train_data_set)


## Read features 
features <- read.table(file = "UCI HAR Dataset/features.txt", header = FALSE)

## Create feature names (convert data.frame columns 
## from factors to characters)
feature_names <- levels(features$V2)[as.numeric(features$V2)]

## Make variable names descriptive and readable by eliminating 
## special symbols and capitalizing "Mean" and "Std"
feature_names <- sapply(features$V2, function(x) {
  x <- gsub("\\(", "", x)  
  x <- gsub("\\)", "", x)
  x <- gsub(",", "", x)
  x <- gsub("-", "", x)
  x <- gsub("mean", "Mean",x)
  x <- gsub("std", "Std",x) })

## Read activities 
activities <- read.table(file = "UCI HAR Dataset/activity_labels.txt",
                         header = FALSE)

## add columns names to activities table
names(activities) <- c("class","name") 


## Create variable names to label the data set 
names(merged_data_set) <- c(feature_names, "activities", "subject")

## Use descriptive activity names to name the activities in the data set
## Change the activity class to activity name in the data set
merged_data_set$activities <- sapply(merged_data_set$activities, 
                    function(x) activities[activities$class==x,]$name)


## Retrieve columns with mean and standard deviation in the name
mean_col_names <- names(merged_data_set)[grep("Mean", names(merged_data_set))]
std_col_names <-  names(merged_data_set)[grep("Std", names(merged_data_set))]

## Exclude variables 47 to 53 of the mean_col_names which correspond to 
## features 555 to 561 of the merged_data_set and are not a part of the
## required subset (though contain "Mean"substring, because they describe
## an angle, but not mean_angle or so
mean_col_names <- mean_col_names[1:46]

## Create a subset which contains mean and std measurements only
mean_std_subset <- merged_data_set[ , c(mean_col_names, std_col_names,
                                       "activities","subject")]

## Create tidy data set with the average of each variable 
## for each activity and each subject
tidy_data_set <- aggregate(mean_std_subset[ , 
                  !(names(mean_std_subset) %in% c("activities", "subject"))],
                  list(mean_std_subset$activities, 
                  mean_std_subset$subject), mean)


## Label columns 1 and 2 of the tidy data set
names(tidy_data_set)[1] <- "activities"
names(tidy_data_set)[2] <- "subject"

## Write tidy data to a file
write.table(file = "tidy_data_set.txt", tidy_data_set, sep ='\t', 
            row.names = FALSE, quote = FALSE)

