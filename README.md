
# Getting and Cleaning Data Project: Peer Assessments

The purpose of this repository is the peer assessment of the course *Getting and Cleaning Data* which is part of the Coursera Data Science Specialization.

The goal of the assessment is to prepare tidy data that can be used for later analysis. The assessment have to be comprise of the following minimun files: a README.md (this file) that explains how all of the scripts work and how they are connected. A code book [CodeBook.md](https://github.com/rafdez/PeerAssessment3/CodeBook.md) that describes the variables, the data, and any transformations or work that you performed to clean up the data called. Finally, a R script called [run_analysis.R](https://github.com/rafdez/PeerAssessment3/run_analysis.R) that does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive activity names. 
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The dataset

The dataset is related to wearable computing and human activity recognition. In particular, it was built from the recordings of 30 subjects performing activities of daily living (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while carrying a waist-mounted smartphone with embedded inertial sensors (accelerometer and gyroscope).

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## The scripts

There is only one script in this assessment, the mandatory **run_analysis.R**. In order to run this script, the unzip '*UCI HAR Dataset.zip*' file have to be in your working directory. Otherwise, you have to pass the directory to the function *har()*.

```
> har <- har()
```

or

```
> har <- har('path_to_data')
```

This function return an "object" to get the Human Activity Recognition dataset.

```
> dataset <- har$data()
```

The first time you call this function the dataset is initialized i.e. the train and test sets are loaded separately and merged to create one data set. This unique data set uses descriptive activity and feature names. So, it performs points (1) '*Merges the training and the test sets to create one data set*', (3) '*Uses descriptive activity names to name the activities in the data set*' and (4) '*Appropriately labels the data set with descriptive activity names*'.

After the data set has been initialized you can call the functions: **getdata2()** and **getdata5()** to get the dataset for point (2) '*Extracts only the measurements on the mean and standard deviation for each measurement*' and (5) '*Creates a second, independent tidy data set with the average of each variable for each activity and each subject*'. These two functions are included in the **run_analysis.R** script.

```
> mean_std_dataset <- getdata2(har$data())
```

and

```
> tidy2 <- getdata5(har$data())
```


