
%%%%%%%%%%%%%%
%% RUN DATA %% 
%%%%%%%%%%%%%% 

% Get DREADD data 
% Get stats (means, SEMs) 

clc
clear

% Load relevant scripts and objects
addpath('Stats Scripts/')
struct = STRUCT_DATA;
cohort_status = readtable('Cohort Status.xlsx','PreserveVariableNames',true); 

% Call struct data for Stimulus and Action conditions to make complete tables for
% each task

SO = struct.StructData('SO',{'D','VEH100','CNO100','VEH90','CNO90'});
AO = struct.StructData('AO',{'D','VEH100','CNO100','VEH90','CNO90','VEH80','CNO80','VEH70','CNO70'});

% Save output
save('OUT_DATA.mat','SO','AO');


%% Resample SO/AO structures (just use if restricting # of trials) 
clc; clear;
load('OUT_DATA.mat'); 
addpath('Stats Scripts/')
struct = STRUCT_DATA;

% Call Resample funtion to resample tbl, tbl_day, and tbl_trials with input
% number of trials and days
%
%   Input --> SO/AO stucture, #WZA of trials, # of days
%
%           -> # trials: 'max' = all trials for all animals, or input some
%               number (eg, 500) to stack/resample 500 trials per animal
%
%           -> # days: 'max' = maximum days for all animal, or input some
%               number (eg, 10) to stack/resample 10 days for each animal

SO_resample = struct.Resample(SO,'max',5); 
AO_resample = struct.Resample(AO,'max',5);


%first AO 150 trials 
% AO_resample.tbl_trials  = AO_resample.tbl_trials(AO_resample.tbl_trials.ContTrial<=150,:); 


% Save output
save('OUT_DATA.mat','SO_resample','AO_resample');

%%%%%%%%%%%%%%%%%