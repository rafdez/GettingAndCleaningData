##
## Human Activity Recognition Using Smartphones
##
## The Human Activity Recognition Data Set was built from the recordings of 
## 30 subjects performing activities of daily living (ADL) while carrying 
## a waist-mounted smartphone with embedded inertial sensors (accelerometer 
## and gyroscope).
##
## The activities performed were:
##
##     1 WALKING
##     2 WALKING_UPSTAIRS
##     3 WALKING_DOWNSTAIRS
##     4 SITTING
##     5 STANDING
##     6 LAYING
##
## A full description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##


## This function creates an "object" to get the HAR dataset.
har <- function(dir = getwd()) {
  
  dataset <- NULL
  
  ## This function creates a dataset from the training and test sets.
  data <- function() {
    if(is.null(dataset)) {
      message("loading data ...")
      dataset <<- rbind(load(dir, "train"), load(dir, "test"))
    }
    
    return(dataset)
  }
  
  ## This function loads the train or test set. Besides, it uses descriptive 
  ## activity names to name the activities and labels the data set with descriptive
  ## feature names.
  load <- function(dir, setid) {
    
    subjects <- read.table(
      file.path(dir, setid, paste0("subject_", setid, ".txt")),
      colClasses=c("character"),
      col.name=c("subject"))
    
    features <- read.table(
      file.path(dir, "features.txt"),
      colClasses=c("NULL", "character"))[, 1]
    
    set <- read.table(
      file.path(dir, setid, paste0("X_", setid, ".txt")),
      colClasses=rep("double", times=length(features)),
      col.name=features)
    
    activities <- read.table(
      file.path(dir, setid, paste0("y_", setid, ".txt")),
      colClasses=c("factor"),
      col.name=c("activity"))
    
    activitylabels <- read.table(
      file.path(dir, "activity_labels.txt"),
      colClasses=c("NULL", "character"))[, 1]
    
    activities[, 1] <- factor(activities[, 1], labels=activitylabels)
    
    cbind(activities, subjects, set)
    
  }
  
  list(data=data)

}


## This function extracts the measurements on the mean and standard deviation 
## for each measurement.
getdata2 <- function(data) {
  colnames <- colnames(data)
  index <- 1:length(colnames)
  selected <- tapply(colnames, index, grepl, pattern="mean\\.\\.|std\\.\\.")
  dataset <- subset(data, select=c("activity", "subject", colnames[selected]))
  
  return(dataset)
}

## This function creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
getdata5 <- function(data) {
  by_list <- list(activity=data$activity, subject=data$subject)
  dataset <- aggregate(data[, 3:ncol(data)], by=by_list, FUN=mean)
  dataset <- dataset[order(dataset$activity, as.numeric(dataset$subject)), ]
  rownames(dataset) <- c(1:nrow(dataset))
  
  return(dataset)
}

