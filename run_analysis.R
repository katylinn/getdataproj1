library(dplyr)
library(data.table)

###########################################################################################
# This script run_analysis.R performs processing required for the course project.
#
# The necessary files are in a folder called "dataset" accessible in the working directory
#
# The files with the training data are in dataset/train
###########################################################################################

#dataset/features.txt contains the variable names for each measurement (will become column names)
features = read.table("dataset/features.txt")
#preprocess variable names to get human readable column names from the default 
#col.names behavior in read.table
features<-mutate(features, names=gsub("[(),]", "", V2))

#dataset/activity_labels.text contains a legend for activity codes. 
activity_labels = read.table("dataset/activity_labels.txt")

#read files for the test data
subject_test = read.table("dataset/test/subject_test.txt", col.names=c("subject_id"))
x_test = read.table("dataset/test/X_test.txt", col.names=features[["names"]])
y_test = read.table("dataset/test/y_test.txt", col.names=c("activity_code"))

#create data frame for test data.  
#first row is subject id, followed by activity code, then the measurements from x_test
test_data<-cbind(subject_test,y_test,x_test)
#perform the lookup for the activity labels based on the activity codes and add the column to the data frame
test_data<-mutate(test_data, activity_label=activity_labels[activity_code,2])

#read files for the training data
subject_train = read.table("dataset/train/subject_train.txt", col.names=c("subject_id"))
x_train = read.table("dataset/train/X_train.txt", col.names=features[["names"]])
y_train = read.table("dataset/train/y_train.txt", col.names=c("activity_code"))

#create data frame for training data.  
#first row is subject id, followed by activity code, then the measurements from x_train
train_data<-cbind(subject_train,x_train, y_train)
#perform the lookup for the activity labels based on the activity codes and add the column to the data frame
train_data<-mutate(train_data, activity_label=activity_labels[activity_code,2])

#combine data into one set
merged_data<-rbind(test_data, train_data)

#create new data frame with subject id, activity label and just the measurments that are means or std's
means<-select(merged_data,subject_id, activity_label, contains("mean"), contains("std"))
#remove the measurements that contain the word mean, but aren't means.
means<-select(means, -contains("angle"))

#group data frame by subject id and activity label
test_groups <- group_by(means, subject_id, activity_label)
#take the mean of each of the meansuments
measurement_means <-summarise_each(test_groups, funs(mean))
#ungroup
tidy_data<-data.frame(measurement_means)

write.table(tidy_data, row.name=FALSE, file="measurement_means.txt")



