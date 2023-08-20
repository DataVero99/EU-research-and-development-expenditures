# Regional data analysis - R&D expenditures in the EU in the years 2011 and 2019


## Introduction

For many years, economists have been examining the technology market. Numerous analyses indicate that in the future, Europe, alongside the United States and Japan, will be the third most technologically advanced economy in the world. The European Union pursues a highly pro-innovative policy by creating numerous technological support programs for businesses and scientific institutions. Therefore, conducting research and analyses in this field is of great importance.
 
Research Objective: Comparative analysis of R&D expenditures in the years 2011 and 2019, using the component structure of spatial economic processes.
 
Specific Objective: Determining the centroids and weighted centroids for the variable R&D expenditures in 2011 and 2019.
 
Research Hypothesis 1: The significance of Moran's statistic for European Union countries improved in 2019 compared to 2011.
 
Research Hypothesis 2: The values of the examined feature for European Union countries, according to the join-count statistic, are higher in 2019 than in 2011.
 
The European Union undertakes numerous analyses on technology in Europe. However, most of these are simple data analyses without the use of specialized tests or statistical methods. It is valuable to address this topic and apply the approach presented below.


## 1. Analysis of central tendency and dispersion of phenomena in space.

For the variable describing R&D expenditures in the year 2011 among the EU member states, a centroid and weighted centroid were determined, along with the range based on standard distance and weighted standard distance. Distances from the centroid and weighted centroid were calculated for both the European Union as a whole and individual member states.

Study of variable X9 - R&D Expenditures for the year 2011
![Table1](https://github.com/DataVero99/EU-research-and-development-expenditures/blob/main/images/centroid2011.jpeg)

Study of variable X9 - R&D Expenditures for the year 2019
![Table1](https://github.com/DataVero99/EU-research-and-development-expenditures/blob/main/images/centroid2019.jpeg)

Results for 2011:
![Table1](https://github.com/DataVero99/EU-research-and-development-expenditures/blob/main/images/results2011.png)
Units on the map: 2.895476
Standard distance: 12.77769

Results for 2019:
![Table1](https://github.com/DataVero99/EU-research-and-development-expenditures/blob/main/images/results2019.png)

Units on the map: 2.297533
Standard distance: 12.27311

Between the years 2011 and 2019, no significant deviations or changes in values were observed.


## 2. Component analysis of the structure of economic spatial processes - trends and spatial autocorrelation. For the year 2011, the variable, i.e. R&D expenditures.

The analysis should assess the presence of spatial trends and examine residuals. Next, calculate global and local Moran's autocorrelations using appropriate tests and maps. Also, apply join-count statistics. Determine significance for all statistical tests.

Dividing values into groups based on positional statistics and labeling them with colors.
![Table1](https://github.com/DataVero99/EU-research-and-development-expenditures/blob/main/images/2011map1.jpeg)

The highest values for a given variable characterized Finland; therefore, it was not colored due to its high values that stand out from the rest of the countries. 

Cluster memberships are as follows:
![Table1](https://github.com/DataVero99/EU-research-and-development-expenditures/blob/main/images/cluster2011.png)

