setwd("/Users/loganfrederick/Projects/Coursera Johns Hopkins Data Science/Getting and Cleaning Data/course_project/")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x <- rbind(x_train, x_test)

features <- read.table("UCI HAR Dataset/features.txt")
names(x) <- features[,2]

extracted_x <- x[, grepl("mean\\(\\)", names(x)) | grepl("std\\(\\)", names(x))]

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_names <- activity_labels$V2[match(y$V1, activity_labels$V1)]

extracted_x <- cbind("subject"=subject$V1, "activityName"=activity_names, extracted_x)

# Remove non-alphanumeric characters in the variable names
# Found :alnum from forums/googling
names(extracted_x) <- gsub(pattern="[^[:alnum:]]",replacement="", names(extracted_x))

library(reshape2)
melt_data <- melt(extracted_x, id=c("subject", "activityName"))
tidy_data <- dcast(melt_data, subject + activity_names ~ variable, mean)
write.csv(tidy_data, file="tidy.txt", row.names=FALSE)

