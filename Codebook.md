# Codebook
This is the codebook for the data contained into the file *tidydf.csv*, as requested by the exercise for the final project of [Getting and Cleaning Data](https://class.coursera.org/getdata-009/)
## General notes
The information provided in this codebook is an addendum to what is already been tracked by the original authors, Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto, on the [UCI web site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and into the descriptive text files delivered with the dataset - i.e. *README.txt* and *features_info.txt*.  
The tidy dataset is contained into the file *tidydf.csv*, a CSV file that can be read by using the information specified in the *README.md* file of this repository.  
  
The variables of the tidy dataset are:  
`Participant.Code Activity.Name Domain Type Sensor Function Axis Mean`  
The variables from *Domain* to *Axis* are a breakdown of the names of the features of the original dataset chosen for the analysis - i.e. those with a function *mean* or *std* applied to an axis - that is:  
 [1] "t.Body.Acc.mean().X"      "t.Body.Acc.mean().Y"     
 [3] "t.Body.Acc.mean().Z"      "t.Body.Acc.std().X"      
 [5] "t.Body.Acc.std().Y"       "t.Body.Acc.std().Z"      
 [7] "t.Gravity.Acc.mean().X"   "t.Gravity.Acc.mean().Y"  
 [9] "t.Gravity.Acc.mean().Z"   "t.Gravity.Acc.std().X"   
[11] "t.Gravity.Acc.std().Y"    "t.Gravity.Acc.std().Z"   
[13] "t.Body.Acc.Jerkmean().X"  "t.Body.Acc.Jerkmean().Y"  
[15] "t.Body.Acc.Jerkmean().Z"  "t.Body.Acc.Jerkstd().X"  
[17] "t.Body.Acc.Jerkstd().Y"   "t.Body.Acc.Jerkstd().Z"  
[19] "t.Body.Gyro.mean().X"     "t.Body.Gyro.mean().Y"    
[21] "t.Body.Gyro.mean().Z"     "t.Body.Gyro.std().X"     
[23] "t.Body.Gyro.std().Y"      "t.Body.Gyro.std().Z"     
[25] "t.Body.Gyro.Jerkmean().X" "t.Body.Gyro.Jerkmean().Y"  
[27] "t.Body.Gyro.Jerkmean().Z" "t.Body.Gyro.Jerkstd().X"  
[29] "t.Body.Gyro.Jerkstd().Y"  "t.Body.Gyro.Jerkstd().Z"  
[31] "f.Body.Acc.mean().X"      "f.Body.Acc.mean().Y"     
[33] "f.Body.Acc.mean().Z"      "f.Body.Acc.std().X"      
[35] "f.Body.Acc.std().Y"       "f.Body.Acc.std().Z"      
[37] "f.Body.Acc.Jerkmean().X"  "f.Body.Acc.Jerkmean().Y"  
[39] "f.Body.Acc.Jerkmean().Z"  "f.Body.Acc.Jerkstd().X"   
[41] "f.Body.Acc.Jerkstd().Y"   "f.Body.Acc.Jerkstd().Z"   
[43] "f.Body.Gyro.mean().X"     "f.Body.Gyro.mean().Y"    
[45] "f.Body.Gyro.mean().Z"     "f.Body.Gyro.std().X"     
[47] "f.Body.Gyro.std().Y"      "f.Body.Gyro.std().Z"  
  
The experiment is a fully crossed design with respect to the variables *Participant.Code* and *Activity.Name* while the other id variables are only partially crossed.
  
The following apply to the tidy dataset:  
* All variables but the last (*Mean*) are id variables, thus their values are stated by design.
* The first two variables, *Participant.Code* and *Activity.Name*, are derived from the original dataset without any change.
* The variables *Domain*, *Type*, *Sensor*, *Function* and *Axis* are a breakdown of the names of the features of the original dataset.
* As requested by the exercise, only features related to *mean* or *std* are retained in the tidy dataset.
* The observations of the variable *Mean* is the average of the feature corresponding to the breakdown into *Domain*, *Type*, *Sensor*, *Function* and *Axis*.

## Description of variables
**Participant.Code** A unique identifier for the involved subject. There are 30 subjects in the experiment.  
**Activity.Name** The name of the activity performed by the subject. A total of 6 activities have been performed by all subjects: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  
**Domain** Either the factor *Time* or *Frequency*, indicating the domain of the variable *Mean*.  
**Type** The factor *Body*, indicating that the value of *Mean* is referred to the body of the subject, or *Gravity*, indicating that the value of *Mean* is referred to the estimate of the gravity vector.  
**Sensor** Indicate which sensor performed the measure, *Accelerometer* or *Gyroscope*.  
**Function** One of the two functions selected, *mean()*, *std()*, *Jerkmean()* or *Jerkstd()*.  
**Axis** The name of the axis of the triaxial sensor, *X*, *Y* or *Z*.  
**Mean** The value of the mean (along time) when the other variables are grouped.  
