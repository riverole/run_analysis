run_analysis
============

## The first part of our function read the xtest values, keeping the 561 variables and all the observations
## After that we read the ytest value, which is 1 variable with the same number of observations
## Finally we also read the subject value, which is also 1 variable with the same number of observations
## We create the test dataset combining the columns of the three data.frames obtaining a new data.frame
## We read then the xtrain, ytrain and subjectrain values and we merge them also in a data.frame.
## We merge the train and test datasets together, doing an rbind so we keep the same columns and just add rows
## We assign the names to the dataset with subject, activity and the names of the features, that we obtain from features.txt
## We convert the activity and the subject to a factor and we assign a more meaningful factors to activity from activity_labels.txt
## We extract only the columns that are subject, activity and the ones that end as mean() or std() and we put it in a new data frame
## We write this dataset into a new .txt file, without naming the rows
## We calculate the mean for each subject for each activity (ommiting subject and activity columns)
## We change the names of the columns to avoid the two aggregating columns to be called group.1 and group.2
## We write this dataset in a text file
