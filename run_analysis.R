# file name: run_analysis.R

# import library
library(dplyr)

# This scripts do the following: 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

# Open features file
# tidy upate the feature names and remove () from the feature names
colFilePath <- "./UCI HAR Dataset/features.txt"
colFile <- read.table(colFilePath)
colNames <- colFile$V2
colNames <- gsub("[()]","", colNames)

### Open data file
# open and read the main training data file and test data file
trainFilePath <- "./UCI HAR Dataset/train/X_train.txt"
testFilePath <- "./UCI HAR Dataset/test/X_test.txt"
# include column names using the tidy column names earlier
trainFile <- read.table(trainFilePath, col.names = colNames)
testFile <- read.table(testFilePath, col.names = colNames)
# combines training data and test data
file <- rbind(trainFile, testFile)

### Open label file
# open and read the labels file for training and test data
ytrainFilePath <- "./UCI HAR Dataset/train/y_train.txt"
ytestFilePath <- "./UCI HAR Dataset/test/y_test.txt"
# include a column name
yTrain <- read.table(ytrainFilePath, col.names = c("ActCode"))
yTest <- read.table(ytestFilePath, col.names = c("ActCode"))
# combined training and test labels 
label <- rbind(yTrain, yTest)

### Open subject file
# open and read the subjects file for training and test data set
subjectTrainFilePath <- "./UCI HAR Dataset/train/subject_train.txt"
subjectTestFilePath <- "./UCI HAR Dataset/test/subject_test.txt"
# read into data table with proper column names
trainSubject <- read.table(subjectTrainFilePath, col.names = c("Subject"))
testSubject <- read.table(subjectTestFilePath, col.names = c("Subject"))
# combined training and test data
subject <- rbind(trainSubject, testSubject)

### Combined all data into a single file
# combined all data, label and subjects into a file using cbind
totalFile <- cbind(file, label, subject)

# The following code extract the new column names for the combined file
newColNames <- names(totalFile)
# Using grep to extract all column that contain words like mean and std
# Please note that this is inclusive exercise where we include mean in the middle
# we also include any column with Mean and Std
selectedCol <- grep("[Mm]ean|[Ss]td|ActCode|Subject", newColNames)
# Create a data table names as df for analysis
df <- select(totalFile, selectedCol)

# Open the table file that reference the activity code and
# its corresponding activity description
labelNamesPath <- "./UCI HAR Dataset/activity_labels.txt"
labelName <- read.table(labelNamesPath)

# on the df table create a new column Activity and use activity name
# instead of the acitivty code
df$Activity <- labelName$V2[match(df$ActCode, labelName$V1)]
# remove the column that contains the activity code
df <- select(df, -ActCode)

# The following create a new datatable that is group by activity
# and subject and it summarized all data using mean()
# New data table is named newGroupedDf
newGroupedDf <- df %>% 
    group_by(Activity, Subject) %>%
    summarise_all(.funs = mean)
