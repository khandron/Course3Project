# Project for Getting and Cleaning Data
#
#
#
#

#create directory if needed, and set it as the working directory
if (!file.exists("Project3")) {
  dir.create("Project3")
}
setwd("Project3")

#download and unzip the dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "data.zip", method = "curl")
unzip("data.zip")


#part 1
#read the label, activity, subject and data files
actLab <- read.table("UCI HAR Dataset/activity_labels.txt")
featuresNames <- read.table("UCI HAR Dataset/features.txt")
actTest <- read.table("UCI HAR Dataset/test/y_test.txt")
actTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
dataTest <- read.table("UCI HAR Dataset/test/X_test.txt")
dataTrain <- read.table("UCI HAR Dataset/train/X_train.txt")

#merge the test and training datasets
act <- rbind(actTrain, actTest)
sub <- rbind(subTrain, subTest)
data <- rbind(dataTrain, dataTest)

#label
names(sub) <- c("subject")
names(act) <- c("activity")
names(data) <- featuresNames$V2
names(actLab) <- c("activity")


#merge the data
allData <- cbind( sub, act, data)

#part 2

#Pick out only mean and std 
subfeaturesNames <- featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]
selectedNames <- c("subject", "activity", as.character(subfeaturesNames))
subData <-subset(allData, select=selectedNames)

#part 3 
#replace codes for activities with names
subData <- merge(subData,actLab,by="activity", all.x=TRUE)


#part 4
#label datasets with descriptive names
names(subData)<-gsub("-std()", "stddev", names(subData))
names(subData)<-gsub("\\()","", names(subData))
names(subData)<-gsub("-mean", "mean", names(subData))
names(subData)<-gsub("^(t)", "time", names(subData))
names(subData)<-gsub("^(f)", "frequency", names(subData))
names(subData)<-gsub("Gg", "gravity", names(subData))
names(subData)<-gsub("BodyBody", "body", names(subData))
names(subData)<-gsub("Acc", "accelerometer", names(subData))
names(subData)<-gsub("Gyro", "gyroscope", names(subData))
names(subData)<-gsub("Mag", "magnitude", names(subData))
names(subData)<-gsub("Jerk", "jerk", names(subData))
names(subData)<-gsub("Body", "body", names(subData))

#part 5
#create tidydata sorted by activity and subject with just the average, reorder the columns and fix the activity name

tidyData<- subData[c(69,2:68)] 
names(tidyData)[1] <- "activity"
tidyData <- aggregate(tidyData[,3:68],by=list(subject = tidyData$subject, activity = tidyData$activity), mean)
write.table(format(tidyData, scientific=T), "tidydata.txt", row.names=F, col.names=T, quote=2)

