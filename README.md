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

###Reading Data
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
