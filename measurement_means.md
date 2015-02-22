#Codebook

This document describes the data set written in measurement_means.txt

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

There is 1 row for each subject doing each activity.  The values listed in this table are the *means* of each of the values measured in the original data set.

###Description of Variables


subject_id                  : Coded participant ID for the 30 subjects

activity_label              : activity performed by participant-WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

####Measurements
The remainder of the the values are means of measurements taken during the experiment.  

  The prefix “t” is used to denote time  
  The prefix “f” is used to denote frequency domain signals

More information available in features_info.txt within the data set.

tBodyAcc.mean.X  
tBodyAcc.mean.Y  
tBodyAcc.mean.Z               
tGravityAcc.mean.X           
tGravityAcc.mean.Y           
tGravityAcc.mean.Z           
tBodyAccJerk.mean.X          
tBodyAccJerk.mean.Y          
tBodyAccJerk.mean.Z          
tBodyGyro.mean.X             
tBodyGyro.mean.Y             
tBodyGyro.mean.Z             
tBodyGyroJerk.mean.X         
tBodyGyroJerk.mean.Y         
tBodyGyroJerk.mean.Z         
tBodyAccMag.mean             
tGravityAccMag.mean          
tBodyAccJerkMag.mean         
tBodyGyroMag.mean            
tBodyGyroJerkMag.mean        
fBodyAcc.mean.X              
fBodyAcc.mean.Y              
fBodyAcc.mean.Z              
fBodyAcc.meanFreq.X          
fBodyAcc.meanFreq.Y          
fBodyAcc.meanFreq.Z          
fBodyAccJerk.mean.X          
fBodyAccJerk.mean.Y          
fBodyAccJerk.mean.Z          
fBodyAccJerk.meanFreq.X      
fBodyAccJerk.meanFreq.Y      
fBodyAccJerk.meanFreq.Z      
fBodyGyro.mean.X             
fBodyGyro.mean.Y             
fBodyGyro.mean.Z             
fBodyGyro.meanFreq.X         
fBodyGyro.meanFreq.Y         
fBodyGyro.meanFreq.Z         
fBodyAccMag.mean             
fBodyAccMag.meanFreq         
fBodyBodyAccJerkMag.mean     
fBodyBodyAccJerkMag.meanFreq   
fBodyBodyGyroMag.mean        
fBodyBodyGyroMag.meanFreq    
fBodyBodyGyroJerkMag.mean    
fBodyBodyGyroJerkMag.meanFreq  
tBodyAcc.std.X               
tBodyAcc.std.Y               
tBodyAcc.std.Z               
tGravityAcc.std.X            
tGravityAcc.std.Y            
tGravityAcc.std.Z            
tBodyAccJerk.std.X           
tBodyAccJerk.std.Y           
tBodyAccJerk.std.Z           
tBodyGyro.std.X              
tBodyGyro.std.Y              
tBodyGyro.std.Z              
tBodyGyroJerk.std.X          
tBodyGyroJerk.std.Y          
tBodyGyroJerk.std.Z          
tBodyAccMag.std              
tGravityAccMag.std           
tBodyAccJerkMag.std          
tBodyGyroMag.std             
tBodyGyroJerkMag.std         
fBodyAcc.std.X               
fBodyAcc.std.Y               
fBodyAcc.std.Z               
fBodyAccJerk.std.X           
fBodyAccJerk.std.Y           
fBodyAccJerk.std.Z           
fBodyGyro.std.X              
fBodyGyro.std.Y              
fBodyGyro.std.Z              
fBodyAccMag.std              
fBodyBodyAccJerkMag.std      
fBodyBodyGyroMag.std         
fBodyBodyGyroJerkMag.std     