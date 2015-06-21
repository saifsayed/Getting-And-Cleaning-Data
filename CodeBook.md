#Getting and Cleaning Data Course Project CodeBook
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.
The site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  The data for the project:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  The run_analysis.R script performs the following steps to clean the data:
  * Stores Test data of features,subject and activity in Test_Data_Features,Test_Data_Subject and Test_Data_Activity respectively.
  * Combines the columns Test_Data_Features,Test_Data_Subject and Test_Data_Activity to Test_Data 
  * Stores Train data of features,subject and activity in Train_Data_Features,Train_Data_Subject and Train_Data_Activity respectively
  * Combines the columns Train_Data_Features,Train_Data_Subject and Train_Data_Activity to Train_Data
  * Combined the rows of Train_Data and Test_Data
  * Read the names of the features in Features_Names by reading the feature.txt
  * store the column names with mean in names_mean
  * store the column names with std in names_std
  * combine the names and store in names_temp
  * remove the special characters "-" and "()" and store it in names_final
  * add the column names of subject and activity to names_final and name the new string as cols_sub
  * name the columns of Data with cols which is having all the column names including the ones which doesn't have mean or std
  * Filter the Data with column names that is cols_sub i.e names with mean,std,subject and activity.
  * Make column Subject and Activity as factor
  * load dplyr package
  * group by subject and then by activity the Data_sub and store it in temp_data
  * summarize temp_data with all the means of the 66 columns and store it in Result variable.
  * Write it in a text file named Result.txt
