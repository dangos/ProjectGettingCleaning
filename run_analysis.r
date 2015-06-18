library(plyr)
library(data.table)
# Configure the working directory where the "UCI HAR Dataset" is.
################# 1.- Merges the training and the test sets to create one data set  #################

#  --------------------------------- TRAINING DATA ---------------------------------
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")            #dim(subjectTrain) --> 7352 x 1
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")                 #dim(activityTrain) --> 7352 x 1
featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")                 #dim(featuresTrain) --> 7352 x 561

#  --------------------------------- TEST DATA ---------------------------------
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")               #dim(subjectTest) --> 2947 x 1
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")                    #dim(activityTest) --> 2947 x 1
featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt")                    #dim(featuresTest) --> 2947 x 561

#  --------------------------------- ONE DATA SET ---------------------------------
subject <- rbind(subjectTrain, subjectTest)                                        #dim(subject) --> 10299 x 1
activity <- rbind(activityTrain, activityTest)                                     #dim(activity) --> 10299 x 1
features <- rbind(featuresTrain, featuresTest)                                     #dim(features) --> 10299 x 561 features[1:10,1:3]

######################## 2.- Extracts only the measurements on the mean and standard deviation for each measurement (start)######################## 

# Get the names of all the columns
namesFeatures <- read.table("./UCI HAR Dataset/features.txt")[,2]                                    #561 x 1    length(namesFeatures) head(namesFeatures)
# Gets the nameFeatures with "mean" or "std"
extractFeatures <- grepl("mean|std",namesFeatures)                                 #extractFeatures[1:20] length(extractFeatures[extractFeatures == TRUE]) --> 79
# Table extracted (clean) with wrong labels/activity names
featuresCleaned <- features[,extractFeatures]                                      #10299 x 79 dim(featuresCleaned) head(featuresCleaned[1:20,])

######################## 3.- Uses descriptive activity names to name the activities in the data set ######################## 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")              #head(activityLabels)
#training labels    -->       y_train.txt      --> activityTrain
#test labels        -->       y_test.txt       --> activityTest
#dim(activityTrain) [7352] + dim(activityTest) [2947] = 7352 + 2947 = 10299 --> Same size as variable features (10299)

labels <- rbind(activityTrain,activityTest)                                        #dim(labels) --> 10299 x 1    head(labels[1:100,])
labelsDesc <- join(labels, activityLabels, type = "inner")                         #dim(labelsDesc[1:100,])
labelsDesc <- as.data.frame(labelsDesc[,2])                                        #dim(labelsDesc) --> 10299 

######################## 4.- Appropriately labels the data set with descriptive variable names ########################
# Table with correct label names/activity names
names(featuresCleaned) <- namesFeatures[extractFeatures]                           #head(featuresCleaned)

#This two lines should be in the section "Uses descriptive activity names..." but the last column would be shifted
#because of the new "Activity" column
###############################################################
names(labelsDesc) <- "Activity"                                                     #name the column as "Activity"
featuresCleaned <- cbind(labelsDesc,featuresCleaned)                                #dim(featuresCleaned) --> 10299 x 80 (adding "Activity" column)
###############################################################

#write.table(featuresCleaned, file = "Tidy.txt", row.names = T)                     #Creates txt file with the transformation in sections 1 - 4

######################## 5.- Tidy data set with the average of each variable for each activity and each subject  ########################
walking <- featuresCleaned[featuresCleaned$Activity == "WALKING",]                  #dim(walking)  1722 x 80
walkingUp <- featuresCleaned[featuresCleaned$Activity == "WALKING_UPSTAIRS",]       #dim(walkingUp)  1544 x 80
walkingDown <- featuresCleaned[featuresCleaned$Activity == "WALKING_DOWNSTAIRS",]   #dim(walkingDown)  1406 x 80
sitting <- featuresCleaned[featuresCleaned$Activity == "SITTING",]                  #dim(sitting)  1777 x 80
standing <- featuresCleaned[featuresCleaned$Activity == "STANDING",]                #dim(standing)  1906 x 80
laying <- featuresCleaned[featuresCleaned$Activity == "LAYING",]                    #dim(laying)  1944 x 80

# nrow(walking) + nrow(walkingUp) + nrow(walkingDown) + nrow(sitting) + nrow(standing) + nrow(laying) --> 10299 --> validate the size is not mixed up, looks ok
numberCol <- ncol(walking)                                                          #Represents the number of columns for all the activities
walkingMean <- sapply(walking[,2:numberCol],mean)
walkingUpMean <- sapply(walkingUp[,2:numberCol],mean)
walkingDownMean <- sapply(walkingDown[,2:numberCol],mean)
sittingMean  <- sapply(sitting[,2:numberCol],mean)
standingMean  <- sapply(standing[,2:numberCol],mean)
layingMean  <- sapply(laying[,2:numberCol],mean)

means <- rbind(walkingMean, walkingUpMean, walkingDownMean, sittingMean, standingMean, layingMean)
write.table(means, file = "Averages.txt", row.name = F)
