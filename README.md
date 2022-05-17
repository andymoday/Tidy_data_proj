# Tidy_data_proj

This project involves taking the raw data from the 'UCI HAR Dataset' and 
producing a smaller 'tidied' dataset looking at the average values of the measured variables involving mean and standard deviation.

The full contents of the original data are included in the 'readme.txt' in the
'UCI HAR Dataset' folder. The analysis script runs as follows - 

- Reads the required data into R using the read.table("FILE", head = FALSE) command (datasets, subjects, and labels for both the test and training data, as well as a key to the activities and measured variables).

- Adds the column headings (variables) to the datasets and adds descriptive variable names to the Activity and Subject data

- Changes the Activity codes into descriptive data

- Combines the Activity, Subject, and data columns into one dataset for testing and one for training

- Combines the test and training data

- Selects the columns representing the means and standard deviations of the measurement groups

- Sets the column order to display the data in

- Creates a tidied dataset showing the average value for each of the variables shown, grouped by Activity and Subject