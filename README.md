# Water_Potability_Classification
## Overview
This project aim is to determine the potability of water based on different readings of different quality metrics for different samples of water from stations across India.

Water is a key element for life, many regions around the world suffer from clean water scarcity, which makes water potability one of the most crucial topics on earth. The aim of this study is to determine wether we could develop a machine learning model that could determine the water class & its potability based on different characteristic readings.
### Background
The data used for this study is collected form diffrent sources:
1. Two public datasets published on Kaggle.com. The data set shows water metrics for different stations in India. the dataset can be found in the following link: https://www.kaggle.com/anbarivan/indian-water-quality-data & https://www.kaggle.com/venkatramakrishnan/india-water-quality-data
2. An indian govermental website showing the water classification metrics. The link is as follows:  https://vikaspedia.in/energy/policy-support/environment-1/water/water-quality-and-standards
3. The official Indian Governmental website showing the state boundaries & the district with the number of stations. The link is as follows: https://indiawris.gov.in/wris/#/RiverMonitoring

#### Data preprocessing & cleaning

The public datasets used in this study contain the metrics of the sampled water from different stations. To be able to train & test the Machine learning models, we used the classifications to creat additional tables showing the water class & the potability of each sample. This was achieved using pandas & Python.

The datasets also contained a lot of Null data, duplicated stations & numeric values saved as strings. data cleaning was also done in Pandas.

#### Database creation & adjudtment

We used SQL PostgreSQL to create & store our database & connect it to Pandas to create the Machine learning model. We needed joined tables to consolidate the tables from different sources as well as the new calculated fields showing water classes & potability. We joined different tables & created new tables separating numeric data from the string location data. The ERD  showing primary & secoondary keys was also created as well as the links needed to interface between the database & the Machine learning models

### Machine learning models

Our main purpose from this study is to develop & train a machine learning model that can determine weather a water sample is potable or not based on the readings obtained. We also want to study the impact each of the metrics have on the potability of the water, & which metrics have the highest & the lowest impacts on water potability. 

To obtain this, our plan is to start with a linear regression model (Supervised machine learning), since the data output is a binary classification of potable vs unpottable.

## Communications protocols:



