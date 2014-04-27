
# Code Book

The data set was built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were collected at a constant rate of 50Hz. The data is manually associated with the activity the subject was performing.

The data set is split into two sets: the train data set from 70% of the volunteers randomly selected and the test data from the other 30%. The files of these data sets are in the sub-directories train and test of the unzip '*UCI HAR Dataset.zip*' file.

To the best of my knowledge there is no raw data in the data set downloaded. The closer to the raw data is in the sub-directory 'Inertial Signals' because this data has been preprocessed (details in the README.txt file). I have not used any file in this subfolder for the assessment.

To build the data set I use the following files:

* 'train/X_train.txt': training set.
* 'train/y_train.txt': training activity labels.
* 'train/subject_train.txt': subject that perform the activity. Its range is from 1 to 30.
* 'test/X_test.txt': test set.
* 'test/y_test.txt': test activity labels.
* 'test/subject_test.txt': subject that perform the activity. Its range is from 1 to 30. 

And I get the descriptive activity and features names from the following files:

* 'activity_labels.txt': Links the class labels with their activity name.
* 'features.txt': List of all features.

So, the result data set has 563 variables

* activity: categorical (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* subject: an identifier of the subject who carried out the experiment. Its range is from 1 to 30. 
* and the 561 features from 'features.txt'. A detailed description of each feature can be found in the file 'features_info.txt'.

Because the descriptive name of the features contains some special character, for instance: '-', '(' or ')', each of this character is replaced automaticaly by a dot when the data frame is built. I keep these new names with the dots.

