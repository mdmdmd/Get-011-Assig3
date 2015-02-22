# run_analysis.R
This script will refine data created by the embedded accelerometer and gyroscope in a smartphone.  The details of the conditions used to capture can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Pre-Requisites
The data must be in the same working directory as run_analysis.R

The following files will be read by the script, and must be in the subdirectories specified:
features.txt
test\X_test.txt
test\Y_test.txt
test\subject_test.txt
train\X_train.txt
train\Y_train.txt
train\subject_train.txt
activity_labels.txt

## Script Contents
The script will read in all files and then perform the following steps
1. Row bind the data from the test and train directories to create single data frames to work with.  The test data will occur first in the data frame to preserve the ordering
2. Logical column names are assigned to the data frames
3. The fields relating to mean and standard variation are extracted from the data
4. The data is combined into a single data frame with column 1 and 2 referencing the Subject and the activity they performed, and the remainder of the columns populated with data from the mean and standard deviation
5. The final dataset clean.data has the non essential column Activity_ID removed, as this information is now shown in the Activity column as the actual description of the activity
6. A dataframe mean.data is created that contains the average of the measurements for each subject(labelled 1 to 30) performing each activity
7. The mean.data data frame is written to a text file called meandata.txt.  This can be read in with the command read.table("meandata.txt")
