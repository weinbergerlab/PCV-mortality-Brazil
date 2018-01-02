# PCV-mortality-Brazil
Data and code for analysis of changing trends in mortality associated with the introduction of PCV10 in Brazil
PCV-mortality-Brazil
Data and code for analysis of changing trends in mortality associated with the introduction of PCV10 in Brazil

The code and datasets in this repository are used to evaluate the impact of pneumococcal conjugate vaccines on the incidence of
pneumonia deaths.

The data span the period 2004-2014, with observations every 4 months. Different age groups were explored: 3-<12months; 3-<24months, 
3-<60months.

The main outcome variable for analysis is all-cause pneumonia (defined as ICD10 codes J12-J18).

The "NoPCV" variable includes all causes of death that are not likely to be affected by PCV10 (defined as all deaths except 
respiratory (any ICD10 J code), sepsis (ICD10 A40-41) and meningitis (ICD10 G00-03)."

"Pop" is the population size. Population estimates for each municipality and age were obtained from the Brazilian 
Institute of Geography Statistics (Brazilian Institute of Geography and Statistics, censuses 1991, 2000 and 2010). 
Monthly population data for each of the SES strata and regions were calculated by cubic polynomial interpolation of 
the age- and municipality-stratified census data using Popweaver (Alonso, Lopez, & Schuck-Paim, 2017), a freely available 
population interpolation software package.

The rest of the variables are control diseases. These were also extracted based on ICD10 subchapters, which group 
related causes of deaths (https://en.wikipedia.org/wiki/ICD-10).
