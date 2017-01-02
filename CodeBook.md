# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* First, data frame in test and train groups are merged using the `rbind()` function. Then, we address those files having the same number of columns and referring to the same entities.
* Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from `features.txt`.
* As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* On the whole dataset, change the name of variables; form overall data set(final_data_set.csv)
* Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 combinations). The output file is called `file2.csv' in the repo.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `allx`, `ally` and `allsubject` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `overall` merges `allx`, `ally` and `allsubject` in a big dataset.
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.csv` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
