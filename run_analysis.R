library(dplyr)

#read required data into R (adjust file paths as necessary)
test_X_txt <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_y_txt <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

train_X_txt <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_y_txt <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

columns <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

#column_headings to be added to the data
column_headings <- columns$V2

#add headings to data
colnames(test_X_txt) <- column_headings
colnames(train_X_txt) <- column_headings
colnames(test_y_txt) <- c("Activity")
colnames(train_y_txt) <- c("Activity")
colnames(test_subjects) <- c("Subject")
colnames(train_subjects) <- c("Subject")

#decode activities in the labels for both the testing and training data by 
#looking for the numeric code from the data in the Activity list and replacing 
#numeric code with this value

for (x in 1:length(test_y_txt$Activity)) {
  test_y_txt$Activity[x] <- activities[test_y_txt$Activity[x],2]
}
for (x in 1:length(train_y_txt$Activity)) {
  train_y_txt$Activity[x] <- activities[train_y_txt$Activity[x],2]
}

#Combine columns from Activity and Subject with the main data
labelled_test_data <- cbind(test_y_txt, test_subjects, test_X_txt)
labelled_train_data <- cbind(train_y_txt, train_subjects, train_X_txt)

#Combine test and training data records
test_train <- rbind(labelled_test_data, labelled_train_data)

#Create condensed dataset with only the measurements relating to mean and standard deviation
condensed <- select(test_train, c('Activity',
                                  'Subject',
                                  contains('mean()'),
                                  contains('std()')
                                  ))
#Creating the required column order so that measurements are displayed in a sensible order
col_order <- c('Activity'
              ,'Subject'
              ,'tBodyAcc-mean()-X'
              ,'tBodyAcc-mean()-Y'
              ,'tBodyAcc-mean()-Z'
              ,'tBodyAcc-std()-X'
              ,'tBodyAcc-std()-Y'
              ,'tBodyAcc-std()-Z'
              ,'tGravityAcc-mean()-X'
              ,'tGravityAcc-mean()-Y'
              ,'tGravityAcc-mean()-Z'
              ,'tGravityAcc-std()-X'
              ,'tGravityAcc-std()-Y'
              ,'tGravityAcc-std()-Z'
              ,'tBodyAccJerk-mean()-X'
              ,'tBodyAccJerk-mean()-Y'
              ,'tBodyAccJerk-mean()-Z'
              ,'tBodyAccJerk-std()-X'
              ,'tBodyAccJerk-std()-Y'
              ,'tBodyAccJerk-std()-Z'
              ,'tBodyGyro-mean()-X'
              ,'tBodyGyro-mean()-Y'
              ,'tBodyGyro-mean()-Z'
              ,'tBodyGyro-std()-X'
              ,'tBodyGyro-std()-Y'
              ,'tBodyGyro-std()-Z'
              ,'tBodyGyroJerk-mean()-X'
              ,'tBodyGyroJerk-mean()-Y'
              ,'tBodyGyroJerk-mean()-Z'
              ,'tBodyGyroJerk-std()-X'
              ,'tBodyGyroJerk-std()-Y'
              ,'tBodyGyroJerk-std()-Z'
              ,'tBodyAccMag-mean()'
              ,'tBodyAccMag-std()'
              ,'tGravityAccMag-mean()'
              ,'tGravityAccMag-std()'
              ,'tBodyAccJerkMag-mean()'
              ,'tBodyAccJerkMag-std()'
              ,'tBodyGyroMag-mean()'
              ,'tBodyGyroMag-std()'
              ,'tBodyGyroJerkMag-mean()'
              ,'tBodyGyroJerkMag-std()'
              ,'fBodyAcc-mean()-X'
              ,'fBodyAcc-mean()-Y'
              ,'fBodyAcc-mean()-Z'
              ,'fBodyAcc-std()-X'
              ,'fBodyAcc-std()-Y'
              ,'fBodyAcc-std()-Z'
              ,'fBodyAccJerk-mean()-X'
              ,'fBodyAccJerk-mean()-Y'
              ,'fBodyAccJerk-mean()-Z'
              ,'fBodyAccJerk-std()-X'
              ,'fBodyAccJerk-std()-Y'
              ,'fBodyAccJerk-std()-Z'
              ,'fBodyGyro-mean()-X'
              ,'fBodyGyro-mean()-Y'
              ,'fBodyGyro-mean()-Z'
              ,'fBodyGyro-std()-X'
              ,'fBodyGyro-std()-Y'
              ,'fBodyGyro-std()-Z'
              ,'fBodyAccMag-mean()'
              ,'fBodyAccMag-std()'
              ,'fBodyBodyAccJerkMag-mean()'
              ,'fBodyBodyAccJerkMag-std()'
              ,'fBodyBodyGyroMag-mean()'
              ,'fBodyBodyGyroMag-std()'
              ,'fBodyBodyGyroJerkMag-mean()'
              ,'fBodyBodyGyroJerkMag-std()')

#Sets the column order specified above
condensed <- condensed[,col_order]

#Groups the condensed data by Activity and Subject, with an average value for each 
#measurement in each group
tidy_data <- condensed %>% group_by(Activity, Subject) %>% summarise_all(list(mean))
