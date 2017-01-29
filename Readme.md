# Getting-and-Cleaning-Data-Course-Project

## RScript
The script file is run_analysis.R.  It is a stand alone script that I developed in RStudio.  The Codebook.md 
has further details. Only the given data files are required as input, and the 3 output files are described in
the Codebook.md

## ASSUMPTIONS:
1. The source data file zip was unzipped in the working directory and left in the same directory structure
2. The obseravations and variables are in the same order across all vectors of data of the same dimensions
   *these assumptions should be clarified in a productive environment but stands for the purpose of this project*

## Contained in this REPO


### gitignore - r document

### CodeBook.md - data merging and cleaning, data dictionaries and code walkthru

### Getting-and-Cleaning-Data-Course-Final-Project.Rpro r file

### Merge File Schema.jpg - schema diagram for binds and joins

### README-RecievedFromCustomer.txt - read me file recieve from customer

### activity_labels.txt - file containing activiy labels, refer to codebook

### features.txt - file containing feature names and numbers, refer to codebook

### features_info.txt - contains textual information about the features

### run_analysis.R - r script for project

### summarized_data.csv -  final summarized data set

### summarized_data.txt - contains same information - with a header for easier reading if needed

### info_set.txt - the final data set is large, this file has 200 random observations
### for documentation purposes, obtained by using the following line commands
  
* info_set <- sample_n(gathered_set, 200, replace = FALSE)

* write.table(info_set, "info_only_data.txt", sep="\t", append = TRUE, row.names = FALSE)
