datascience-GCD
===============

These are instruction needed to safely run the script run_analysis.R for the convertion of the "UCI HAR Dataset" into a tidy dataset.  

The dataset subtree must be put into the working directory along with the script *run_analysis.R* so that it finally looks like this:  
./run_analysis.R  
./UCI HAR Dataset  
./UCI HAR Dataset/.DS_Store  
./UCI HAR Dataset/activity_labels.txt  
./UCI HAR Dataset/features.txt  
./UCI HAR Dataset/features_info.txt  
./UCI HAR Dataset/README.txt  
./UCI HAR Dataset/test  
./UCI HAR Dataset/test/.DS_Store  
./UCI HAR Dataset/test/Inertial Signals  
./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt  
./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt  
./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt  
./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt  
./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt  
./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt  
./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt  
./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt  
./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt  
./UCI HAR Dataset/test/subject_test.txt  
./UCI HAR Dataset/test/X_test.txt  
./UCI HAR Dataset/test/y_test.txt  
./UCI HAR Dataset/train  
./UCI HAR Dataset/train/Inertial Signals  
./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt  
./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt  
./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt  
./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt  
./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt  
./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt  
./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt  
./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt  
./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt  
./UCI HAR Dataset/train/subject_train.txt  
./UCI HAR Dataset/train/X_train.txt  
./UCI HAR Dataset/train/y_train.txt  
  
In this condition, just source the script:  
`> source("./run_analysis.R")`
  
After the command is completed a new file (*tydidf.csv*) appear in the working directory with the tidy dataset. To load the CSV use the command:  
`> data <- read.table("tidydf.csv", header = TRUE)`  
  
The script also create a new dataframe named tidydf that holds the tidy dataset. To view the dataframe use the command:  
`> View(tidydf)`  
  
WARNING: the script runs in the current environment thus it could overwrite existing variables.
