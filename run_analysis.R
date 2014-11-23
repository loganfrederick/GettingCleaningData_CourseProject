
setwd("/Users/loganfrederick/Projects/Coursera Johns Hopkins Data Science/Getting and Cleaning Data/course_project")

x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

activity_lables<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

features  <- as.character(read.table("UCI HAR Dataset/features.txt")[,2])
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("activity", "activity_label")
colnames(subject_test) <- c("subject")

colnames(x_test) <- features
#colnames(y_test) <- features
colnames(x_train) <- features
#colnames(y_train) <- features

#merged_train <- merge(x_train,y_train,all=TRUE)
#merged_x <- rbind(x_train,x_test)
#merged_y <- rbind(y_train,y_test)

#Merge Test Data
merged_test <- merge(y_test, activities, all.x=TRUE)
x_test <- cbind(subject_test,merged_test,x_test)

#Merge train data
merged_train <- merge(y_train, activities, all.x=TRUE)
x_train <- cbind(subject_train,merged_train,x_train)
colnames(x_train)[1] <- "subject"


#Merge two data sets
data <- rbind(x_test,x_train)

#Get stats
methods <- c("mean()","std()")
#matches <- unique(grep(paste(methods,collapse="|"), features, value=TRUE))

#data_table <- data[,c("subject","activity_labels",matches)]

write.table(data, "run_analysis_data.txt", row.names = FALSE)

