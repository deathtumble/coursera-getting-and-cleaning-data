# Code Book

This is a code book that describes the variables, the data, and any transformations or work that ywas performed to clean up the data.

## The data source

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##  Processing Steps

1. Optionally download zip file
2. Optionally unzip downloaded file
3. Read support files
  1. The ```activity_labels.txt``` file was loaded and the column names was made more descriptive.
  2. The ```features.txt``` file was loaded and the features parse to be tidier. 
4. Load Training Data
  The ```X_train.txt```, ```subject_train.txt``` and ```y_train.txt``` files were loaded and merged by columns
5. Load Testing Data
  The ```X_test.txt```, ```subject_test.txt``` and ```y_test.txt``` files were loaded and merged by columns
6. Merge Test and Training Data by rows.
7. Extracts only the measurements on the mean and standard deviation for each measurement.
8. Creates a independent tidy data set with the average of each variable for each activity and each subject

##  The Tidied Data

The tidied data is written into ```mean.txt```.  It contains one rwo for every observed combination of test subject and test activity.  Beyond the key values above, each row contained the following features.

  * time_body_acc_mean_x
  * time_body_acc_mean_y
  * time_body_acc_mean_z
  * time_body_acc_std_x
  * time_body_acc_std_y
  * time_body_acc_std_z
  * time_gravity_acc_mean_x
  * time_gravity_acc_mean_y
  * time_gravity_acc_mean_z
  * time_gravity_acc_std_x
  * time_gravity_acc_std_y
  * time_gravity_acc_std_z
  * time_body_acc_jerk_mean_x
  * time_body_acc_jerk_mean_y
  * time_body_acc_jerk_mean_z
  * time_body_acc_jerk_std_x
  * time_body_acc_jerk_std_y
  * time_body_acc_jerk_std_z
  * time_body_gyro_mean_x
  * time_body_gyro_mean_y
  * time_body_gyro_mean_z
  * time_body_gyro_std_x
  * time_body_gyro_std_y
  * time_body_gyro_std_z
  * time_body_gyro_jerk_mean_x
  * time_body_gyro_jerk_mean_y
  * time_body_gyro_jerk_mean_z
  * time_body_gyro_jerk_std_x
  * time_body_gyro_jerk_std_y
  * time_body_gyro_jerk_std_z 
  * fft_body_acc_mean_x
  * fft_body_acc_mean_y
  * fft_body_acc_mean_z
  * fft_body_acc_std_x
  * fft_body_acc_std_y
  * fft_body_acc_std_z
  * fft_body_acc_jerk_mean_x
  * fft_body_acc_jerk_mean_y  
  * fft_body_acc_jerk_mean_z
  * fft_body_acc_jerk_std_x
  * fft_body_acc_jerk_std_y
  * fft_body_acc_jerk_std_z
  * fft_body_gyro_mean_x
  * fft_body_gyro_mean_y
  * fft_body_gyro_mean_z
  * fft_body_gyro_std_x
  * fft_body_gyro_std_y
  * fft_body_gyro_std_z
  
The features selected for this tidied database come from the accelerometer and gyroscope 3-axial raw signals time_acc_x, _y, and _z and time_gyro_x, _y, and _z. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time_body_acc_x, _y, and  _z and time_aravity_acc_x, _y, and _z) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_body_acc_jerk_x, _y, and _z and time_body_gyro_jerk_x, _y, and _z).
Finally a Fast Fourier Transform was applied to some of these signals producing fft_body_acc_x, _y, and _z, fft_body_acc_jerk_x, _y, and _z, fft_body_gyro_x, _y, and _z.

