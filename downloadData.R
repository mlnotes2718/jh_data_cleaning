# This script run the necessary data file for the course project
# Getting and Cleaning Data
dataFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI_HAR_Dataset.zip"
zipPath <- paste("./", zipFile, sep="")
download.file(dataFileURL, dest=zipPath, method="curl")
unzip(zipFile, overwrite = TRUE)