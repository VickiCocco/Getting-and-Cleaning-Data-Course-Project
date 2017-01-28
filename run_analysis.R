
run_analysis <- 
        
######### load required packages and libraries
install.packages("dplyr")
install.packages("tidyr")
install.packages("data.table")
install.packages("lubridate")
library(dplyr)
library(tidyr)
library(data.table)
library(lubridate)

#####################################################################
########  Step 1. Merges the training and the test sets 
########  to create one data set
########
######## Step 4.Appropriately labels the data set with 
######## descriptive variable names.
######## this is done throughout and explicitly for code readablilty
#######################################################################
        
########  read the tables acquired - see readme

### import test activity labels
### 
activity_labels <-fread("activity_labels.txt")
activity_labels <- tbl_df(activity_labels)
colnames(activity_labels) <- c("activitynumber", "activityname")

### import features
features <-fread("features.txt")
features <- tbl_df(features)
colnames(features) <- c("featurenumber", "featurename")

### import inertial signal files
### workingdir <- getwd()
### filelocation <- paste(workingdir, "/test/Inertial Signals", sep = "")
### filenames <- list.files(filelocation, pattern="*.txt", full.names=TRUE)
### inertiasignals <- lapply(filenames, fread)


### get training set and training labels
### step down one directory and read the three train files 
workingdir <- getwd()
filelocation <- paste(workingdir, "/train", sep = "")
setwd(filelocation)
subject_train <-fread("subject_train.txt")
train_set <- fread("X_train.txt")
train_labels <- fread("y_train.txt")

#### return to working directory
setwd(workingdir)

#### create the tables for training info
subject_train <- tbl_df(subject_train)
train_set <- tbl_df(train_set)
train_labels <- tbl_df(train_labels)

#####  adding appropriate variable/ column names
#####    step 1 code book
colnames(train_set) <- features$featurename
colnames(train_labels) <- ("activitynumber")
colnames(subject_train) <- ("subjectnumber")


### get test set and test labels
### step down one directory and read the three test files 
workingdir <- getwd()
filelocation <- paste(workingdir, "/test", sep = "")
setwd(filelocation)
subject_test <-fread("subject_test.txt")
test_set <- fread("X_test.txt")
test_labels <- fread("y_test.txt")

#### return to working directory
setwd(workingdir)

#### create the tables for training info
subject_test <- tbl_df(subject_test)
test_set<- tbl_df(test_set)
test_labels <- tbl_df(test_labels)

#####  adding appropriate variable/ column names
####   step 1 codebook
colnames(test_set) <- features$featurename
colnames(test_labels) <- ("activitynumber")
colnames(subject_test) <- ("subjectnumber")

###### combine the train data
subject_train_set <- cbind(train_labels, train_set)
subject_train_set <- cbind(subject_train, subject_train_set)

#### combine the test data
subject_test_set <- cbind(test_labels, test_set)
subject_test_set <- cbind(subject_test, subject_test_set)

####  start to print a log file
cat(paste("run_analysis.R Log File Start", now()),file="logfile.txt",sep="\n")


#### combine test and train data
subject_set <- rbind(subject_test_set, subject_train_set)

#### logging some test results for data integrity
####  this is an example test and example output format

train_column_total <- sum(subject_train_set[100])
test_column_total <- sum(subject_test_set[100])
column_total <- sum(subject_set[100])

added_column_total <- train_column_total + test_column_total
if (added_column_total == column_total) {
        cat(paste("        bind test passed", now()),file="logfile.txt",sep="\n", append = TRUE)       
}else {
        cat(paste("       bind test failed", now()),file="logfile.txt",sep="\n", append = TRUE)
        
}

#### checking for NAs
totalNAs_before = colnames(subject_set)[colSums(is.na(subject_set)) > 0]
if (is.null(dim(totalNAs_before))) {
        totalNAs_before = 0
}

#####################################################################
########  Step 3. Uses descriptive activity names to name 
########  the activities in the data set
########   this step logically belonged her in this process
#####################################################################

####  apply activity names by joining on the activity number
####  then delete redundant activiy number column
subject_set <- full_join(activity_labels, subject_set, "activitynumber")

####  rearranging and sorting columns for readability before dropping col
subject_set <- subject_set[ , c(3,1,2,4:564)]
subject_set <- arrange(subject_set, subjectnumber, activitynumber)
subject_set <- select(subject_set, -activitynumber)

####  doing some basic tests to ensure data integrity
totalNAs_after = colnames(subject_set)[colSums(is.na(subject_set)) > 0]
if (is.null(dim(totalNAs_after))) {
        totalNAs_after = 0
}

cat(paste(paste("       Total NA's before merge : ", totalNAs_before), now()),file="logfile.txt",sep="\n", append = TRUE)
cat(paste(paste("       Total NA's after merge  : ", totalNAs_after), now()),file="logfile.txt",sep="\n", append = TRUE)

if (dim(totalNAs_before) == dim(totalNAs_after)) {
        cat(paste("       merge test passed", now()),file="logfile.txt",sep="\n", append = TRUE)       
}else {
        cat(paste("       merge test failed", now()),file="logfile.txt",sep="\n", append = TRUE)
}       
#####################################################################
########  Step 2. Extracts only the measurements on the mean and
########  standard deviation for each measurement. 
########
#####################################################################

######  creating a logical vector of the colums to keep 
######  by looking at the variable names
######  for this project I am taking directions 
######  literally and looking for variables with mean() or std()
######  According to the document "features_info.txt" these are the 
######  "variables". 
######  68 columns
######  Based on the document alone, I understand that there are 
######  three different signals for each measurement, therefor the XYZ are
######  not variables. Taken from the document as
######  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions
######  tBodyAcc-X, tBodyAcc-Y, tBodyAcc-Z are all separate signals
######  In a productive environment this should be 
######  investigated more

######  getting the final amount of data required
toMatch <- c("std", "-mean\\(", "activity", "subject")

namematches <- (grepl(paste(toMatch,collapse="|"), colnames(subject_set)))

#######  doing a sample test for data integrity
totalcolumnmatch = sum(namematches)  

final_set = subject_set[namematches]

if (totalcolumnmatch == ncol(final_set)) {
        cat(paste("       column select test passed", now()),file="logfile.txt",sep="\n", append = TRUE)       
}else {
        cat(paste("       column select test failed", now()),file="logfile.txt",sep="\n", append = TRUE)
        
}

##### remove intermediate data from memory
rm(activity_labels)
rm(features)
rm(subject_train)
rm(train_set)
rm(train_labels)
rm(subject_test)
rm(test_set)
rm(test_labels)
rm(subject_test_set)
rm(subject_train_set)
rm(added_column_total)
rm(train_column_total)  
rm(test_column_total)
rm(column_total)
rm(totalNAs_after)
rm(totalNAs_before)

#####  putting the data in a tidy form, long form - see codebook
#####  for final form explanation

gathered_set <- gather(final_set, feature, value, -subjectnumber, -activityname)

cols <- c("subjectnumber","activityname","featurename", "featurevalue")
colnames(gathered_set) <- cols
#####   sort on primary values
gathered_set <- arrange(gathered_set, subjectnumber, activityname)

#####################################################################
########  This is the deliverable for Step 4. 
#####################################################################

######  writing table to .csv for submission,
write.csv(gathered_set, file = "final_data.csv", row.names = FALSE)

#####   writing a second table for documentation purposes

line="#######  this data is for documentation purposes #####"
write(line,file="final_data.txt",append=TRUE)
line="####### correct data - use .csv file or remove this message #####"
write(line,file="final_data.txt",append=TRUE)
write.table(gathered_set, "final_data.txt", sep="\t", append = TRUE, row.names = FALSE)

######## create the summarised set of tidy data

summarised_set <- group_by(gathered_set, subjectnumber, activityname)
summarised_set <- summarise(summarised_set, mean(featurevalue))
cols <- c("subjectnumber","activityname","featurename", "averagevalue")
colnames(summarised_set) <- cols

#####################################################################
########  Step 5. From the data set in step 4, creates a second, 
######## independent tidy data set with the average of 
######## each variable for each activity and each subject.
########
#####################################################################

######  writing table to .csv for submission
write.csv(summarised_set, file = "summarized_data.csv", row.names = FALSE)

#####   writing a second table for documentation purposes

line="#######  this data is for documentation purposes #####"
write(line,file="summarized_data.txt",append=TRUE)
line="####### correct data - use .csv file or remove this message #####"
write(line,file="summarized_data.txt",append=TRUE)
write.table(summarised_set, "summarized_data.txt", sep="\t", append = TRUE, row.names = FALSE)


### end and show log file
cat(paste("run_analysis.R Log File End", now()),file="logfile.txt",sep="\n", append = TRUE)
#file.show("logfile.txt")
