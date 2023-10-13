# Load necessary libraries
library(data.table)
library(dplyr)
# Set working directory
setwd("C:\\Users\\dell\\Documents")
# Define file path
zipfile<-"C:\\Users\\dell\\Desktop\\getdata_projectfiles_UCI HAR Dataset.zip"
#unzip file
unzip(zipfile,exdir = "Working directory")
#reading the needed files for the assignment from  the folder
testSet<-read.table("./Working directory/UCI HAR Dataset/test/X_test.txt",header = FALSE)
TrainSet<-read.table("./Working directory/UCI HAR Dataset/train/X_train.txt",header = FALSE)
features<-read.table("./Working directory/UCI HAR Dataset/features.txt",header = FALSE)
activitys_names<-read.table("./Working directory/UCI HAR Dataset/activity_labels.txt", header = FALSE)
train_activities<-read.table("./Working directory/UCI HAR Dataset/train/Y_train.txt",header=FALSE)
train_subjects<-read.table("./Working directory/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
test_activities<-read.table("./Working directory/UCI HAR Dataset/test/Y_test.txt",header=FALSE)
test_subjects<-read.table("./Working directory/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
#rename colomuns in train set
names(TrainSet)<-features$V2
#rename colomuns in test set
names(testSet)<-features$V2
#rename colomun in activitys set in train
names(train_activities)<-"activities"
#rename colomun in activitys set in test
names(test_activities)<-"activities"
#rename colomun in subject set in train
names(train_subjects)<-"subjectid"
#rename colomun in subject set in test
names(test_subjects)<-"subjectid"
# add subject and acitivities sets to train set
Complete_trainSet=cbind(train_subjects,train_activities,TrainSet)
# add subject and acitivities sets to test set
Complete_testSet=cbind(test_subjects,test_activities,testSet)
#question 1 : Merged_data is the merge of the training and the test sets
Merged_data<-rbind(Complete_trainSet,Complete_testSet)
#question 2 : Short_data is the dataset containing only the mean and standard deviation for each measurement
Short_data<-Merged_data%>%select(matches('mean()|std()|subject|activities'))
#question 3 : Short_data1 is Short_data with descriptive activities names
Short_data1<-Short_data %>% 
  arrange(activities) %>% 
  mutate(activities = as.character(factor(activities, levels=1:6, 
                                          labels= activitys_names$V2)))
#question 4 :data set with descriptive variable names.
names(Short_data1)<-gsub("tBodyAcc-","TimebodyAcc",names(Short_data1))
names(Short_data1)<-gsub("tBodyAccMag-","TimebodyAccMagnitude",names(Short_data1))
names(Short_data1)<-gsub("tBodyAccJerk-","TimeBodyAccjerk",names(Short_data1))
names(Short_data1)<-gsub("tBodyAccJerkMag-","TimeBodyAccjerkMagnitude",names(Short_data1))
names(Short_data1)<-gsub("tGravityAcc-","TimegravityAcc",names(Short_data1))
names(Short_data1)<-gsub("tGravityAccMag-","TimeGravityAccMagnitude",names(Short_data1))
names(Short_data1)<-gsub("tBodyGyro-","TimeBodyGyro",names(Short_data1))
names(Short_data1)<-gsub("tBodyGyroMag-","TimeBodyGyroMagnitude",names(Short_data1))
names(Short_data1)<-gsub("tBodyGyroJerk-","TimeBodyGyrojerk",names(Short_data1))
names(Short_data1)<-gsub("tBodyGyroJerkMag-","TimeBodyGyrojerkMagnitude",names(Short_data1))
names(Short_data1)<-gsub("fBodyAcc-","FreqBodyAcc",names(Short_data1))
names(Short_data1)<-gsub("fBodyAccMag-","FreqBodyAccMagnitude",names(Short_data1))
names(Short_data1)<-gsub("fBodyAccJerk-","FreqBodyAccjerk",names(Short_data1))
names(Short_data1)<-gsub("fBodyGyro-","FreqBodyGyro",names(Short_data1))
names(Short_data1)<-gsub("fBodyAccJerkMag-","FreqBodyAccjerkMagnitude",names(Short_data1))
names(Short_data1)<-gsub("fBodyGyroMag-","FreqBodyGyroMagnitude",names(Short_data1))
names(Short_data1)<-gsub("fBody","FreqBody",names(Short_data1))
names(Short_data1)<-gsub("mean","Mean",names(Short_data1))
names(Short_data1)<-gsub("std","Std",names(Short_data1))
#question 5 :tidy data set with the average of each variable for each activity and each subject
tidydata<-Short_data1 %>% group_by(subjectid,activities) %>% summarise_all(mean)
# Save tidy data
write.table(tidydata, "TidyData.txt", row.name = FALSE)
