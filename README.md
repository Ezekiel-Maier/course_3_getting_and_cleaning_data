# Course 3 Getting and Cleaning Data: Course Project
## Tidy Data Analysis File: run_analysis.R
* If a zip diretory named "samsung_galaxy_accelerometer_data.zip" does not exist in the current working directory, then run_analysis.R will download the Samsung Galaxy accelerometer dataset zip.
* If the unzipped dataset named "UCI HAR Dataset" does not exist in the current working directory, then run_analysis.R will extract the Samsung Galaxy zipped dataset
* The names for the 561 fetures are read in.
* The training and test data, activity labels, and subjects are read in
* All of the training and test data, activity labels, and subjects are combined into a single data stucture named all_data
* The all_data data structure is reduced in size by selecting only the columns/fields containing the mean and standard deviations of the measurements
* Activity IDs are converted to activity labels
* Column names are made more descriptive
* A second tidy dataset, named all_data_averages, is created. This data structure contains the mean of each variable for each activity and each subject.
* The second tidy dataset is written to the file "samsung_galaxy_accelerometer_data_means.txt"

## CodeBook: CodeBook.md
* See the code book for more information on the original dataset, tidy dataset, and the tidy dataset analysis file
