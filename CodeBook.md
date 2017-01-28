Intial Files Received:

A zip file "UCI HAR DATASET"
- in the readme.md there is an assumption that this file is unzipped to the working drive of the R Script
- for the purpose of this project this will stand until further development is requested

Contained in the zip file and in directory structure
  activity_labels.txt
  features.txt
  feature_info.txt
  test directory
    subject_test.txt
    X_test.txt
    y_test.txt
    Inertial Signals directory
      body_acc_x_test.txt
      body_acc_y_test.txt
      body_acc_z_test.txt
      body_gyro_x_test.txt
      body_gyro_y_test.txt
      body_gyro_z_test.txt
      total_acc_x_test.txt
      total_acc_y_test.txt
      total_acc_z_test.txt
  train directory
    subject_test.txt
    X_test.txt
    y_test.txt
    Inertial Signals directory
      body_acc_x_test.txt
      body_acc_y_test.txt
      body_acc_z_test.txt
      body_gyro_x_test.txt
      body_gyro_y_test.txt
      body_gyro_z_test.txt
      total_acc_x_test.txt
      total_acc_y_test.txt
      total_acc_z_test.txt
      
A brief summary of the data:
"Participants" performed "Activities" while biometric "Features" were measured and recorded as observations.

Initial imports and anaylsis for each file
activity_labels.txt  - the activities the participants performed
  - The file is read into activity_lablels data_table using "fread" 
  - It contains a activity number variable with unique numbers and corresponding activity name
    eg: "1 walking", "5 standing"
  - Added applicable variable / column names as "activitynumber", "activityname"
  6 observations of 2 variables
  
  features.txt - the features of each test with some parameters
  - The file is read file into features data_table using "fread"  
  - It contains a feature number variable with unique numbers adn corresponding feature name
    eg:  "1 tBodyAcc-mean()-X" , "88 tBodyAccJerk-mad()-Y"
  - Added applicable variable / column names as "featurenumber", "featurename"
  561 observations of 2 variables
  
  feature_info.txt
  - The file is read file into features_info data_table using "fread" 
  After inspection this file is an information only text file and has been included in this repository
  It contains logical information about the format of more of the datasets
  
  The train and test directories contain similar number of files and name structure.  After inspection 
  each of the corresponding files can be managed with the same steps but with differing number of observations.
  
  subject_test.txt / subject_train.txt
  - Each file is read file into subject_train or subject_test data_table using "fread" 
  - It contains subject numbers only, and according the assumption outlined in the readme.md, thery are in the 
    same order as the observations in each of the train_y and test_y file described next.
  - Added applicable variable / column name as "subjectnumber"
  subject_train.txt 7352 observations of 1 variable
  subject_test.txt 2947 observations of 1 variable
  
  y_test.txt / y_train.txt
  - Each file is read file into train_labels or test_labels data_table using "fread" 
  - It contains feature numbers only, and according the assumption outlined in the readme.md, thery are in the 
    same order as the observations of the subject activities performed
  - Added applicable variable / column name as "activitynumber"
  y_train.txt 7352 observations of 1 variable
  y_test.txt 2947 observations of 1 variable
  
   X_test.txt / X_train.txt
  - Each file is read file into train_set or test_set data_table using "fread" 
  - It contains the feature observed value from each of the participants performing each actvity,
    and according the assumption outlined in the readme.md, thery are in the 
    same order as the observations of the subject activities performed, and the features listed
  - Added applicable variable / column names as from the features.txt file
  X_train.txt 7352 observations of 561 variables
  X_test.txt 2947 observations of 561 variables
  
  
  
  
  
