#Read test data 
subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
X_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")

#Read train data
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
X_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")

#Read labels and features
activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt")
features <- read.table("UCI_HAR_Dataset/features.txt")

#Trim data
idxmeanstd <- grep("mean|std", features$V2)
featnamesmeanstd <- features$V2[idxmeanstd]
X_test_trim <- X_test[idxmeanstd]
X_train_trim <- X_train[idxmeanstd]

#Create test and train dataset to Extract only the measurements on the mean and standard deviation for each measurement 
#[STEP 2]
testset <- cbind(subject_test, y_test, X_test_trim)
trainset <- cbind(subject_train, y_train, X_train_trim)

#Merge the training and the test sets to create one data set 
#[STEP 1]
mergedset <- rbind(testset, trainset)

#Appropriately label the data set with descriptive variable names
#[STEP 4]
colnames(mergedset) <- c("subject", "activity", featnamesmeanstd)

#Using descriptive activity names to name the activities in the data set
#[STEP 3]
mergedset$activity <- factor(mergedset$activity)
levels(mergedset$activity) <- activity_labels$V2

#From the data set, create a second, independent tidy data set with the average of each variable for each activity and each subject
#[STEP 5]
tidytibble <- 
  mergedset %>%
  dplyr::group_by(subject, activity) %>%
  dplyr::summarize_all(mean)

#Export table as a txt file
write.table(tidytibbl, file = "tidytibble.txt")
  

