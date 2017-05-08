library(plyr)

# Reads test labels, sets and subjects
testLabels <- read.table("test/y_test.txt")
testSubjects <- read.table("test/subject_test.txt")
testResults <- read.table("test/X_test.txt")

# Reads train labels, sets and subjects   
trainLabels <- read.table("train/y_train.txt")
trainSubjects <- read.table("train/subject_train.txt")
trainResults <- read.table("train/X_train.txt")

# Reads features
features <- read.table("features.txt")

# Reads features
activities <- read.table("activity_labels.txt")
activities <- data.frame(activity=activities[,1],activityName=activities[,2])

# create results data sets
mergedResults <- rbind(testResults,trainResults)

# create labels data sets
mergedLabels <- rbind(testLabels,trainLabels)

# create subject data sets
mergedSubjects <- rbind(testSubjects,trainSubjects)

# get columns with mean or std
desiredFeatures <- grep("-(mean|std)\\(\\)", features[, 2])

# get only desired columns
mergedResults <- mergedResults[, desiredFeatures]

# apply column names
names(mergedResults) <- features[desiredFeatures,2]

# Merge subject, activity and results into a single data set
fullDataSet <- data.frame(activity = mergedLabels[,1], subject = mergedSubjects[,1], mergedResults)


# Uses descriptive activity names to name the activities in the data set
fullDataSet <- merge(activityLabels,fullDataSet, by.activityLabels="activity",by.fullDataSet="activity")

# creates a independent tidy data set with the average of each variable for each activity and each subject.
avgDataSet <- ddply(fullDataSet, .(subject, activityName), function(x) colMeans(x[, 4:69]))

# Creates a txt file from avgDataSet variable
write.table(avgDataSet,"tidyDataSet.txt",row.name=FALSE)

