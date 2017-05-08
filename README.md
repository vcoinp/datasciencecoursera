# Getting and Cleaning Data Course Project
==========================================

This files describes how to run the script "run_analysis.r".

   # Analysis guide
   
   The analysis reads data from train and test sets of the accelerometers from the Samsung Galaxy S smartphone and merges them. After that, the analysis applies descritive names for the columns in the data sets, subsets only columns with mean and standaed deviation in its titles and merges train and test data sets.
   
   Finnaly, the analysis creates a tidy data set with the average of each variable for each activity and each subject and creates a text file called `tidyDataSet.txt`.


   # Run instructions
 
   *step 1: Download the dataset in this link: [HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
   
   *step 2: Unzip and copy the folders `test` and `train` and the files `activity_labels.txt`, `features.txt`, `features_info.txt` and `README.txt` and paste into the root of your R working directory.
   
   *step 3: Copy the file `run_analysis.r` and paste into the root of your R working directory.
   
   *step 4: Run  `source("run_analysis.r")` to run the analysis.
   
   # Output
   The output of the analysis is the txt file `tidyDataSet.txt` containing a data set with the average of each variable for each activity and each subject.
   
   For more details about the variables, read `codeBook.md`.