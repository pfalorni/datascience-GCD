# Operative instructions
===============
In the following sections are shown some details about how to use the script and about how it is built.
## How to use the script
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

## How the script works  
The script is subdivided into four sections:  
* PROLOG
* MAIN
* TUNING
* EPILOG
   
In the **PROLOG** phase subsidiary data is loaded and formatted. Files involved are *features.txt* and *activity_labels.txt*. Here is also formed the logical array *fnamesidx* that identifies interesting features - i.e. those that contains the word **mean()** or **std()** in their name.  
  
In the **MAIN** phase the bulk data is loaded and formatted. Files involved in this phase are *subject_train.txt*, *y_train.txt*, *X_train.txt*, *subject_test.txt*, *y_test.txt*, *X_test.txt*. Data is properly loaded and merged to get activity names, columns are chosen and reordered for a better readability. The output of this phase is one single dataframe named *maindf*.  
  
The **TUNING** phase is the core of the script since here the *maindf* dataset is converted into a tidy dataset. At this stage there are only two id variables, *Participant.Code* and *Activity.Name*. The dataset is grouped and summarised for the mean value of non-id variables, as requested by the exercise. Non-id variables are melted into *Measurement* and *Mean* columns. The column *Measurement* is splitted into its components to better show which are the dimensions of the experiment. Finally some labels are redefined for a better readability and the dataset is sorted by the subsequent dimensions.  
  
The **EPILOG** phase simply output the resulting dataset to a external file.
