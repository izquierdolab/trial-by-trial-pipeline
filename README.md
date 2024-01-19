# trial-by-trial-pipeline

ORGANIZE DATA FOLDERS 
•      Create “Data  Management” folder, should contain the following:  
•	The main folder should contain “DREADD_STATS” matlab scripts, as well as the “Cohort Status” excel file 
•	 “Animal Data” subfolder: should contain processed animal data for each animal for each task and drug condition 
•	 “Stats Scripts” subfolder: contains the “STRUCT_DATA” matlab scripts

CREATE MAT FILE 
•	Run first section of “DREADDS_STATS” matlab script 
•	New mat file titled “OUT_DATA” should appear in your Workspace with all the data 
•	The second section of “DREADD_STATS” resamples the data to only include what you specify (e.g. first day, first 150 trials, discrimination only, reversals only, etc.) 
o	Note: To generate a mat file that you will use to plot figures you shouldn’t have to exclude any data from your mat file, so you would just run the second subsection as is 
o	Note: To generate a mat file that you will use for statistical analyses you should generate separate mat files for each brain region, and consider excluding discrimination data if you only want to analyze reversals 
•	Run second section of “DREADDS_STATS” matlab script 
•	Rename “OUT_DATA” mat file to specify what it includes
o	For example, if you generated a mat file that only contains BLA reversal data, you can name it “BLA_REV_OUT_DATA” 

GENERATE FIGURES 
•	Specify the name of the mat file you want to load onto “ABFigures_PC” or “SBFigures_PC” matlab scripts
•	Select Run if you want to generate all the figures
o	Note: You can also select to run subsections if you only want to generate certain figures 

REVERSAL TRANSITION SCRIPTS 
Refer to following link: https://github.com/DartmouthCCNL

RUN GLM ANALYSIS 
•	Specify the name of the mat file you want to load onto “GLM_AB_STATS” or “GLM_SB_STATS” matlab scripts
•	Select Run if you want to run all the full model GLMs
