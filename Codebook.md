# Codebook
This is the codebook for the data contained into the file *tidydf.csv*, as requested by the assignment for the final project of [Getting and Cleaning Data](https://class.coursera.org/getdata-009/)
## General notes
The information provided in this codebook is an addendum to what is already been tracked by the original authors, Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto, on the [UCI web site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and in the descriptive text files delivered with the dataset - i.e. *README.txt* and *features_info.txt*.    

The tidy dataset is contained into the file *tidydf.csv*, a CSV file that can be read by using the information specified in the *README.md* file of this repository.  
  
The variables of the tidy dataset are:  
`Participant.Code | Activity.Name | Domain | Type | Sensor | Function | Axis | Mean`  

The variables from *Domain* to *Axis* are a breakdown of the names of the features of the original dataset chosen for the analysis - i.e. those with a function *mean* or *std* applied to an axis - that is:  
 [1] tBodyAcc-mean()-X      tBodyAcc-mean()-Y      tBodyAcc-mean()-Z     
 [4] tBodyAcc-std()-X       tBodyAcc-std()-Y       tBodyAcc-std()-Z      
 [7] tGravityAcc-mean()-X   tGravityAcc-mean()-Y   tGravityAcc-mean()-Z  
[10] tGravityAcc-std()-X    tGravityAcc-std()-Y    tGravityAcc-std()-Z   
[13] tBodyAccJerk-mean()-X  tBodyAccJerk-mean()-Y  tBodyAccJerk-mean()-Z  
[16] tBodyAccJerk-std()-X   tBodyAccJerk-std()-Y   tBodyAccJerk-std()-Z  
[19] tBodyGyro-mean()-X     tBodyGyro-mean()-Y     tBodyGyro-mean()-Z    
[22] tBodyGyro-std()-X      tBodyGyro-std()-Y      tBodyGyro-std()-Z     
[25] tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z  
[28] tBodyGyroJerk-std()-X  tBodyGyroJerk-std()-Y  tBodyGyroJerk-std()-Z  
[31] fBodyAcc-mean()-X      fBodyAcc-mean()-Y      fBodyAcc-mean()-Z     
[34] fBodyAcc-std()-X       fBodyAcc-std()-Y       fBodyAcc-std()-Z      
[37] fBodyAccJerk-mean()-X  fBodyAccJerk-mean()-Y  fBodyAccJerk-mean()-Z  
[40] fBodyAccJerk-std()-X   fBodyAccJerk-std()-Y   fBodyAccJerk-std()-Z  
[43] fBodyGyro-mean()-X     fBodyGyro-mean()-Y     fBodyGyro-mean()-Z    
[46] fBodyGyro-std()-X      fBodyGyro-std()-Y      fBodyGyro-std()-Z     
  
In particular:  
+ The first letter of the name (*t* or *f*), indicating the domain of the values, has been converted to *Time* and *Frequency*.
+ The words *Body* pr *Gravity* have been extracted as an indication of what the value is referring to.
+ The words *Acc* and *Gyro*, indicating the sensor used to get the measure, have been converted to *Accelerometer* and *Gyroscope*.
+ The function names *mean()*, *std()*, *Jermmean()* and *Jerkstd()* have been extracted.
+ The name of the axis, *X*, *Y* or *Z*, have been extracted.  

The experiment underlying the original datsaset is a fully crossed design with respect to the variables *Participant.Code* and *Activity.Name* while the other id variables are only partially crossed.
  
The following apply to the tidy dataset:  
* All variables but the last (*Mean*) are id variables, thus their values are fixed by design.
* The first two variables, *Participant.Code* and *Activity.Name*, are derived from the original dataset without any change.
* The variables *Domain*, *Type*, *Sensor*, *Function* and *Axis* are a breakdown of the names of the features from the original dataset.
* As requested by the assignment, only features related to *mean* or *std* are retained in the tidy dataset.
* The observations of the variable *Mean* are the average of the feature broken down into *Domain*, *Type*, *Sensor*, *Function* and *Axis*.

## Additional considerations
Despite the fact that the assignment requested a single, tidy dataset, it can be noticed that the information could be split into more datasets, like:  
+ `Participant.Code | Activity.Name | Setup.Code | Measure.Code | Mean`
+ `Setup.Code | Sensor | Axis`
+ `Measure.Code | Domain | Type | Function`  

Furthermore, the *Functions* of kind *Jerkmean()* and *Jerkstd()* could be avoided because they can be evaluated from other variables.  
A detailed description of these considerations is outside the perimeter of the assignment thus it will not be provided here.

## Description of variables
**Participant.Code** A unique identifier for the involved subject. There are 30 subjects in the experiment.  
**Activity.Name** The name of the activity performed by the subject. A total of 6 activities have been performed by all subjects: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  
**Domain** Either the factor *Time* or *Frequency* (originally the letter "t" or "f" at the beginning of the feature name), indicating the domain of the values of the variable *Mean*.  
**Type** The factor *Body*, indicating that the value of *Mean* is referred to the body of the subject, or *Gravity*, indicating that the value of *Mean* is referred to the estimate of the gravity vector.  
**Sensor** Indicate which sensor performed the measure, *Accelerometer* or *Gyroscope*.  
**Function** One of the two functions selected, *mean()*, *std()*, *Jerkmean()* or *Jerkstd()*.  
**Axis** The name of the axis of the triaxial sensor, *X*, *Y* or *Z*.  
**Mean** The value of the mean (along time) when the other variables are grouped.  
