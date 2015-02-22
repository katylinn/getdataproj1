# Course Project for Getting and Cleaning Data

This document describes the processing done on the provided dataset in order to create the measurement_means dataset

##Source Data 
The original data for the assignment comes from an experiment regarding Human Activity Recognition using smartphones.  

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Excerpted from the README from the original data set:
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

More a full description of how data was collected.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Measurement_Means dataset
The submitted data set was created for a class project which asked us to start with the dataset described above and perform the following processing/analysis:

You should create one R script called run_analysis.R that does the following. 
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Measurement_means is the output from step 5 of this script.

##Processing

###1.  Reading and merging data
There are 2 data sets to combine, provided in the test and train folders in the data set.  Each data set is distributed in 3 files.  These files are read in separately and combine using a cbind.

```r
#read files for the test data
subject_test = read.table("dataset/test/subject_test.txt", col.names=c("subject_id"))
x_test = read.table("dataset/test/X_test.txt", col.names=features[["names"]])
y_test = read.table("dataset/test/y_test.txt", col.names=c("activity_code"))

#create data frame for test data.  
#first row is subject id, followed by activity code, then the measurements from x_test
test_data<-cbind(subject_test,y_test,x_test)
``` 

The two data sets, train and test are combine using rbind
```r
#combine data into one set
merged_data<-rbind(test_data, train_data)
``` 

#####A note about column names
The feature names are found in features.txt.  However, the syntax used causes problems for some of the dplyr operations used.  So, the names are preprocessed to remove (,),and , characters before passed as column names when the data is read in.  This provides a balance between the “human readable” names which can be pulled verbatim from the file, and the syntax corrected names which are created by default in R.
```r
#dataset/features.txt contains the variable names for each measurement (will become column names)
features = read.table("dataset/features.txt")
#preprocess variable names to get human readable column names from the default 
#col.names behavior in read.table
features<-mutate(features, names=gsub("[(),]", "", V2))
``` 

###Translating Activity Codes
The data set provides activity_codes.txt to describe activities indicated by the different codes.  This information is used as a lookup table to label the rows.
```r
#dataset/activity_labels.text contains a legend for activity codes. 
activity_labels = read.table("dataset/activity_labels.txt")
train_data<-mutate(train_data, activity_label=activity_labels[activity_code,2])
``` 

###Extracting mean and standard deviation measurements
Inspection of the features.txt files indicates that these measurements can be selected by searching for the strings “mean” and “std” in the column names.  However, the string “mean” also appears in the angle() measurements, so those need to me removed from the set.

```r
#create new data frame with subject id, activity label and just the measurements that are means or std's
means<-select(merged_data,subject_id, activity_label, contains("mean"), contains("std"))
#remove the measurements that contain the word mean, but aren't means.
means<-select(means, -contains("angle"))
``` 

###Averaging by subject_id and activity type
The final step asks for a data set with the average variable for each activity and subject.  This can be done using the dplyr group_by and summarise_each functions, summarizing by “mean”
```r
#group data frame by subject id and activity label
test_groups <- group_by(means, subject_id, activity_label)
#take the mean of each of the meansuments
measurement_means <-summarise_each(test_groups, funs(mean))
``` 

The final data is written to measurement_means.txt  
A codebook is included (measurement_means.md) to describe the final data set

