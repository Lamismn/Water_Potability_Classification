# Water_Potability_Classification
## Overview
This project's aim is to determine the potability of water based on different readings of different quality metrics for different samples of water from stations across India.

Water is a key element for life. Many regions around the world suffer from clean water scarcity, which makes water potability one of the most crucial topics on Earth. The aim of this study is to determine whether we could develop a machine learning model that could determine the water class and its potability based on different characteristic readings.
### Background
The data used for this study is collected from different sources:
1. Two public datasets published on Kaggle. The dataset shows water metrics for different stations in India. They can be found in the following links: https://www.kaggle.com/anbarivan/indian-water-quality-data & https://www.kaggle.com/venkatramakrishnan/india-water-quality-data
2. An Indian governmental website showing the water classification metrics. The link is as follows:  https://vikaspedia.in/energy/policy-support/environment-1/water/water-quality-and-standards
3. The official Indian Governmental website showing the state boundaries & the district with the number of stations. The link is as follows: https://indiawris.gov.in/wris/#/RiverMonitoring

## Analysis

### Data Preprocessing & Cleaning

The public datasets used in this study contain the metrics of the sampled water from different stations. To be able to train and test the machine learning models, we used the classifications to create additional tables showing the water class & the potability of each sample. Classification was based on metrics in the link above. If a station's water quality is graded as A, B, or C, that station's water is potable; otherwise, it is not potable. This was achieved using Pandas & Python. The datasets also contained a lot of null values, duplicated stations, and numeric values saved as strings. Data cleaning was also done in Pandas.

### Database Creation & Adjustment

We used SQL via PostgreSQL to create and store our database and then connected it to Pandas to create the machine learning model. We needed joined tables to consolidate the tables from different sources as well as the new calculated fields showing water classes & potability. We joined different tables & created new tables separating numeric data from the string location data. The ERD showing primary and secondary keys was also created as well as the links needed to interface between the database & the Machine learning models.

### Machine Learning Models

We decided to use two different methods to create Machine learning models for our study:
1. Logistic regression supervised machine learning, which will classify water to potable and non-potable, based on the tables created from the database
2. Unsupervised Clustering & K-Means, which will classify the water samples into one of six grades (or clusters), based on the tables created from the database using the Indian Government guidelines

#### Logistic Regression

Taken from PostgreSQL, a query was done to get a table with a classification for potability so it could be used as the DataFrame for this model. Any station that has the qualifications for water to be drinkable is given values of either 0 or 1 — 0 being not potable and 1 otherwise. Inputs are columns that have float or integer values that isn't the potability column (station code is not included, as it is considered a string in this case). The target is the potability column. The data was split into testing and training data and then scaled. A distribution of potable versus non-potable water stations can be seen below:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/water_potability_pie.png?raw=true)

Afterwards, logistic regression is applied. Once the model made predictions, its accuracy is listed at 84.7%, which is fairly accurate. The confusion matrix also shows the model is capable of predicting potability:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/logistic_regression_confusion_matrix.PNG?raw=true)

However, using ensemble learning via random forests, the accuracy score spiked to 99.4%. In the confusion matrix, there is only one false positive and one false negative, as shown below:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/random_forest_confusion_matrix.PNG?raw=true)

#### K-Means Clustering

The table used, taken from PostgreSQL, was similar to the one used in the above model, but a column with a grading system for water replaced the potability column. Displaying a table, with the ability to sort, it was obvious there were very blatant outliers in the total_coli column, which could heavily affect how clustering would be done, even with scaling. Thus, they were removed from the DataFrame. 

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/total_coli_outliers.PNG?raw=true)

The image below shows a distribution of each water grade:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/water_grade_pie.png?raw=true)

Next, the DataFrame was sorted by grade, and then the Principal Component Analysis was implemented. 11 principal components were needed, as the total variance would be at least 0.95. A clustered DataFrame was created. Since K-Means only identifies clusters and has nothing to do with labelling said clusters, some modifications were made. First, a check to see if all values in each class also belong to the same grade in their respective class. Once that was the case, a pseudo-confusion matrix was created, mainly showing that the model was able to classify each cluster, as shown below:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/k_means_confusion_matrix.PNG?raw=true)

## Presentation

We created a Google Slides presentation showing the description of the analysis & the required we want to achieve. The link to the presentation is as follows:
https://docs.google.com/presentation/d/1x4JIKwRCSaF6iWjVVwnCr1n2wZSMgn557UluwI6Th5Q/edit?usp=sharing

### Dashboard

We created our initial Dashboard, Weused Tableau public to create our storyboard & add interactive maps & charts. The link to our Dahsboard is as follows:
https://public.tableau.com/app/profile/lamis3656/viz/WaterPotablitydahsboard/WaterpotabilityinIndia?publish=yes
