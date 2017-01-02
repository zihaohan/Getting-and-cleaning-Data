## getting and cleaning data 
## final assignment
##

##load all packages
require(downloader)
## download the zip file 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ## the url of the zip file

download(url, dest = "dataset.zip", mode = "wb")## download the zip file to local directory

unzip("dataset.zip", exdir="./data")##unzip zip file

setwd(".\\data") 
## to change the wd, since I use windows system;
##for other system, please change it :)

##first, train group
setwd(".\\UCI HAR Dataset\\train")
dir()
x_train <- read.table("X_train.txt")
y_train<- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

## then, test group
setwd("..\\test")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

## then test + train
allx <- rbind(x_train, x_test)
ally <- rbind(y_train, y_test)
allsubject <- rbind(subject_train, subject_test)

##subset the data set including keyword(s)

setwd("..")

activities<- read.table("activity_labels.txt")

features <- read.table("features.txt")
##Extracts only the measurements on the mean and standard deviation for each measurement.
filtercol <-grep(".*mean.*|.*std.*", features[,2])
targeted <- features[filtercol, ]

allx <- allx[, filtercol]
names(allx) <- features[filtercol, 2]
##change the names

ally[ ,1] <- factor(ally[ ,1], levels = 1:6, labels = c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "lying"))
names(ally) <- "activity"
names(allsubject) <-"subject"
overall <- cbind(allsubject, ally, allx)

# finally, form the new table 
require(plyr)
averages_data <- ddply(overall, .(subject, activity), function(x) colMeans(x[, -(1:2)]))

averages_data
