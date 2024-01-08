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
