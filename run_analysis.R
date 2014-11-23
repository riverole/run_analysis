run_analysis <- function() {
  ## Read the xtest values, keeping the 561 variables
  xtest <- read.table("test/X_test.txt")
  ## Read the ytest values, only 1 variable
  ytest <- read.table("test/y_test.txt")
  ## Read the subject test variable
  subjtest <- read.table("test/subject_test.txt")
  ## We create the test dataset combining the columns of the three data.frames obtaining a new data.frame
  test <- cbind(subjtest, ytest, xtest)
  ## We read the xtrain values
  xtrain <- read.table("train/X_train.txt")
  ## We read the ytrain values
  ytrain <- read.table("train/Y_train.txt")
  ## We read the train subject values
  subjtrain <- read.table("train/subject_train.txt")
  ## We create the train dataset combining the columns of the three data frames obtaining a train data frame
  train <- cbind(subjtrain, ytrain, xtrain)
  ## We merge the train and test datasets together
  dataset <- rbind(test, train)
  ## We assign the names to the dataset with subject, activity and the names of the features
  names(dataset) <- c("subject", "activity", read.table("features.txt", stringsAsFactors = FALSE)[,2])
  ## We convert the activity to factor
  dataset$subject <- factor(dataset$subject)
  ## We convert the subject to factor
  dataset$activity <- factor(dataset$activity)
  ## We assign more meaningful levels to the activity factors from the activity.label.txt file
  levels(dataset$activity) <- read.table("activity_labels.txt", stringsAsFactors = FALSE)[,2]
  ## We extract only the columns that are subject, activity and the ones that end as mean() or std() and we put it in a new data frame
  finaldataset <- dataset[, grep("activity|subject|mean\\(\\)|std\\(\\)", names(dataset), ignore.case=TRUE, perl=TRUE)]
  ## We write this dataset
  write.table(finaldataset, "clean_dataset.txt", row.names = FALSE)
  ## We calculate the mean for each subject for each activity (ommiting subject and activity columns)
  avg <- aggregate(finaldataset[,3:ncol(finaldataset)], by=list(finaldataset$subject, finaldataset$activity), mean)
  ## We change the names of the columns
  names(avg)[1:2] <- c("subject", "activity")
  ## We write this dataset
  write.table(avg, "average_by_activity_by_subject.txt", row.names = FALSE)  
}