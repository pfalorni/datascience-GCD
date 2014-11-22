# Load needed libraries
library(dplyr)
library(reshape2)

#---- PROLOG PHASE: LOAD AND FORMAT SUPPORT INFORMATION ----#

# Read and normalize names of features to ease analysis
fnames <- read.table("UCI HAR Dataset/features.txt",
                     header=F, sep="")[, 2]
fnames <- sub("BodyBody","Body",fnames)
fnames <- sub("^t","t.",fnames)
fnames <- sub("^f","f.",fnames)
fnames <- sub("Acc",".Acc.",fnames)
fnames <- sub("Gyro",".Gyro.",fnames)
fnames <- sub("-mean","mean", fnames)
fnames <- sub("-std","std", fnames)
fnames <- sub("-",".", fnames)

# Get the index of interesting (those about mean and std) features
fnamesidx <-   grepl("mean().",fnames, fixed=TRUE) |
               grepl("std().",fnames, fixed=TRUE)

fnamesnum <- sum(fnamesidx)

# Read the names of activities
aanag <- read.table("UCI HAR Dataset/activity_labels.txt",
                     header=F, sep="")
names(aanag) <- c("Activity.Code", "Activity.Name")



#---- MAIN PHASE: LOAD AND FORMAT DATASETS ----#

# Load and reshape TRAINING dataset
traindf <-
     cbind( # Bind together participant code, activity code and feature set
          read.table( # Read participant code
               "UCI HAR Dataset/train/subject_train.txt",
               header=F, sep=""
          ),
          read.table( # Read activity codes of observations
               "UCI HAR Dataset/train/y_train.txt",
               header=F, sep=""
          ),
          read.table( # Read training dataset
               "UCI HAR Dataset/train/X_train.txt",
               header=F, sep=""
          )[, fnamesidx]
     )
names(traindf) <- c("Participant.Code","Activity.Code", fnames[fnamesidx])


# Load and reshape TEST dataset
testdf <-
     cbind( # Bind together participant code, activity code and feature set
          read.table( # Read participant code
               "UCI HAR Dataset/test/subject_test.txt",
               header=F, sep=""
          ),
          read.table( # Read activity codes of observations
               "UCI HAR Dataset/test/y_test.txt",
               header=F, sep=""
          ),
          read.table( # Read test dataset
               "UCI HAR Dataset/test/X_test.txt",
               header=F, sep=""
          )[, fnamesidx]
     )
names(testdf) <- c("Participant.Code","Activity.Code", fnames[fnamesidx])


# Build up main dataset
maindf <-
     merge( # Put activity name for activity code
          aanag,
          rbind( # The full, raw dataset
               testdf,
               traindf
          )
     )[, c(3,2, 4:(fnamesnum+4-1))]

# Free unuseful memory space
rm(testdf, traindf, aanag, fnames, fnamesidx, fnamesnum)


#---- TUNING PHASE: CONVERGE TOWARD A TIDY DATASET ----#

# Build messy dataset that summarise and melt by id variables
messydf <- group_by(maindf, Participant.Code, Activity.Name) %>%
     summarise_each(funs(mean)) %>%
     melt(1:2, variable.name="Measurement",value.name="Mean") %>%
     as.data.frame()

rm(maindf)

# Separate information grouped in Measurement column to form a TIDY dataset
tidydf <-
     cbind(
          colsplit(
               messydf$Measurement,
               "[.]",
               c("Domain","Type","Sensor","Function","Axis")
          ),
          messydf
     )[, c(6,7,1,2,3,4,5,9)]

# Enhance readability with clever labels and arrangement
tidydf <-
     tidydf %>%
     mutate(
          Domain=factor(ifelse(Domain=="t","Time","Frequency")),
          Sensor=factor(ifelse(Sensor=="Acc","Accelerometer","Gyroscope")),
          Type=factor(Type),
          Function=factor(Function),
          Axis=factor(Axis)
     ) %>%
     arrange(
          Participant.Code,
          Activity.Name,
          Domain,
          Type,
          Sensor,
          Function,
          Axis)

rm(messydf)


#---- EPILOG PHASE: OUTPUT RESULT ----#

# Output the tidy dataset to filesystem
write.table(tidydf, file="tidydf.csv", row.name=FALSE)


