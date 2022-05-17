---
title: "CodeBook"
author: "Andy Morris"
date: '2022-05-17'
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
Data Set Information:

The original experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity data were captured at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
Further information is included in the 'readme.txt' in the UCI HAR Dataset.



The variables (columns) in the tidied data are :

- The Activity undertaken
- The subject (volunteer)
- Additional variables are labelled as per the original measurements - each one relates to a mean or standard deviation (std) for that measurement in the original data

Each row displays the average values of each measurement for that Activity/Subject pairing.




The analysis script 'run_analysis.R' works as follows:

- Reads the required data into R using the read.table("FILE", head = FALSE) command (datasets, subjects, and labels for both the test and training data, as well as a key to the activities and measured variables).

- Adds the column headings (variables) to the datasets and adds descriptive variable names to the Activity and Subject data

- Changes the Activity codes into descriptive data

- Combines the Activity, Subject, and data columns into one dataset for testing and one for training

- Combines the test and training data

- Selects the columns representing the means and standard deviations of the measurement groups

- Sets the column order to display the data in

- Creates a tidied dataset showing the average value for each of the variables shown, grouped by Activity and Subject
