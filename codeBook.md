# Code book - variables

+`testLabels` - reads from "test/y_test.txt" the test labels (activities).
+`testSubjects` - reads from "test/subject_test.txt" the subject who performed the activity.
+`testResults` - reads from "test/X_test.txt" the test data set.
+`trainLabels` - reads from "train/y_train.txt" the train labels (activities).
+`trainSubjects` - reads from "train/subject_train.txt" the subject who performed the activity.
+`trainResults` - reads from "train/X_train.txt" the train data set. 
+`features` - reads from "features.txt" the list of all features.
+`activities` - reads from "activity_labels.txt" the name and id of all activities.
+`mergedResults` - contains the merge of `trainResults` and `testResults`.
+`mergedLabels` - contains the merge of `testLabels` and `trainLabels`.
+`mergedSubjects` - contains the merge of `trainSubjects` and `testSubjects`.
+`desiredFeatures` - contains the columns names with "mean" and "std"
+`fullDataSet` - It is a result of the subset of the desired columns (`desiredFeatures`) and merged labels/activities and subjects. All columns and activities with descriptive names.
+`avgDataSet` - Contains a tidy data set with the average of each variable for each activity and each subject.
