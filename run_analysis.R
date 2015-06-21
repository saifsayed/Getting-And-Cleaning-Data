#You should create one R script called run_analysis.R that does the following. 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#setwd("C:/Users/saif/Videos/Study/John Hopkins-Data Science/Course 3-Getting and Cleaning Data")
#Read Test Data
Test_Data_Subject <-read.table("./UCI HAR Dataset/test/subject_test.txt")
Test_Data_Features<-read.table("./UCI HAR Dataset/test/X_test.txt")
Test_Data_Activity<-read.table("./UCI HAR Dataset/test/Y_test.txt")
Test_Data         <-cbind(Test_Data_Subject,Test_Data_Activity,Test_Data_Features)
#Read Training Data
Train_Data_Subject <-read.table("./UCI HAR Dataset/train/subject_train.txt")
Train_Data_Features<-read.table("./UCI HAR Dataset/train/X_train.txt")
Train_Data_Activity<-read.table("./UCI HAR Dataset/train/Y_train.txt")
Train_Data         <-cbind(Train_Data_Subject,Train_Data_Activity,Train_Data_Features)
#Combining Test and Tain Data
Data               <-rbind(Test_Data,Train_Data)
#Reading the Feature names table
Features_Names    <-read.table("./UCI HAR Dataset/features.txt")

#filtering mean and std value col names
names_mean  <-grep("mean()",Features_Names[,2],value=TRUE,fixed=TRUE)
names_std   <-grep("std()",Features_Names[,2],value=TRUE,fixed=TRUE)
names_temp  <-c(names_mean,names_std)
names_temp1 <-gsub("-","",names_temp)
names_final <-gsub("\\()","",names_temp1)
cols_sub    <-c("Subject","Activity",as.character(names_final))

#naming the columns
Fnames_temp1      <-gsub("-","",Features_Names[,2])
Features_Names[,2]<-gsub("\\()","",Fnames_temp1)
cols<-c("Subject","Activity",as.character(Features_Names[,2]))
colnames(Data) <- cols

#filtering specific cols
Data_sub<-Data[,cols_sub]

#Order the data, first subject then activity
Data$Subject<-as.factor(Data$Subject)
Data$Activity<-as.factor(Data$Activity)
library(dplyr)
tempdata<-group_by(Data_sub,Subject,Activity)
Result<-summarize(tempdata,meantBodyAccmeanX=mean(tBodyAccmeanX),
meantBodyAccmeanY=mean(tBodyAccmeanY),
meantBodyAccmeanZ=mean(tBodyAccmeanZ),           
meantGravityAccmeanX=mean(tGravityAccmeanX),
meantGravityAccmeanY=mean(tGravityAccmeanY),
meantGravityAccmeanZ=mean(tGravityAccmeanZ),    
meantBodyAccJerkmeanX=mean(tBodyAccJerkmeanX),
meantBodyAccJerkmeanY=mean(tBodyAccJerkmeanY),
meantBodyAccJerkmeanZ=mean(tBodyAccJerkmeanZ),
meantBodyGyromeanX=mean(tBodyGyromeanX),
meantBodyGyromeanY=mean(tBodyGyromeanY),
meantBodyGyromeanZ=mean(tBodyGyromeanZ),
meantBodyGyroJerkmeanX=mean(tBodyGyroJerkmeanX),
meantBodyGyroJerkmeanY=mean(tBodyGyroJerkmeanY),
meantBodyGyroJerkmeanZ=mean(tBodyGyroJerkmeanZ),
meantBodyAccMagmean=mean(tBodyAccMagmean),
meantGravityAccMagmean=mean(tGravityAccMagmean),
meantBodyAccJerkMagmeant=mean(tBodyAccJerkMagmean),
meantBodyGyroMagmean=mean(tBodyGyroMagmean),
meantBodyGyroJerkMagmean=mean(tBodyGyroJerkMagmean),
meanfBodyAccmeanX=mean(fBodyAccmeanX),
meanfBodyAccmeanY=mean(fBodyAccmeanY),
meanfBodyAccmeanZ=mean(fBodyAccmeanZ),
meanfBodyAccJerkmeanX=mean(fBodyAccJerkmeanX),
meanfBodyAccJerkmeanY=mean(fBodyAccJerkmeanY),
meanfBodyAccJerkmeanZ=mean(fBodyAccJerkmeanZ),
meanfBodyGyromeanX=mean(fBodyGyromeanX),
meanfBodyGyromeanY=mean(fBodyGyromeanY),
meanfBodyGyromeanZ=mean(fBodyGyromeanZ),
meanfBodyAccMagmean=mean(fBodyAccMagmean),
meanfBodyBodyAccJerkMagmean=mean(fBodyBodyAccJerkMagmean),
meanfBodyBodyGyroMagmean=mean(fBodyBodyGyroMagmean),
meanfBodyBodyGyroJerkMagmean=mean(fBodyBodyGyroJerkMagmean),
meantBodyAccstdX=mean(tBodyAccstdX),
meantBodyAccstdY=mean(tBodyAccstdY),
meantBodyAccstdZ=mean(tBodyAccstdZ),
meantGravityAccstdX=mean(tGravityAccstdX),
meantGravityAccstdY=mean(tGravityAccstdY),
meantGravityAccstdZ=mean(tGravityAccstdZ),
meantBodyAccJerkstdX=mean(tBodyAccJerkstdX),
meantBodyAccJerkstdY=mean(tBodyAccJerkstdY),
meantBodyAccJerkstdZ=mean(tBodyAccJerkstdZ),
meantBodyGyrostdX=mean(tBodyGyrostdX),
meantBodyGyrostdY=mean(tBodyGyrostdY),
meantBodyGyrostdZ=mean(tBodyGyrostdZ),
meantBodyGyroJerkstdX=mean(tBodyGyroJerkstdX),
meantBodyGyroJerkstdY=mean(tBodyGyroJerkstdY),
meantBodyGyroJerkstdZ=mean(tBodyGyroJerkstdZ),
meantBodyAccMagstd=mean(tBodyAccMagstd),
meantGravityAccMagstd=mean(tGravityAccMagstd),
meantBodyAccJerkMagstd=mean(tBodyAccJerkMagstd),
meantBodyGyroMagstd=mean(tBodyGyroMagstd),
meantBodyGyroJerkMagstd=mean(tBodyGyroJerkMagstd),
meanfBodyAccstdX=mean(fBodyAccstdX),
meanfBodyAccstdY=mean(fBodyAccstdY),
meanfBodyAccstdZ=mean(fBodyAccstdZ),
meanfBodyAccJerkstdX=mean(fBodyAccJerkstdX),
meanfBodyAccJerkstdY=mean(fBodyAccJerkstdY),
meanfBodyAccJerkstdZ=mean(fBodyAccJerkstdZ),
meanfBodyGyrostdX=mean(fBodyGyrostdX),
meanfBodyGyrostdY=mean(fBodyGyrostdY),
meanfBodyGyrostdZ=mean(fBodyGyrostdZ),
meanfBodyAccMagstd=mean(fBodyAccMagstd),
meanfBodyBodyAccJerkMagstd=mean(fBodyBodyAccJerkMagstd),
meanfBodyBodyGyroMagstd=mean(fBodyBodyGyroMagstd),
meanfBodyBodyGyroJerkMagstd=mean(fBodyBodyGyroJerkMagstd))
write.table(Result,file="./Result.txt",row.name=FALSE)

#temp<-read.table("./Result.txt")
