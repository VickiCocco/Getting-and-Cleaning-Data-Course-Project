# Code Book for Course Final Project
## Sections
1. Description of Files Received
2. Descripton of Output Files
3. Merge Steps Explained
4. Coding Walkthru
5. Data Dictionary


### 1. Description of Files Received:

#### A zip file "UCI HAR DATASET"
- in the Readme.md for this project there is an assumption that this file is unzipped to the working drive of the R Script
- for the purpose of this project this will stand until further development is requested
- there is a Readme.txt accompanying the received files to explain the data, it is included in this repo

Contained in the zip file and in directory structure
  activity_labels.txt
  features.txt
  feature_info.txt
  test directory
    subject_test.txt
    X_test.txt
    y_test.txt
    Inertial Signals directory
    - body_acc_x_test.txt
    - body_acc_y_test.txt
    - body_acc_z_test.txt
    - body_gyro_x_test.txt
    - body_gyro_y_test.txt
    - body_gyro_z_test.txt
    - total_acc_x_test.txt
    - total_acc_y_test.txt
    - total_acc_z_test.txt
  train directory
    subject_test.txt
    X_test.txt
    y_test.txt
    Inertial Signals directory
    - body_acc_x_test.txt
    - body_acc_y_test.txt
    - body_acc_z_test.txt
    - body_gyro_x_test.txt
    - body_gyro_y_test.txt
    - body_gyro_z_test.txt
    - total_acc_x_test.txt
    - total_acc_y_test.txt
    - total_acc_z_test.txt
      
#### A brief summary of the data:
"Participants" performed "Activities" while biometric "Features" were measured and recorded as observations.

#### Initial imports and anaylsis for each file
*activity_labels.txt*  - the activities the participants performed
  - The file is read into activity_lablels data_table using "fread" 
  - It contains a activity number variable with unique numbers and corresponding activity name
    
    Activity Number / Activity Name 
     - 1 WALKING
     - 2 WALKING_UPSTAIRS
     - 3 WALKING_DOWNSTAIRS
     - 4 SITTING
     - 5 STANDING
     - 6 LAYING
   
  - Added applicable variable / column names as "activitynumber", "activityname"
  -6 observations of 2 variables
  
  *features.txt* - the features of each test with some parameters
  - The file is read file into features data_table using "fread"  
  - a complete list of features if included in feature_info.txt included in repo
  - It contains a feature number variable with unique numbers adn corresponding feature name
   - eg:  "1 tBodyAcc-mean()-X" , "88 tBodyAccJerk-mad()-Y"
  - Added applicable variable / column names as "featurenumber", "featurename"
  - 561 observations of 2 variables
  
  *feature_info.txt*
  - The file is read file into features_info data_table using "fread" 
  After inspection this file is an information only text file and has been included in this repository
  It contains logical information about the format of more of the datasets
  
  *The train and test directories contain similar number of files and name structure.  After inspection 
  each of the corresponding files can be managed with the same steps but with differing number of observations.*
  
  *subject_test.txt / subject_train.txt*
  - Each file is read file into subject_train or subject_test data_table using "fread" 
  - It contains subject numbers only, and according the assumption outlined in the readme.md, thery are in the 
    same order as the observations in each of the train_y and test_y file described next.
  - Added applicable variable / column name as "subjectnumber"
  - subject_train.txt 7352 observations of 1 variable
  - subject_test.txt 2947 observations of 1 variable
  
  *y_test.txt / y_train.txt*
  - Each file is read file into train_labels or test_labels data_table using "fread" 
  - It contains activity numbers only, 1,2,3,4,5,or 6 and according the assumption outlined in the readme.md, they are in the 
    same order as the observations of the subject activities performed
  - Added applicable variable / column name as "activitynumber"
  - y_train.txt 7352 observations of 1 variable
  - y_test.txt 2947 observations of 1 variable
  
   *X_test.txt / X_train.txt*
  - Each file is read file into train_set or test_set data_table using "fread" 
  - It contains the feature observed value from each of the participants performing each actvity,
    and according the assumption outlined in the readme.md, thery are in the 
    same order as the observations of the subject activities performed, and the features listed
  - Added applicable variable / column names as from the features.txt file
  - X_train.txt 7352 observations of 561 variables
  - X_test.txt 2947 observations of 561 variables
  
  *Inertial Signals directory*
    - this data is read in the r-Script but commented out
    - these files contain further inertial values that are supplementary values to some of the
      features that are observed in the testing
    - these values are not required for the final process but the code remains in the script if 
      the requirements change
  
  ### 2. Descripton of Output Files
    - two data sets are required
    - the first:  
      - merges the training and the test sets to create one data set,
      - extracts only the measurements on the mean and standard deviation for each measurement.
      - uses descriptive activity names to name the activities in the data set
      - appropriately labels the data set with descriptive variable names.

    - the second:
      - from the prior data set in create an independent tidy data set with the average of each variable for each activity and each               subject. 
    
    *File layout determination*
         -For this project I am taking directions from features_info.txt literally and looking for featurenames 
         with mean() or std() according to the document these are the 2 "variables" required
        - there are 66 featurenames that are required to be kept
        Based on the document , I understand that there are three different signals for each measurement, therefore the separate 
        XYZ are not variables. 
        Taken from the document as : '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions
        - tBodyAcc-X, tBodyAcc-Y, tBodyAcc-Z are all separate signals
        - In a productive environment this should be investigated more

  
