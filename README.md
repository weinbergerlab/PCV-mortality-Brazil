# PCV-mortality-Brazil
Data and code for analysis of changing trends in mortality associated with the introduction of PCV10 in Brazil
PCV-mortality-Brazil

The code and datasets in this repository are used to evaluate the impact of pneumococcal conjugate vaccines on the incidence of
pneumonia deaths. The synthetic_control_run.R file is the only one that you should need to interact with to change the input datasets. The _functions.r and _analysis.R files can be edited to change additional parameters.

There are 4 datasets: national.csv includes data for all of Brazil. education.csv, HDI.csv, and poverty.csv aggregate municipal-level data based on Human Development Index (HDI), maternal educational attainment (education.csv) and poverty level (poverty.csv). Municipal HDI data were from the United Nations Development Programme for Brazil (UNDP, 2013); data on percentage of children in extreme poverty (monthly per capita income <$40 US) and the proportion of mothers with no primary education were from the Brazilian Institute of Geography and Statistics (“Brazilian Institute of Geography and Statistics,” n.d.) For HDI, we formed groups based on UN-defined categories for countries: very low/low (< 0.60), medium (0.60 to < 0.70), and high/very high (≥ 0.70). For percent children in poverty, we defined low SES as >27 percent of children from the municipality living in extreme poverty, high SES as <3 percent. For maternal education, we defined low SES as >30 percent with no primary education, and high SES as <10 percent. Details of the stratification procedure are available in the Supplementary Methods. 

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
