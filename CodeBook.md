CodeBook
================

## Processing Features/Column Names

-   colFilePath: location of the feature file - “./UCI HAR
    Dataset/features.txt”
-   colFile: contains the dataset read from features file (features.txt)
-   colNames: extracted column 2 from colFile and tidy up the column
    names by removing ()

## Processing Training and Test Data File

-   trainFilePath: location of the training data file - “./UCI HAR
    Dataset/train/X\_train.txt”
-   testFilePath: location of the test data file - “./UCI HAR
    Dataset/test/X\_test.txt”
-   trainFile: contains dataset read from trainFilePath
-   testFile: contains dataset read from testFilePath
-   file: row combined of the training and test file (trainFile,
    testFile)

## Processing Label File

-   ytrainFilePath: location of the label file for the training data -
    “./UCI HAR Dataset/train/y\_train.txt”
-   ytestFilePath: location of the label file for the test data - “./UCI
    HAR Dataset/test/y\_test.txt”
-   yTrain: contains dataset read from ytrainFilePath
-   yTest: contains dataset read from ytestFilePath
-   label: row combined of the label file for both training and test
    dataset (yTrain, yTest), column name is "ActCode"

## Processing Subject File

-   subjectTrainFilePath: location of the subject file for the training
    data - “./UCI HAR Dataset/train/subject\_train.txt”
-   subjectTestFilePath: location of the subject file for the test
    data - “./UCI HAR Dataset/test/subject\_test.txt”
-   trainSubject: contains dataset read from subjectTrainFilePath
-   testSubject: contains dataset read from subjectTestFilePath
-   subject: row combined of the subject file for both training and test
    dataset (trainSubject, testSubject), column name is "Subject"

## Cobined all dataset into a single table

-   totalFile: column combined of main data file, label and subject
    (file, label, subject)

## Extract and Selected Column

This section extract the column names that include mean and std. Please
note that we besides mean, std; we also search for Mean and Std We also
include the key column activity and subject - newColNames: column names
of the combined dataset - selectedCol: index of the selected columns -
df: dataset that only include the selected comlumns (88 columns)

## Open and read the table that reference the activity code

This section open the activity reference code - labelNamesPath: location
of the acitivity code referecne table - “./UCI HAR
Dataset/activity\_labels.txt” - labelName: table that contains the
activity code and its corresponding description

## Add a column of activity description

-   Activity: a new column in df that matches the code to the
    corresponsing names
-   df: new dataset that has the activity description and we remove the
    activity code column

## Create a new dataset that is group by acitivity and subject

This new dataset also summarise all column using mean function 
- newGroupedDf: new dataset that is group by acitivty and subject and
summarised as mean

End of CodeBook
