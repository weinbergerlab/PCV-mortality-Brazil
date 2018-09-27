#This is the file used to set variables to be used in analysis, as well as to run the analysis.
#Make sure *_analysis.R, *_report.R, *_report.Rmd, *_functions.R, and *_plot.R are all in the same folder as this file.
#Model the setup shown in this file, then run this file from the console using source('This file's directory/This file's name'). 

#Clear the workspace
rm(list = ls(all = TRUE))
gc()
setwd('C:/Users/dmw63/Documents/GitHub/synthetic-control-poisson/main analysis components')
library(RCurl)
#Set the working directory
#This step only works as written if this file is run using the source() command. Otherwise, skip this step and set manually.
tryCatch({
  setwd(dirname(sys.frame(1)$ofile))
}, error = function(e) {
  cat('Warning: \n  Could not programmatically set working directory. \n  Try running this file by using "source(\'This file\'s directory/This file\'s name\')" from the command line, \n   or set the working directory manually using "setwd()".')
}, warning = function(w) {}, finally = {})

#Used to check for relevant packages and update them if out of date or install them if not installed.
update_packages  <- TRUE #Whether to update outdated packages.
install_packages <- TRUE #Whether to install missing packages.
install_pandoc   <- TRUE #Whether to install pandoc, which requires an external installer, and rmarkdown, a package that depends on pandoc's successful installation.

#Assign variable values
country       <- 'Brazil' #Country or region name.
n_seasons     <- 4        #Number of months (seasons) per year. 12 for monthly, 4 for quarterly, 3 for trimester data.
exclude_covar <- c('pop', 'A30_49', 'B95_B98', 'G00_G09', 'H65_H75', 'J00_J06', 'J09_J18', 'J20_J22', 'J30_J39', 'J40_J47', 'J60_J70', 'J80_J84', 'J85_J86', 'J90_J94', 'J95_J99')      #User-defined list of covariate columns to exclude from all analyses.
exclude_group <- c()      #User-defined list of groups to exclude from analyses.
code_change   <- FALSE    #Used for Brazil data. Set to TRUE to adjust for year 2008 coding changes in hospi data; otherwise, set to FALSE.

input_directory  <- 'https://raw.githubusercontent.com/weinbergerlab/PCV-mortality-Brazil/master/' #Directory (or URL) containing input data file.
output_directory <- paste('~/Desktop/Brazil_Mortality/', sep = '')                                                             #Directory where results will be saved.
output_directory <- paste(output_directory, format(Sys.time(), '%Y-%m-%d-%H%M%S'), '/', sep = '')                     #Adds a subfolder to output directory to organize results by date and time run.
file_name        <- 'HDI.csv'                                                                       #Name of file containing data for analysis. Must be a .csv file.
data_file <- paste0(input_directory, file_name)
prelog_data <- read.csv(text=getURL(data_file), check.names = FALSE)# IF IMPORTING FROM URL
year_def          <-     'cal_year'  #Can be cal_year to aggregate results by Jan-Dec; 'epi_year' to aggregate July-June

group_name   <- 'age_group' #Name of column containing group labels.
date_name    <- 'date'      #Name of column containing dates.
outcome_name <- 'J12_J18'   #Name of column containing outcome.
denom_name   <- 'NoPCV'     #Name of column containing denominator to be used in offset.

start_date        <- as.Date('2004-01-01') #Indicates the date of the first data point.
intervention_date <- as.Date('2010-04-01') #Indicates the date of intervention in the data.
end_date          <- as.Date('2014-10-01') #Indicates the date of the last data point.
pre_period        <- as.Date(c('2004-04-01', '2009-01-01')) #Range over which the data is trained for the CausalImpact model.
post_period       <- as.Date(c('2010-04-01', '2014-01-01')) #Range from the intervention date to the end date.
eval_period       <- as.Date(c('2012-04-01', '2014-01-01')) #Range over which rate ratio calculation will be performed.

crossval=TRUE #run cross validation? Note this takes time...adds ~40 min with 10 age groups, 7 cores

#Run analysis, but don't generate HTML report
#source('synthetic_control_analysis.R', local = TRUE)
#source('synthetic_control_write_results.R', local = TRUE)
#source('synthetic_control_plot.R', local = TRUE)

#Run analysis and generate HTML report
source('synthetic_control_report.R', local = TRUE)