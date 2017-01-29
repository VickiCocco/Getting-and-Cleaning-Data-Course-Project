# Getting-and-Cleaning-Data-Course-Project


## ASSUMPTIONS:
1. The source data file zip was unzipped in the working directory and left in the same directory structure
2. The obseravations and variables are in the same order across all vectors of data of the same dimensions

## Contained in this REPO


gitignore
CodeBook.md
Getting-and-Cleaning-Data-Course-Final-Project.Rpro
Merge File Schema.jpg
README-RecievedFromCustomer.txt
activity_labels.txt
features.txt
features_info.txt
run_analysis.R
summarized_data.csv
summarized_data.txt

info_set <- sample_n(gathered_set, 200, replace = FALSE)
write.table(info_set, "info_only_data.txt", sep="\t", append = TRUE, row.names = FALSE)
