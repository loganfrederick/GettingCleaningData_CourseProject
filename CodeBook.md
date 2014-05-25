#Getting and Cleaning Data Course Project Cookbook

##Variables

* x_train: A data table with the content of X_train.txt
* y_train: A data table with the content of Y_train.txt
* x_test: A data table with the content of X_test.txt
* y_test: A data table with the content of Y_test.txt
* subject_train: A table with the content from subject_train.txt
* subject_test: A table with the content from subject_test.txt
* activity_lables: A table with the labels from the activity document.
* features: A table iwth the labels from the features document.
* data: The name given to the combined train and test data sets.

##The Data

The data was collected from the accelerometers from the Samsung Galaxy S smartphone.

The original copies are hosted at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

From their website:

> "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six 
>activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the 
>waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a 
>constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
>partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. "

##The Script - run_analysis_data.R 

The script is meant to (work in progress):

1. Reads in the data files and stores them in tables in R.
2. Reads in the files with labels for features and activities.
3. Apply the labels as column names for the data from text files.
4. Merge the test data tables.
5. Merge the train data tables.
6. Merge the test and train data tables into one data set.
7. Create a second data set with the average of each variable for each activity and subject.