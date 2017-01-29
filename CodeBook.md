# Code Book for Course Final Project
## Sections
1. Description of Files Received
2. Descripton of Output Files and Data Dictionary
3. Coding Walkthru

### 1. Description of Files Received:

#### A zip file "UCI HAR DATASET"
  In the Readme.md for this project there is an assumption that this file is unzipped to the working drive of the R Script
  For the purpose of this project this will stand until further development is requested
  There is a Readme.txt accompanying the received files to explain the data, it is included in this repo

Contained in the zip file and in directory structure
  1. activity_labels.txt
  2. features.txt
  3. feature_info.txt
  4. test directory
     
     subject_test.txt
     
     X_test.txt
     
     y_test.txt
     
     Inertial Signals directory -      
        *body_acc_x_test.txt
        body_acc_y_test.txt
        body_acc_z_test.txt
        body_gyro_x_test.txt
        body_gyro_y_test.txt
        body_gyro_z_test.txt
        total_acc_x_test.txt
        total_acc_y_test.txt
        total_acc_z_test.txt*
  
  5.train directory
     
     subject_test.txt
     
     X_test.txt
     
     y_test.txt
     
     Inertial Signals directory - 
         *body_acc_x_test.txt
          body_acc_y_test.txt
          body_acc_z_test.txt
          body_gyro_x_test.txt
          body_gyro_y_test.txt
          body_gyro_z_test.txt
          total_acc_x_test.txt
          total_acc_y_test.txt
         total_acc_z_test.txt*
      
#### A brief summary of the data:
"Participants" performed "Activities" while biometric "Features" were measured and recorded as observations.

#### Initial imports and anaylsis for each file

##### activity_labels.txt  - the activities the participants performed

   The file is read into activity_lablels data_table using "fread" 
   It contains a activity number variable with unique numbers and corresponding activity name
    
   Activity Number / Activity Name 
      -1 WALKING
      -2 WALKING_UPSTAIRS
      -3 WALKING_DOWNSTAIRS
      -4 SITTING
      -5 STANDING
      -6 LAYING
   
    Added applicable variable / column names as "activitynumber", "activityname"
    -6 observations of 2 variables
  
##### features.txt - the features of each test with some parameters
   The file is read file into features data_table using "fread"  
   
   A complete list of features if included in feature_info.txt included in repo
   
   It contains a feature number variable with unique numbers adn corresponding feature name
    eg:  "1 tBodyAcc-mean()-X" , "88 tBodyAccJerk-mad()-Y"
    
    Added applicable variable / column names as "featurenumber", "featurename"
    - 561 observations of 2 variables
  
##### feature_info.txt
  The file is read file into features_info data_table using "fread" 
  
  After inspection this file is an information only text file and has been included in this repository
  
  It contains logical information about the format of more of the datasets
  
  *The train and test directories contain similar number of files and name structure.  After inspection 
  each of the corresponding files can be managed with the same steps but with differing number of observations.*
  
##### subject_test.txt / subject_train.txt
  Each file is read file into subject_train or subject_test data_table using "fread" 
  
  It contains subject numbers only, and according the assumption outlined in the readme.md, 
  they are in the same order as the observations in each of the train_y and test_y file
  described next.
  
  Added applicable variable / column name as "subjectnumber"
   - subject_train.txt 7352 observations of 1 variable
   - subject_test.txt 2947 observations of 1 variable
  
##### y_test.txt / y_train.txt
  Each file is read file into train_labels or test_labels data_table using "fread" 
  It contains activity numbers only, 1,2,3,4,5,or 6 and according the assumption outlined in the
  readme.md, they are in the same order as the observations of the subject activities performed
  Added applicable variable / column name as "activitynumber"
  - y_train.txt 7352 observations of 1 variable
  - y_test.txt 2947 observations of 1 variable
  
##### X_test.txt / X_train.txt
  Each file is read file into train_set or test_set data_table using "fread" 
  
  It contains the feature observed value from each of the participants performing each actvity,
  and according the assumption outlined in the readme.md, thery are in the 
  same order as the observations of the subject activities performed, and the features listed
  
  Added applicable variable / column names as from the features.txt file
  - X_train.txt 7352 observations of 561 variables
  - X_test.txt 2947 observations of 561 variables
  
  *Inertial Signals directory
    This data is read in the r-Script but commented out
    These files contain further inertial values that are supplementary values to some of the
    features that are observed in the testing
    These values are not required for the final process but the code remains in the script if 
    the requirements change*
  
  ### 2. Descripton of Output Files
    Two data sets are required the first:  
        
        Merges the training and the test sets to create one data set,
        
        Extracts only the measurements on the mean and standard deviation for each measurement.
        
        Uses descriptive activity names to name the activities in the data set
      
        Appropriately labels the data set with descriptive variable names.
    
    The second:
      
      From the prior data set in create an independent tidy data set with the average 
      of each variable for each activity and each subject. 
    
    Another logfile.txt was created and appended throughout the code to record data integrity tests 
    after binds and merges.
    
    *File layout determination
         -For this project I am taking directions from features_info.txt literally and looking for featurenames 
          with mean() or std() according to the document, i interpret the 2 "variables" required are feature name and value
        - there are 66 featurenames that are required to be kept
        - Based on the document , I understand that there are three different signals for each measurement, 
        - therefore the separate XYZ are not variables. 
        - Taken from the document as :
        - '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions
        - tBodyAcc-X, tBodyAcc-Y, tBodyAcc-Z are all separate signals
        - In a productive environment this should be investigated more
        - there are 66 featurenames that are required to be kept
        - this will be a "long" data set*

##### Data Dictionary for data sets
      final_set
      1.  subjectnumber
          1 thru 6
      
      2.  activityname 
            -WALKING
            -WALKING_UPSTAIRS
            -WALKING_DOWNSTAIRS
            -SITTING
            -STANDING
            -LAYING
       
       3. featurename 
            -fBodyAcc-mean()-X
            -fBodyAcc-mean()-Y
            -fBodyAcc-mean()-Z
            -fBodyAcc-std()-X
            -fBodyAcc-std()-Y
            -fBodyAcc-std()-Z
            -fBodyAccJerk-mean()-X
            -fBodyAccJerk-mean()-Y
            -fBodyAccJerk-mean()-Z
            -fBodyAccJerk-std()-X
            -fBodyAccJerk-std()-Y
            -fBodyAccJerk-std()-Z
            -fBodyAccMag-mean()
            -fBodyAccMag-std()
            -fBodyBodyAccJerkMag-mean()
            -fBodyBodyAccJerkMag-std()
            -fBodyBodyGyroJerkMag-mean()
            -fBodyBodyGyroJerkMag-std()
            -fBodyBodyGyroMag-mean()
            -fBodyBodyGyroMag-std()
            -fBodyGyro-mean()-X
            -fBodyGyro-mean()-Y
            -fBodyGyro-mean()-Z  
            -fBodyGyro-std()-X
            -fBodyGyro-std()-Y
            -fBodyGyro-std()-Z
            -tBodyAcc-mean()-X
            -tBodyAcc-mean()-Y
            -tBodyAcc-mean()-Z
            -tBodyAcc-std()-X
            -tBodyAcc-std()-Y  
            -tBodyAcc-std()-Z
            -tBodyAccJerk-mean()-X
            -tBodyAccJerk-mean()-Y
            -tBodyAccJerk-mean()-Z
            -tBodyAccJerk-std()-X
            -tBodyAccJerk-std()-Y
            -tBodyAccJerk-std()-Z
            -tBodyAccJerkMag-mean()
            -tBodyAccJerkMag-std()
            -tBodyAccMag-mean()
            -tBodyAccMag-std()
            -tBodyGyro-mean()-X
            -tBodyGyro-mean()-Y
            -tBodyGyro-mean()-Z
            -tBodyGyro-std()-X
            -tBodyGyro-std()-Y
            -tBodyGyro-std()-Z
            -tBodyGyroJerk-mean()-X
            -tBodyGyroJerk-mean()-Y
            -tBodyGyroJerk-mean()-Z
            -tBodyGyroJerk-std()-X
            -tBodyGyroJerk-std()-Y
            -tBodyGyroJerk-std()-Z
            -tBodyGyroJerkMag-mean()
            -tBodyGyroJerkMag-std()
            -tBodyGyroMag-mean() 
            -tBodyGyroMag-std()
            -tGravityAcc-mean()-X
            -tGravityAcc-mean()-Y
            -tGravityAcc-mean()-Z
            -tGravityAcc-std()-X
            -tGravityAcc-std()-Y
            -tGravityAcc-std()-Z
            -tGravityAccMag-mean()
            -tGravityAccMag-std()
      
      4. Feature Value
        - the test value observed for the feature
        
        summarized_set
        First 3 variables as above,
        4. featureaverage
        - the average value observed for the feature over activityname and subjectnumber

 


### 3. Coding Walkthru
  - please see Merge Schema file in repo - steps 1 - 6 are in the diagram.  These steps are also documented in the code
    1. The appropriate column / variable names as described in the import descriptions of the files, were applied to teach of the test          and train datasets.  The number of observations from the feature.txt file match the number of variables from the X_test and              X_train files. 
    2. & 
    3. Each of the data tables made from the X_test.txt, y_test.txt and subject_test.txt have the same number of observations. These            were merged into one data table using cbind.  2947 observations of 563 variables
       Each of the data tables made from the X_train.txt, y_train.txt and subject_train.txt have the same number of observations. These        were merged into one data table using cbind. 7352 observation of 563 variables
    4. Each of the merged test and train datatables have the same number of columns.  They were merged using rbind.
       - 10299 observations of 563 variables.
    5. & 
    6. The data table for the activity_labels.txt file links the number of the activity to the activity name. The merged data table has        only activity numbers in it, it needs the activity names to be tidier.  The activity_labels table is joined as a full join with          the merge table on the activity number variable.  The activity number is now redundant, the activity number column is removed.          The remaining data table is sorted on subject number and activity name.
   
   *The is no schema from here only but the code is fully documented*
    7. The next step is to remove the unwanted data.  Based on the data determination presented, the variables to keep were
       identified using grepl to create a logical vector based on the feature names. 
       This logical vector is used to keep the "TRUE" columns.
       - 10299 observations of 68 variables
   
    8. The final data set is shaped by gathering all the columns other than the subjectnumber and activityname.  
       The columns are renamed to "subjectnumber", "activityname", "featurename", "featurevalue"
       The final data table is written a csv file for future purposes, "final_data.csv"  
      
      *I chose csv as an industry standard and it is an format that the customer can easily
        reformat themselves without code changes for me, a txt file of 200 random observations has been
        added for documentation only, the final data set is too big to include in the repo*
        - 679734 observations of 4 variables
     
     9. The summarised data set created by grouping and summarising on 
        "subjectnumber", "activityname", "featurename" and averaging the "featurevalue", which is named "featureaverage"
        Added to the repo as "summarized_data.csv", and another txt file is added for documentation
        - 11880 observations of 4 variables
      
    10. Throughout the code, a "logfile.txt" was created and appended with messages about basic data integrity tests performed 
        to prove out the binding and merging techniques
      
      
      
   
   
  
  
  
  
