
% Data management script - reformat raw data and organize into current data
% environment
clc
clear

% add Scripts directory to search path 
addpath('Scripts/')

%% Reformat and organize any old files
StackedDataManagement()

%% Reformat and organize new data
% load datafiles
filePattern = fullfile('Datafiles/New Datafiles/', '*.xlsx');
datafiles = dir(filePattern); 

% variables to be included in reformatted data
vars = {'Per Trial - Trail Number',...
    'Per Trial - commited choices',...
    'Per Trial - Initiation omission',...
    'Per Trial - Choice omission',...
    'Per Trial - Correct',...
    'Per Trial - rewarded',...
    'Per Trial - correct percent (cum)',...
    'Per Trial - position of correct image',...
    'Per Trial - Initiation Latency_Duration',...	
    'Per Trial - correct latency_Duration',...
    'Per Trial - incorrect latency_Duration',...	
    'Per Trial - Correct Reward Latency_Duration'};

% loop through each new data file
for i=1:(length(datafiles))
    % get file info and load data
    file_name = datafiles(i).name;
    curr_file = strcat('Datafiles/New Datafiles/',file_name);
    data_table = readtable(curr_file,'PreserveVariableNames',true);
   
    % check name of file
    rat_info = {};
    index = strfind(convertCharsToStrings(file_name), '_');
    rati = file_name(1:index-1); 
    cond = file_name(index(1)+1:index(2)-1);
    task = file_name(index(2)+1:index(3)-1);
    day = file_name(index(3)+1:end-5);
    if (rati(1:2) == 'CA' & ismember(task,['AO' 'SO']) & day(1) == 'D')
        if (contains(cond,'VEH') | contains(cond,'CNO') | contains(cond,'D'))
            disp(file_name)
        end 
    else
        disp('incorrect file name format')
    end
    
    % reformat table
    formatted_table = Reformat(data_table, vars);

    % call Organize function to place formatted data in directory
    Organize(formatted_table,file_name);
    
    % move file with MoveToProcessed func
    MoveToProcessed(file_name,'New Datafiles');
end
