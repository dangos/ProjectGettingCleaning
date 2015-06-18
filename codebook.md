##Codebook


**_subjectTrain_**

- **Description: ** Contains the table with the information from subject_train.txt

- **Size: ** 7352 x 1


**_activityTrain_**

- **Description: ** Contains the table with the information from y_train.txt

- **Size: ** 7352 x 1


**_featuresTrain_**

- **Description: ** Contains the table with the information from X_train.txt

- **Size: ** 7352 x 561


**_subjectTest_**

- **Description: ** Contains the table with the information from subject_test.txt

- **Size: ** 2947 x 1


**_activityTest_**

- **Description: ** Contains the table with the information from y_test.txt

- **Size: ** 2947 x 1


**_featuresTest_**

- **Description: ** Contains the table with the information from X_test.txt

- **Size: ** 2947 x 561


**_subject_**

- **Description: ** is one dataset with the subject from the training and the testing set

- **Size: ** 10299 x 1
 

**_activity_**

- **Description: ** is one dataset with the activity from the training and the testing set

- **Size: ** 10299 x 1


**_features_**

- **Description: ** is one dataset with the features from the training and the testing set

- **Size: ** 10299 x 561


**_namesFeatures_**

- **Description: ** contains the names of all the columns from the file features.txt

- **Size: ** 561 x 1
 

**_extractFeatures_**

- **Description: ** contains the features of all the columns from the file features.txt which only has the words "mean" or "std"

- **Size: ** 79


**_activityLabels_**

- **Description: ** Contains the table with the information from activity_labels.txt

- **Size: ** 2947 x 561


**_labels_**

- **Description: ** Contains the table with labelsDesc and featuresCleaned binded by columns

- **Size: ** 10299 x 1
 

**_labelsDesc_**

- **Description: ** Contains the table with labelsDesc and featuresCleaned binded by columns

- **Size: ** 10299 


**_featuresCleaned_**

- **Description: ** Contains the table cleaned with the correct activity names

- **Size: ** 10299 x 80


**_walking_**

- **Description: ** Contains the records cleaned for "walking" for then take the mean

- **Size: ** 1722 x 80


**_walkingUp_**

- **Description: ** Contains the records cleaned for "walkingUp" for then take the mean

- **Size: ** 1544 x 80
 

**_walkingDown_**

- **Description: ** Contains the records cleaned for "walkingDown" for then take the mean

- **Size: ** 1406 x 80
 

**_sitting_**

- **Description: ** Contains the records cleaned for "sitting" for then take the mean

- **Size: ** 1777 x 80


**_standing_**

- **Description: ** Contains the records cleaned for "standing" for then take the mean

- **Size: ** 1906 x 80


**_laying_**

- **Description: ** Contains the records cleaned for "laying" for then take the mean

- **Size: ** 1944 x 80


**_numberCol_**                                                      

- **Description: ** Contains the number of columns for all the activities


**The next variables contains the mean for each value**

- **walkingMean.-** The mean for walking
- **walkingUpMean.-** The mean for walking up
- **walkingDownMean.-** The mean for walking down
- **sittingMean.-** The mean for sitting
- **standingMean.-** The mean for standing
- **layingMean.-** The mean for laying

**_means_**

- **Description: ** Contains the dataset with the mean of the different activities 

- **Size: ** 6 x 79
