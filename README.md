# jh_data_cleaning (John Hopkins Data Science Specialization - Getting and Cleaning Data Course Project)
Coursera Course John Hopkins Getting and Cleaning Data Course Project

## Course Project Details
1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Create R script called run_analysis.R that does the following. 
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names. 
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Note:
- Additional R script called downloadData.R is provide for ease of data access
- Data is extracted on the current folder to a sub folder called "UCI HAR Dataset"
- CodeBook.md is provided to describe the variables used in the R script

## Dataset Condition
- The main data is located in 2 sub folders test and train. The location are
    - "UCI HAR Dataset/train/X_train.txt"
    - "UCI HAR Dataset/test/X_test.txt"
- The text file do not have columns names as column names are located sepatately at "UCI HAR Dataset/features.txt"
- The label are located separately at:
    - "UCI HAR Dataset/train/y_train.txt"
    - "UCI HAR Dataset/test/y_test.txt"
- There is addition information regarding test subject location in separate file, location is:
    - "UCI HAR Dataset/train/subject_train.txt"
    - "UCI HAR Dataset/test/subject_test.txt"

## Data Cleaning Requirement
Based in the instruction above:
1. We need to combined train and test dataset into one table with the column names.
2. We also need to include labels and subjects into this table.
3. Then we need to convert the y label into activity names.
4. Then we need to select data column that contain mean or std (standard deviation). In our implementation we are more inclusive such that we include all column that have the word mean, std or Mean
5. Finally we create a separate dataset that have the average of each column for each activity and each subject.

## Flow of run_analysis.R Script
1. The first step is to extract the column names from a separate feature files. We also tideup the column names by removing () in the column names.
2. Next we process the main dataset from the train and test folder and combined into one table with the column names added. Main table is named "file".
3. Then, we process the label file from train and test folder and create a separate table called "label". Column names is "ActCode"
4. Next, we process the subject file from train and test folder and freate a separate table called "subject". Coumn name is "Subject".
5. Finally, we combined the main table with label table and subject table. Combined table is named "totalFile".
6. At stage 5 we have the complete dataset. Now to need to satisfy the project requirement to select columns that have mean and std word in it. We also need to include ActCode and Subject column.
7. The dataset with selected column is named "df".
8. Finally, we extract a separate activity table that reference the activity code. Then we add a new column called "Acitivity" by converting the activity code to the corresponding name.
9. The column "ActCode" is removed after it has converted into corresponding name.
10. Finally we satisfy the final requirement by creating a seperate dataset called "newGroupedDf".

    
 

