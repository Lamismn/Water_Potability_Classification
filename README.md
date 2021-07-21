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

3. Solids:
The Solids column in the datase indicates the total dissolved solids in the water sample. also known as the TDS. The following hsitogram shows the readings distribution:

![Fig4](https://user-images.githubusercontent.com/79733383/125203926-c543a700-e248-11eb-8f61-ce03e4876d67.png)

The chart shows that the values are slightly skewed to the left, which means we will need to study the values more before our analysis. The column has 3276 valid values, which means that no cells need to be dropped.

4. Chloramines, Sulphates, Organoc carbons & Trihalomethanes:

These columns show the presence of their titular salts & chemicals in the water samples. Their distributions can be shown in the following figures:

![Fig5](https://user-images.githubusercontent.com/79733383/125204370-ec02dd00-e24a-11eb-9ba6-8538e1760033.png)
![Fig6](https://user-images.githubusercontent.com/79733383/125204374-f1602780-e24a-11eb-99c9-c4e0b66f644b.png)
![Fig7](https://user-images.githubusercontent.com/79733383/125204378-f91fcc00-e24a-11eb-8de9-a505386df74c.png)
![Fig8](https://user-images.githubusercontent.com/79733383/125204383-fde48000-e24a-11eb-93ec-da0114951c43.png)

Only the Sulfate & the Trihalomethanes columns have missing cells, they have 2495 & 3114 valid readings respectively.

5. Conductivity:

Pure water is not an electric conductor, which is why a samples conductivity is an indicator for the amount of dissolved solids in the sample. Our dataset's conductivity column distribution can be seen in the following histogram:

![Fig9](https://user-images.githubusercontent.com/79733383/125204654-4c464e80-e24c-11eb-89f4-4ce40fc08926.png)

This column has 3276 valid entries.

6. Turbidity:

Water turbidity is another indicator of the dissolved solids in water. Ouur dataset has 3276 enteries for the turbidity measurements, their distribution are shown in the following histogram:

![Fig10](https://user-images.githubusercontent.com/79733383/125204783-f1612700-e24c-11eb-8660-9cf1753b3f50.png)

## Purpose & Initial plan:
Our main purpose from this study is to develop & train a machine learning model that can determine weather a water sample is potable or not based on the readings obtained. We also want to study the impact each of the metrics have on the potability of the water, & which metrics have the highest & the lowest impacts on water potability. 

To obtain this, our plan is to start with a linear regression model (Supervised machine learning), since the data output is a binary classification of potable vs unpottable.

## Communications protocols:



