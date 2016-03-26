library(reshape2)

## Download the data
raw_data_zip_name <- "samsung_galaxy_accelerometer_data.zip"
if(!file.exists(raw_data_zip_name)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url=url, destfile=raw_data_zip_name, method="curl")
}

## Unzip the data
unzip_dir_name <- "UCI HAR Dataset"
if(!file.exists(unzip_dir_name)) {
  unzip(raw_data_zip_name)
}

## Read in fetures
features <- read.table(paste(unzip_dir_name, "/features.txt", sep=""))

## Read in the training data
## 'train/X_train.txt': Training set.
## 'train/y_train.txt': Training labels.
## 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
training_data <- read.table(paste(unzip_dir_name, "/train/X_train.txt", sep=""))
training_labels <- read.table(paste(unzip_dir_name, "/train/y_train.txt", sep=""))
training_subject <- read.table(paste(unzip_dir_name, "/train/subject_train.txt", sep=""))
all_training <- cbind(training_subject, training_labels, training_data)
colnames(all_training) <- c('SubjectID', 'ActivityID', as.character(features[,2]))

## Read in the training data
## 'test/X_train.txt': Training set.
## 'tet/y_train.txt': Training labels.
## 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
testing_data <- read.table(paste(unzip_dir_name, "/test/X_test.txt", sep=""))
testing_labels <- read.table(paste(unzip_dir_name, "/test/y_test.txt", sep=""))
testing_subject <- read.table(paste(unzip_dir_name, "/test/subject_test.txt", sep=""))
all_testing <- cbind(testing_subject, testing_labels, testing_data)
colnames(all_testing) <- c('SubjectID', 'ActivityID', as.character(features[,2]))

## 1. Merge the training and the test sets to create one data set.
all_data <- rbind(all_training, all_testing)

## 2. Extract only the measurements on the mean and standard deviation for each measurement.
all_data <- all_data[, c(1, 2, grep("-(mean|std)\\(", colnames(all_data)))]

## 3. Use descriptive activity names to name the activities in the data set
## Read in the activity labels
activity_labels <- read.table(paste(unzip_dir_name,"/activity_labels.txt", sep=""))
all_data$ActivityID <- factor(all_data$ActivityID , levels = activity_labels[,1], labels = activity_labels[,2])
colnames(all_data)[2] <- "Activity"

## Make SubjectID a factor
all_data$SubjectID <- as.factor(all_data$SubjectID) 

## 4. Appropriately label the data set with descriptive variable names.
colnames(all_data) <- gsub("^t", "time", colnames(all_data))
colnames(all_data) <- gsub("^f", "fastFourierTransform", colnames(all_data))
colnames(all_data) <- gsub("-mean\\(\\)", "Mean", colnames(all_data))
colnames(all_data) <- gsub("-std\\(\\)", "StandardDeviation", colnames(all_data))
colnames(all_data) <- gsub("-", "Axis", colnames(all_data))

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
all_data_long <- melt(all_data, id.vars=c("SubjectID", "Activity"))
all_data_averages <- dcast(all_data_long, SubjectID + Activity ~ variable, fun.aggregate = mean, na.rm=TRUE)

## Write out the tidy dataset
write.table(all_data_averages, file="samsung_galaxy_accelerometer_data_means.txt", row.names = FALSE, col.names = TRUE, quote="")