# 0. Setup libraries

library(dplyr, quietly = true)
library(reshape2, quietly = true)

# 1. Optionally download zip file

zipFileName = "accel.zip"

if(!file.exists(zipFileName)) {
    zipFileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(zipFileUrl, zipFileName)
}

# 2. Optionally unzip downloaded file

if (!file.exists("UCI HAR Dataset")) {
    unzip(zipFileName) 
}

# 3. Read support files.

filePath <- file.path("UCI HAR Dataset", "activity_labels.txt")
activities_labels <- read.table(filePath)
names(activities_labels) <- c("activityId", "activity")

filePath <- file.path("UCI HAR Dataset", "features.txt")
features <- read.table(filePath)
names(features) <- c("featureId", "feature_label")
features$feature_label <- gsub("tBody", "time_body_", features$feature_label)
features$feature_label <- gsub("tGravity", "time_gravity_", features$feature_label)
features$feature_label <- gsub("fBody", "fft_body_", features$feature_label)
features$feature_label <- gsub("fGravity", "fft_gravity_", features$feature_label)
features$feature_label <- gsub("Acc", "acc_", features$feature_label)
features$feature_label <- gsub("Jerk", "jerk_", features$feature_label)
features$feature_label <- gsub("Gyro", "gyro_", features$feature_label)
features$feature_label <- gsub("\\-mean\\(\\)", "mean", features$feature_label)
features$feature_label <- gsub("\\-std\\(\\)", "std", features$feature_label)
features$feature_label <- gsub("\\-", "_", features$feature_label)
features$feature_label <- sapply(features$feature_label, tolower)
features$feature_label <- as.character(trimws(features$feature_label))

# 4. Load Training Data

filePath <- file.path("UCI HAR Dataset", "train", "X_train.txt")
train <- read.table(filePath)

filePath <- file.path("UCI HAR Dataset", "train", "subject_train.txt")
subject_train <- read.table(filePath)
names(subject_train) <- c("subject")

filePath <- file.path("UCI HAR Dataset", "train", "y_train.txt")
activities_train <- read.table(filePath)

names(train) <- as.character(trimws(features$feature_label))
selected_train = train[,grepl("_mean_|_std_",  features$feature_label)]

activities_train[,2] <- activities_labels$activity[activities_train[,1]]
names(activities_train) <- c("activity_id", "activity")

merged_train <- cbind(subject_train, activities_train, selected_train)

# 5. Load Test Data

filePath <- file.path("UCI HAR Dataset", "test", "X_test.txt")
test <- read.table(filePath)

filePath <- file.path("UCI HAR Dataset", "test", "subject_test.txt")
subject_test <- read.table(filePath)
names(subject_test) <- c("subject")

filePath <- file.path("UCI HAR Dataset", "test", "y_test.txt")
activities_test <- read.table(filePath)

names(test) <- as.character(trimws(features$feature_label))
selected_test = test[,grepl("_mean_|_std_",  features$feature_label)]

activities_test[,2] <- activities_labels$activity[activities_test[,1]]
names(activities_test) <- c("activity_id", "activity")

merged_test <- cbind(subject_test, activities_test, selected_test)

# 6. Merge Test and Training Data

combined <- rbind(merged_test, merged_train)

# 7. Extracts only the measurements on the mean and standard deviation for each measurement.

id_vars <- c("subject", "activity_id", "activity")
measure_vars <- setdiff(names(combined), id_vars)

tidy = melt(combined, id.vars = id_vars, measure.vars = measure_vars)

# 8. creates a independent tidy data set with the average of each variable for each activity and each subject

mean_tidy <- dcast(tidy, subject + activity ~ variable, mean)

write.table(mean_tidy, file = "mean.txt")
