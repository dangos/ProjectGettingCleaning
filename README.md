###Line 1

**_library(plyr)_** - Includes the library plyr

###Line 2

**_library(data.table)_** - Includes the library plyr

###Line 7

**_subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")_** - Reads the data in "subject_
train.txt" which is part of the training

###Line 8

**_activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")_** - Reads the data in "y_train.txt" 
which is part of the training

###Line 9

**_featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")_** - Reads the data in "X_train.txt" which is part of the training

###Line 12

**_subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")_** - Reads the data in "subject_test.txt" which is part of the testing

###Line 13

**_activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")_** - Reads the data in "y_test.txt" which is part of the testing

###Line 14

**_featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt")_** - Reads the data in "X_test.txt" which is part of the testing

###Line 17

**_subject <- rbind(subjectTrain, subjectTest)_** - Creates one dataset of the "subject", binding by rows the Training and Testing files

###Line 18

**_activity <- rbind(activityTrain, activityTest)_** - Creates one dataset of the "activity", binding by rows the Training and Testing files

###Line 19

**_features <- rbind(featuresTrain, featuresTest)_** - Creates one dataset of the "features", binding by rows the Training and Testing files

###Line 24

**_namesFeatures <- read.table("./UCI HAR Dataset/features.txt")[,2]_** - Gets the names of all the columns from the file features

###Line 26

**_extractFeatures <- grepl("mean|std",namesFeatures)_** - Extracts the features that contains the words "mean" and "std" in it

###Line 28

**_featuresCleaned <- features[,extractFeatures]_** - Table cleaned with the features "mean" and "std" with no label descriptions

###Line 31

**_activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")_** - gets the activity names with the corresponding number asociated

###Line 36

**_labels <- rbind(activityTrain,activityTest)_** - binds by row the key of the activities in the training and in the testin, wich later will be used for getting the correct descriptions and adding to the final dataset which is the binding of the test and train. It is important the order of the parameters not to be mixed up (First Train, Then Test)

###Line 37

**_labelsDesc <- join(labels, activityLabels, type = "inner")_** - Makes an inner join between the keys and the description to get the correct activity DESCRIPTION

###Line 38

**_labelsDesc <- as.data.frame(labelsDesc[,2])_** - Gets only the column of the names (which is the second one)

###Line 42

**_names(featuresCleaned) <- namesFeatures[extractFeatures]_** - Table with correct label names/activity names

###Line 47

**_names(labelsDesc) <- "Activity"_** - names the column as "Activity"

###Line 48

**_featuresCleaned <- cbind(labelsDesc,featuresCleaned)_** - binds by column the activities "labelDesc" on the left side with "featuresCleaned" which contains the word "mean" & "std"

###Line 54

**_walking <- featuresCleaned[featuresCleaned$Activity == "WALKING",]_** - gets where are all the records that corresponds for "WALKING" in the column "Activity" from "featuresCleaned"

###Line 55

**_walkingUp <- featuresCleaned[featuresCleaned$Activity == "WALKING_UPSTAIRS",]_** - gets where are all the records that corresponds for "WALKING_UPSTAIRS" in the column "Activity" from "featuresCleaned"

###Line 56

**_walkingDown <- featuresCleaned[featuresCleaned$Activity == "WALKING_DOWNSTAIRS",]_** - gets where are all the records that corresponds for "WALKING_DOWNSTAIRS" in the column "Activity" from "featuresCleaned"

###Line 57

**_sitting <- featuresCleaned[featuresCleaned$Activity == "SITTING",]_** - gets where are all the records that corresponds for "SITTING" in the column "Activity" from "featuresCleaned"              

###Line 58

**_standing <- featuresCleaned[featuresCleaned$Activity == "STANDING",]_** - gets where are all the records that corresponds for "STANDING" in the column "Activity" from "featuresCleaned"

###Line 59

**_laying <- featuresCleaned[featuresCleaned$Activity == "LAYING",]_** - gets where are all the records that corresponds for "LAYING" in the column "Activity" from "featuresCleaned" 

###Line 62

**_numberCol <- ncol(walking)_** - Configures the size of the columns, not hardcoding lines 63 - 68

###Line 63

**_walkingMean <- sapply(walking[,2:numberCol],mean)_** - gets the mean for the activities that correspond for "walking" excluding the first column (wich is the activity itself, it´s only a description and it can´t be computed)

###Line 64

**_walkingUpMean <- sapply(walkingUp[,2:numberCol],mean)_** - gets the mean for the activities that correspond for "walkingUp" excluding the first column (wich is the activity itself, it´s only a description and it can´t be computed)

###Line 65

**_walkingDownMean <- sapply(walkingDown[,2:numberCol],mean)_** - gets the mean for the activities that correspond for "walkingDown" excluding the first column (wich is the activity itself, it´s only a description and it can´t be computed)

###Line 66

**_sittingMean  <- sapply(sitting[,2:numberCol],mean)_** - gets the mean for the activities that correspond for "sitting" excluding the first column (wich is the activity itself, it´s only a description and it can´t be computed)

###Line 67

**_standingMean  <- sapply(standing[,2:numberCol],mean)_** - gets the mean for the activities that correspond for "standing" excluding the first column (wich is the activity itself, it´s only a description and it can´t be computed)

###Line 68

**_layingMean  <- sapply(laying[,2:numberCol],mean)_** - gets the mean for the activities that correspond for "laying" excluding the first column (wich is the activity itself, it´s only a description and it can´t be computed)

###Line 70

**_means <- rbind(walkingMean, walkingUpMean, walkingDownMean, sittingMean, standingMean, layingMean)_** - binds all the means by column

###Line 71

**_write.table(means, file = "Averages.txt", row.name = F)_** - Exports all the means into a file named "Averages.txt" without the row names which is the Activity names
