# Water_Potability_Classification
## Overview
This project aim is to determine the potability of water based on different readings of different quality metrics for different samples of water from stations across India.

Water is a key element for life, many regions around the world suffer from clean water scarcity, which makes water potability one of the most crucial topics on earth. The aim of this study is to determine wether we could develop a machine learning model that could determine the water class & its potability based on different characteristic readings.
### Background
The data used for this study is collected form diffrent sources:
1. Two public datasets published on Kaggle.com. The data set shows water metrics for different stations in India. the dataset can be found in the following link: https://www.kaggle.com/anbarivan/indian-water-quality-data & https://www.kaggle.com/venkatramakrishnan/india-water-quality-data
2. An indian govermental website showing the water classification metrics. The link is as follows:  https://vikaspedia.in/energy/policy-support/environment-1/water/water-quality-and-standards
3. The official Indian Governmental website showing the state boundaries & the district with the number of stations. The link is as follows: https://indiawris.gov.in/wris/#/RiverMonitoring

## Analysis

### Data preprocessing & cleaning

The public datasets used in this study contain the metrics of the sampled water from different stations. To be able to train & test the Machine learning models, we used the classifications to creat additional tables showing the water class & the potability of each sample. This was achieved using pandas & Python.

The datasets also contained a lot of Null data, duplicated stations & numeric values saved as strings. data cleaning was also done in Pandas.

### Database creation & adjustment

We used SQL PostgreSQL to create & store our database & connect it to Pandas to create the Machine learning model. We needed joined tables to consolidate the tables from different sources as well as the new calculated fields showing water classes & potability. We joined different tables & created new tables separating numeric data from the string location data. The ERD  showing primary & secoondary keys was also created as well as the links needed to interface between the database & the Machine learning models

### Machine learning models

We decided to use two different methods to create Machine learning models for our study:
1. Linear regression supervised machine learning, which will classify water to potab;e & non-potable, based on the tables created in the database
2. Unsupervised Clustering & Kmeans, which will classify the water samples into one of six grades (or clusters), based on the tables created in the database using the Indian Government guidelines.

## Presentation

We created a Google slides presentation showing the description of the analysis & the required we want to achieve. The link to the presentation is as follows:

https://docs.google.com/presentation/d/1x4JIKwRCSaF6iWjVVwnCr1n2wZSMgn557UluwI6Th5Q/edit?usp=sharing

### Dashboard

We created a preliminary blueprint for our Dashboard, this can be found in the last four pages of the Google slides. We plan to use Tableau public to create our storyboard & add interactive maps.
https://docs.google.com/presentation/d/1x4JIKwRCSaF6iWjVVwnCr1n2wZSMgn557UluwI6Th5Q/edit?usp=sharing



