# Water_Potability_Classification
## Overview
This project aim is to determine the potability of water based on different readings of different quality metrics for 3276 samples of water, and shows the potability of each sample.

Water is a key element for life, many regions around the world suffer from clean water scarcity, which makes water potability one of the most crucial topics on earth. The aim of this study is to determine wether we could develop a machine learning model that could determine if the water is potable based on different characteristic readings.
### Background
The data used for this study is from a public dataset published on Kaggle.com, the dataset can be found in the following link: https://www.kaggle.com/adityakadiwal/water-potability
#### Sample potability distribution:

The selected sample has a realtively balanced sample distribution that can be seen in the following chart:

![Fig1](https://user-images.githubusercontent.com/79733383/125202932-06858800-e244-11eb-982e-cb2c99ceb9eb.png)

This means that with little work, the results will not be skewed, as the samples used to train the machine learning model are balanced.

#### Sample CHaracterestics distribution:

The Selected dataset studies 9 diffeerent measured characterestics of the sample, the characterestics & their distributions are as follows:

1. PH Value:
PH Level is an indicaion of the acidity or alkalinity of the water. The PH level column in our dataset has 2785 valid values, the following histogram shows the distribution of the values:

![Fig2](https://user-images.githubusercontent.com/79733383/125203422-46e60580-e246-11eb-9ef4-e2eed4778e06.png)

The figure shows that the values distribution is relatively uniform. However, the number of valid values is less than the samples collected, which means we have some NaN values in this column.

2. Hardness:
Hardness value is an indication of the amount of dissolved calcium & magnesium in the water. The Hardness column in our dataset has 3276 entries, their distribution can be seen in the following histogram:

![Fig3](https://user-images.githubusercontent.com/79733383/125203668-6598cc00-e247-11eb-97b3-f05a8e186e71.png)

As shown in the graph, the distribution has a relatively high spike in the middle, but is almost uniform apart from this. Also the number of valid entries equals the number of collected samples, which means no values need to be dropped based on hardness level.



