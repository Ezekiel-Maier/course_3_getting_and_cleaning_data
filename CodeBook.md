#CodeBook

##Original Data
The original dataset consists of accelerometer data from the Samsung Galaxy S smartphones. The original dataset and its description are available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The zip archive can be downloaded at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Tidy Data Set - samsung_galaxy_accelerometer_data_means.txt
### Description
The tidy dataset (samsung_galaxy_accelerometer_data_means.txt) consists of 180 rows and 68 columns, and contains averages of each variable for each activity and each subject. Each row contains a SubjectID, and Activity, and the average value for 66 variables.

### Variable Details
* SubjectID - The identifier for the subject who performed the activity 
* Activity - The activity that the individual performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* Other 66 variables - The other 66 variables hold the mean vale for each subjectID and activity for each of the mean and standard deviation features from the original dataset  
**  timeBodyAccMeanAxisX 
**  timeBodyAccMeanAxisY 
**  timeBodyAccMeanAxisZ 
**  timeBodyAccStandardDeviationAxisX 
**  timeBodyAccStandardDeviationAxisY 
**  timeBodyAccStandardDeviationAxisZ 
**  timeGravityAccMeanAxisX 
**  timeGravityAccMeanAxisY 
**  timeGravityAccMeanAxisZ 
**  timeGravityAccStandardDeviationAxisX 
**  timeGravityAccStandardDeviationAxisY 
**  timeGravityAccStandardDeviationAxisZ 
**  timeBodyAccJerkMeanAxisX 
**  timeBodyAccJerkMeanAxisY 
**  timeBodyAccJerkMeanAxisZ 
**  timeBodyAccJerkStandardDeviationAxisX 
**  timeBodyAccJerkStandardDeviationAxisY 
**  timeBodyAccJerkStandardDeviationAxisZ 
**  timeBodyGyroMeanAxisX 
**  timeBodyGyroMeanAxisY 
**  timeBodyGyroMeanAxisZ 
**  timeBodyGyroStandardDeviationAxisX 
**  timeBodyGyroStandardDeviationAxisY 
**  timeBodyGyroStandardDeviationAxisZ 
**  timeBodyGyroJerkMeanAxisX 
**  timeBodyGyroJerkMeanAxisY 
**  timeBodyGyroJerkMeanAxisZ 
**  timeBodyGyroJerkStandardDeviationAxisX 
**  timeBodyGyroJerkStandardDeviationAxisY 
**  timeBodyGyroJerkStandardDeviationAxisZ 
**  timeBodyAccMagMean 
**  timeBodyAccMagStandardDeviation 
**  timeGravityAccMagMean 
**  timeGravityAccMagStandardDeviation 
**  timeBodyAccJerkMagMean 
**  timeBodyAccJerkMagStandardDeviation 
**  timeBodyGyroMagMean 
**  timeBodyGyroMagStandardDeviation 
**  timeBodyGyroJerkMagMean 
**  timeBodyGyroJerkMagStandardDeviation 
**  fastFourierTransformBodyAccMeanAxisX 
**  fastFourierTransformBodyAccMeanAxisY 
**  fastFourierTransformBodyAccMeanAxisZ 
**  fastFourierTransformBodyAccStandardDeviationAxisX 
**  fastFourierTransformBodyAccStandardDeviationAxisY 
**  fastFourierTransformBodyAccStandardDeviationAxisZ 
**  fastFourierTransformBodyAccJerkMeanAxisX 
**  fastFourierTransformBodyAccJerkMeanAxisY 
**  fastFourierTransformBodyAccJerkMeanAxisZ 
**  fastFourierTransformBodyAccJerkStandardDeviationAxisX 
**  fastFourierTransformBodyAccJerkStandardDeviationAxisY 
**  fastFourierTransformBodyAccJerkStandardDeviationAxisZ 
**  fastFourierTransformBodyGyroMeanAxisX 
**  fastFourierTransformBodyGyroMeanAxisY 
**  fastFourierTransformBodyGyroMeanAxisZ 
**  fastFourierTransformBodyGyroStandardDeviationAxisX 
**  fastFourierTransformBodyGyroStandardDeviationAxisY 
**  fastFourierTransformBodyGyroStandardDeviationAxisZ 
**  fastFourierTransformBodyAccMagMean 
**  fastFourierTransformBodyAccMagStandardDeviation 
**  fastFourierTransformBodyBodyAccJerkMagMean 
**  fastFourierTransformBodyBodyAccJerkMagStandardDeviation 
**  fastFourierTransformBodyBodyGyroMagMean 
**  fastFourierTransformBodyBodyGyroMagStandardDeviation 
**  fastFourierTransformBodyBodyGyroJerkMagMean 
**  fastFourierTransformBodyBodyGyroJerkMagStandardDeviation

## Tidy data analysis script - run_analysis.R

### Transformations performed by the tidy data analysis script 
* Merging training and test data
** See the section under comment 1 in run_analysis.R
* Extract the mean and standard deviation of each measurement
** See the section under comment 2 in run_analysis.R
* Conversion of activity IDs to activity labels
** See the section under comment 3 in run_analysis.R
* Label data set variable names with descriptive names
** See the section under comment 4 in run_analysis.R
* Compute the average of each variable for each activity and each subject
** See the section using melt and dcast under comment 5 in run_analysis.R
