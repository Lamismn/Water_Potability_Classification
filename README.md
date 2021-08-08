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
The datasets also were not accurate when it came to station locations, Latitudes & longitudes of the stations were missing, and the districts & states had a lot of spelling mistakes. To be able to fix that & make sure our data is accurate, we referred to some websites (governmental & private) showing the state & district distribution in India & used Google maps to find the coordinates. The links to those websites are as follows:

https://indiawris.gov.in/wris/#/RiverMonitoring

http://districts.nic.in/

### Database Creation & Adjustment

We used SQL via PostgreSQL to create and store our database and then connected it to Pandas to create the machine learning model. We needed joined tables to consolidate the tables from different sources as well as the new calculated fields showing water classes & potability. We joined different tables & created new tables separating numeric data from the string location data. The ERD showing primary and secondary keys was also created as well as the links needed to interface between the database & the Machine learning models.

### Machine Learning Models

We decided to use two different methods to create Machine learning models for our study:
1. Logistic regression supervised machine learning, which will classify water to potable and non-potable, based on the tables created from the database
2. Unsupervised Clustering & K-Means, which will classify the water samples into one of six grades (or clusters), based on the tables created from the database using the Indian Government guidelines

#### Logistic Regression

Taken from PostgreSQL, a query was done to get a table with a classification for potability so it could be used as the DataFrame for this model. Any station that has the qualifications for water to be drinkable is given values of either 0 or 1 — 0 being not potable and 1 otherwise. Inputs are columns that have float or integer values that isn't the potability column (station code is not included, as it is considered a string in this case). The target is the potability column. The data was split into testing and training data and then scaled. A distribution of potable versus non-potable water stations can be seen below:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/water_potability_pie.png?raw=true)

A small note here: This displays a 55.9% to 44.1%, potable to not potable water distribution. Although over 50% of the water is potable, when looking at what this actually means, we find a very disparing fact. 44.1% of all water in india is undrinkable. Taking into consideration that as of 2019, India's population is 1.366 billion, this means that an estimated 602 million people are without reliable access to safe, clean, drinking water.

Afterwards, logistic regression is applied. Once the model made predictions, its accuracy is listed at 84.7%, which is fairly accurate. The confusion matrix also shows the model is capable of predicting potability:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/logistic_regression_confusion_matrix.PNG?raw=true)

However, using ensemble learning via random forests, the accuracy score spiked to 99.4%. In the confusion matrix, there is only one false positive and one false negative, as shown below:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/random_forest_confusion_matrix.PNG?raw=true)

#### K-Means Clustering

The table used, taken from PostgreSQL, was similar to the one used in the above model, but a column with a grading system for water replaced the potability column. Displaying a table, with the ability to sort, it was obvious there were very blatant outliers in the total_coli column, which could heavily affect how clustering would be done, even with scaling. Thus, they were removed from the DataFrame. 

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/total_coli_outliers.PNG?raw=true)

The image below shows a distribution of each water grade:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/water_grade_pie.png?raw=true)

A small note here: Taking a step back to look at the whole picture, this breakdown defines the classes of water contained within India, and how much of all water within the country is of each grade. 6.3% of the water is A grade, safe to drink without filtering. This point is important, due to India's historic poverty within some regions. Applying this 6.3% to India's population as we did before, this results in an estimated 86 million people having access to clean, potable water, reliably. 86 million out of 1.366 billion is quite the discrepancy, showing a true light on their situation.

Next, the DataFrame was sorted by grade, and then the Principal Component Analysis was implemented. 11 principal components were needed, as the total variance would be at least 0.95. A clustered DataFrame was created. Since K-Means only identifies clusters and has nothing to do with labelling said clusters, some modifications were made. First, a check to see if all values in each class also belong to the same grade in their respective class. Once that was the case, a pseudo-confusion matrix was created, mainly showing that the model was able to classify each cluster, as shown below:

![alt_text](https://github.com/Lamismn/Water_Potability_Classification/blob/main/Analysis/Images/k_means_confusion_matrix.PNG?raw=true)


## Further analysis:

### Future Analysis:

Our study showed a lot of variation in the water metrics across India, it also confirmed the information we had regarding Water quality problems & limited access to clean water. We were able to create machine learning models that could predict the water grade & potability based on the metrics of any sample, and they had a relatively good accuracy. If we had more time though, we would have extended our research in different ways:

1. Include coordinates in the Machine learning model, and see if we can create a model that could predict the grade according to coordinates, with an acceptable accuracy
2. Indclude some of the Null & NaN values that we deopped in our pre-processing phase, by checking other data sources for their values, or predicting them according to close stations values,
3. Get datasets for monthly water samples to check if & how the time of the year/season affects water quality
4. Create a deep learning model to predict grade according to different metrics, including location.

### Alternative approach:

While conducting our study and adding the location data, we noticed that several rivers in India pass through different states, and that some states & districts haf=ve more than one river passing through them. We realized that an alternative approach to our study would be categorizing data according to rivers rather that just locations. Studying water metrics of a certain river within a specific area could give more comprehensive and accurate results than just considering the location.

## Presentation

We created a Google Slides presentation showing the description of the analysis & the required we want to achieve. The link to the presentation is as follows:
https://docs.google.com/presentation/d/1x4JIKwRCSaF6iWjVVwnCr1n2wZSMgn557UluwI6Th5Q/edit?usp=sharing

We also created a dashboard summarizing our findings as well as explaining the Machine learning models we created & their outputs. The dashboard also shows an inteactive map of India showing a pop-up tooltip with the state summary for each of out studied states. We also took a deeper look into the Coliform distribution across states & districts, this is shown on two interactive bubble charts. The link to our Dahsboard is as follows:
https://public.tableau.com/app/profile/lamis3656/viz/WaterPotablitydahsboard/WaterpotabilityinIndia?publish=yes

## Communication protocols:

To be able to achieve the outputs we wanted, We used different tools to communicate across the team, those tools are as follows:

1. A shared Slack Channel
2. A shared Github repository where each member has a branch to add their work
3. During class, we communicate in our breakout room (Zoom)
4. A separate Zoom meeting we join on Sunday to finalize before submission
5. We shared access to the Google slides, where we can all add/edit the presentation portion of the work
