subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
X_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")

subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
X_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")

activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt")
features <- read.table("UCI_HAR_Dataset/features.txt")

idxmeanstd <- grep("mean|std", features$V2)
featnamesmeanstd <- features$V2[idxmeanstd]
X_test_trim <- X_test[idxmeanstd]
X_train_trim <- X_train[idxmeanstd]

testset <- cbind(subject_test, y_test, X_test_trim)
trainset <- cbind(subject_train, y_train, X_train_trim)

mergedset <- rbind(testset, trainset)

colnames(mergedset) <- c("subject", "activity", featnamesmeanstd)

mergedset$activity <- factor(mergedset$activity)
levels(mergedset$activity) <- activity_labels$V2

tidytibble <- 
  mergedset %>%
  dplyr::group_by(subject, activity) %>%
  dplyr::summarize_all(mean)

write.table(tidytibbl, file = "tidytibble.txt")
  

