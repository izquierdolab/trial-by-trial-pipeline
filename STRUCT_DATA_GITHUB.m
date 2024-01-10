
% 6/3: OOP method for restructuring data to hold all relavent data in 1 instance
% Get and restructure data for analysis

classdef STRUCT_DATA
    properties
        conditions
        struct_data
        day_data
        tbl
        tbl_day
        group_tbl
        OUT
    end
    methods
        % get structured data for single condition 
        function obj = GetData(obj)
            % access animal data 
            cd_path = 'Animal Data/';
            dir_path = dir(cd_path); % path to animal data

            % get all rat IDs
            dname = {dir_path([dir_path(:).isdir]).name}'; 
            dname(ismember(dname,{'.','..'})) = []; % get rid of NAN files
            conds = obj.conditions;
            [condition,task] = deal(conds{1},conds{2}); % get the condition, task, and region from input
            cohort_status = readtable('Cohort Status.xlsx','PreserveVariableNames',true); % get cohort info

            % new variable names for table (stacked table; avoid hard-coding indices)
            header = {'TrialNumber','CommittedChoices','InitiationOmission',...
                'ChoiceOmission','Correct','Rewarded','CorrectPercent',...
                'PositionCorrect','InitiationLatency_Duration','CorrectLatency_Duration',...
                'IncorrectLatency_Duration','CorrectRewardLatency_Duration'};

            % loop through rats
            count = 0;  % count to adjust rat index
            ind = 1;    % count to adjust day index
            for ratid=1:length(dname)
                % locate animal file for each rat and condition and get cohort info
                path = strcat(cd_path,char(dname{ratid}),'/',task,'/',condition,'/'); 
                rat_info = cohort_status(string(cohort_status.ID)==char(dname{ratid}), :);

                % skip iteration if rat condition/task don't exist OR wrong brain region
                if not(isfolder(path))
                    count = count - 1;
                    continue
                else; rat = ratid + count;
                end                

                % assign rat variables 
                vars(rat).rati = char(dname{ratid}); % rat id
                vars(rat).condphase = condition; % rat phase
                vars(rat).region = rat_info.Region;
                vars(rat).task = char(task); % AO/SO
                
                %Reversal order
                % add which phase the current condition was completed in,
                % eg., if condition = VEH100 and the rat recieved VEH 
                % first, then order=1. But if condition = CNO100 and the 
                % rat recieved VEH first, then order = 2. Order=0 for
                % discrim
                if contains(condition, rat_info.R1); vars(rat).order = 1;
                elseif contains(condition,'D'); vars(rat).order = 0;
                else; vars(rat).order = 2; 
                end
                
                % add drug order
                %VEH(R1)-->CNO(R2)=0,
                % CNO(R1)-->VEH(R2)=1 
                if contains(rat_info.R1,'VEH') && contains(rat_info.R2,'CNO'); vars(rat).drugorder = 0;
                else; vars(rat).drugorder = 1; 
                end 
             
                               
                % add task as binary from cohort info table
                if contains(vars(rat).task,'SO'); vars(rat).itask = 1; % SO=1, AO=0
                else; vars(rat).itask = 0;
                end
                
                % add group as binary from cohort info table
                if contains(rat_info.Virus,'hm4Di'); vars(rat).virus = 1;
                else;  vars(rat).virus = 0;
                end

                % add condition as binary from cohort info table and find
                % probability from condition statement
                if contains(condition,'VEH')
                    vars(rat).drug = 0;
                    vars(rat).probname = erase(condition,'VEH');
                elseif contains(condition,'D')
                    vars(rat).drug = NaN;
                    vars(rat).probname = 'D';
                else
                    vars(rat).drug = 1;
                    vars(rat).probname = erase(condition,'CNO');
                end
                
                % add probability
                %   0 = Discrim phase
                %   1 = Reversal 100
                %   2 = Reversal 90
                %   3 = Reversal 80
                %   4 = Reversal 70
                if strcmp(vars(rat).probname,'D')
                    vars(rat).prob = 0;
                elseif strcmp(vars(rat).probname,'100') 
                    vars(rat).prob = 1;
                elseif strcmp(vars(rat).probname,'90') 
                    vars(rat).prob = 3;
                elseif strcmp(vars(rat).probname,'80') 
                    vars(rat).prob = 5;
                elseif strcmp(vars(rat).probname,'70') 
                    vars(rat).prob = 7;
                end
                
                % add phase: indicate each reversals R1-R4 (S-O), R1-R8 (A-O)
                %   0 = Discrim phase
                %   1 = Reversal 100 
                %   2 = Reversal 100 
                %   3 = Reversal 90  
                %   4 = Reversal 90
                %   5 = Reversal 80
                %   6 = Reversal 80
                %   7 = Reversal 70
                %   8 = Reversal 70
%                 if length(vars(rat).condphase) == 1
%                     vars(rat).phase=0;
                if length(vars(rat).condphase) == 1
                    vars(rat).phase=0;
                else
                    if  strcmp(vars(rat).condphase(1:3),'VEH')
                        vars(rat).phase=abs(vars(rat).drugorder)+vars(rat).prob;
                    elseif  strcmp(vars(rat).condphase(1:3),'CNO')
                        vars(rat).phase=abs(vars(rat).drugorder-1)+vars(rat).prob;
                    end
                end
                
                % add condition as binary from cohort info table
                if contains(vars(rat).region,'OFC')
                    vars(rat).brainregion = 0; % check condition
                elseif contains(vars(rat).region,'BLA')
                    vars(rat).brainregion = 1;
                elseif contains(vars(rat).region,'ACC')
                    vars(rat).brainregion = 2;
                end
                
  
                % add sex as binary
                if contains(rat_info.Sex,'Female'); vars(rat).sex = 0;
                else;  vars(rat).sex = 1;
                end

                % DSTC and STC data
                D_path = strcat(cd_path,char(dname{ratid}),'/',task,'/D/');
                D_files = dir(fullfile(D_path, '*.xlsx')); 
                files = dir(fullfile(path, '*.xlsx'));
                vars(rat).STC = numel(files);  % get the STC/num days for curr rat
                vars(rat).DSTC = numel(D_files); % get the discrimination STC 
                
                % make arrays to temporarily store and merge data across days
                [rew,oms,inom,chom] = deal(0);
                [inlat,rewlat,corrlat,incorrlat,latdata] = deal([]);
                [inom_data,chom_data,corr_data,rew_data] = deal([]);

                % loop through files
                day = 1;
                for file = {files.name}
                    % cap number of days (STC) at 15
                    if day == 6
                        break
                    end
                    
                    % check that day exists
                    curfile = char(file);
                    day_check = str2double(curfile(strfind(curfile,'D')+1:strfind(curfile,'.')-1));
                    if day_check > numel(files); error(strcat('INCORRECT DAY, CHECK FILE: ',curfile));
                    end

                    % get data and num trials
                    temp_data = readtable(strcat(path,char(file)),'PreserveVariableNames',true);
                    temp_data = table2array(temp_data);
                    temp_data(:,1) = [];
                    temp_data(1,:) = [];
                    data = array2table(temp_data);
                    data.Properties.VariableNames = header; % reset header to variable names
                    num_trials = length([data.TrialNumber]);

                    % concatenate data across all days for curr rat
                    rew = rew + length(table2array(data(data.Rewarded==1,:))); % num rewarded trials
                    inom = inom + length(table2array(data(data.InitiationOmission==1,:))); % num initiation omissions
                    chom = chom + length(table2array(data(data.ChoiceOmission==1,:))); % num choice omissions
                    oms = oms + length(table2array(data(data.InitiationOmission==1,:)))+length(table2array(data(data.ChoiceOmission==1,:))); % num omissions

                    % look at committed trials only
                    comm_data = data(data.CommittedChoices==1,:); 

                    % get day data (check none are NAN)
                    if ~isnan(mean(comm_data.Correct))
                        day_vars(ind).rati = vars(rat).rati;
                        day_vars(ind).condphase = vars(rat).condphase;
                        day_vars(ind).prob = vars(rat).prob;
                        day_vars(ind).day = day;
                        day_vars(ind).trials = num_trials;
%                         day_vars(ind).control = vars(rat).control;
%                         day_vars(ind).OFCDREADD_EGFPS = vars(rat).OFCDREADD_EGFPS;                       
                        day_vars(ind).sex = vars(rat).sex;
                        day_vars(ind).region = vars(rat).region;
                        day_vars(ind).brainregion = vars(rat).brainregion;
                        day_vars(ind).drug = vars(rat).drug; 
                        day_vars(ind).probname = vars(rat).probname;
                        day_vars(ind).order = vars(rat).order; 
                        day_vars(ind).drugorder = vars(rat).drugorder;  
                        day_vars(ind).phase = vars(rat).phase; 
                        day_vars(ind).itask = vars(rat).itask; 
                        day_vars(ind).virus = vars(rat).virus; 
                        day_vars(ind).STC = vars(rat).STC; 
                        day_vars(ind).DSTC = vars(rat).DSTC;
                        day_vars(ind).CorrectPercent = mean(comm_data.Correct); 
                        day_vars(ind).inom_day = sum(data.InitiationOmission);
                        day_vars(ind).rew_day = sum(comm_data.Rewarded);
                    end

                    % concatenate choice, reward, and latency data across all days
                    inom_data = vertcat(inom_data,[data.InitiationOmission]);
                    chom_data = vertcat(chom_data,[comm_data.ChoiceOmission]);
                    corr_data = vertcat(corr_data,[comm_data.Correct]);
                    rew_data = vertcat(rew_data,[comm_data.Rewarded]);
                    inlat = vertcat(inlat,[comm_data.InitiationLatency_Duration]);
                    rewlat = vertcat(rewlat,[comm_data(comm_data.Rewarded==1,:).CorrectRewardLatency_Duration]);
                    corrlat = vertcat(corrlat,[comm_data(comm_data.Correct==1,:).CorrectLatency_Duration]);
                    incorrlat = vertcat(incorrlat,[comm_data(comm_data.Correct==0,:).IncorrectLatency_Duration]);
                    latdata = vertcat(latdata,table2array(data));

                    % increase loop index
                    ind = ind + 1; % outside of rat
                    day = day + 1; % inside of rat
                end

                % compute winstay/loseshift stats
                trials = length(rew_data) - 1;
                [winstay,loseshift] = deal(zeros(1,trials),zeros(1,trials)); 
                [win,lose] = deal(zeros(1,trials),zeros(1,trials));
                for t = 1:trials
                    if inom_data(t) ~=1 && chom_data(t) ~= 1 
                    if rew_data(t) == 1
                        [win(1,t),lose(1,t)] = deal(1,0);
                        if corr_data(t)==corr_data(t+1); winstay(1,t)=1;
                        else; winstay(1,t)=0;
                        end
                    else
                        [lose(1,t), win(1,t)] = deal(1,0);
                        if corr_data(t)==corr_data(t+1); loseshift(1,t)=0;
                        else; loseshift(1,t) = 1;
                        end
                    end
                    else; [win(t),lose(t),winstay(t),loseshift(t)] = deal(0,0,0,0);
                    end
                end

                % check for NaN and delete rat if NaN
                if ~isnan(mean(rewlat)) 
                    % update variables for rat across all days
                    vars(rat).trials = length(latdata);
                    vars(rat).oms = oms;
                    vars(rat).inom = inom;
                    vars(rat).chom = chom;
                    vars(rat).rew = rew;
                    vars(rat).wstay_stim = sum(winstay)/sum(win); % # of win-stays per animal
                    vars(rat).lshift_stim = sum(loseshift)/sum(lose); % # of lose-shifts/animal    
                    vars(rat).inlatmed = median(inlat);
                    vars(rat).inlatmean = mean(inlat);
                    vars(rat).inlatsd = std(inlat);
                    vars(rat).rewlatmed = median(rewlat);
                    vars(rat).rewlatmean = mean(rewlat);
                    vars(rat).rewlatsd = std(rewlat);
                    vars(rat).corrlatmed = median(corrlat);
                    vars(rat).corrlatmean = mean(corrlat);
                    vars(rat).corrlatsd = std(corrlat);
                    vars(rat).incorrlatmed = median(incorrlat);
                    vars(rat).incorrlatmean = mean(incorrlat);
                    vars(rat).incorrlatsd = std(incorrlat);
                    vars(rat).latdata = latdata;
                else
                    vars(rat) = [];
                    count = count - 1;
                end
            end
            obj.struct_data = vars;
            obj.day_data = day_vars;
        end
        
        % call function for structured tables
        function Data = StructData(obj,task,groups)
            % empty tables to hold concatenated data
            Data.tbl = [];
            Data.tbl_day = [];
            
            % loop through each group in the task and get structured tables
            for iGroup = 1:length(groups)
                group = groups{iGroup};
                obj.conditions = {group, task};
                % call GetData to make structured tables
                obj = obj.GetData();
                temp_tbl = struct2table(obj.struct_data);
                temp_tbl_day = struct2table(obj.day_data);
                
                % concatenate data across all groups in task
                Data.tbl = [Data.tbl; temp_tbl];
                Data.tbl_day = [Data.tbl_day; temp_tbl_day];
            end
            
            % create tbl_trials by stacking latency data
            Data.tbl_trials = obj.Stack(Data.tbl,'max',100);
        end
   
        % stack data for # of trials - called in FIGURES
        function stacked_tbl = Stack(obj,tbl,maxTrials,maxDays)
            obj.tbl = tbl;
            % set standard header
            header = {'TrialNumber','CommittedChoices','InitiationOmission',...
                'ChoiceOmission','Correct','Rewarded','CorrectPercent',...
                'PositionCorrect','InitiationLatency_Duration','CorrectLatency_Duration',...
                'IncorrectLatency_Duration','CorrectRewardLatency_Duration'};
            % add important rat info to header
            stacked_header = [{'rati'},{'condphase'},{'prob'},{'region'},{'brainregion'}...
                {'sex'},{'virus'},{'drug'},{'order'},{'phase'},{'drugorder'},...
                {'ContTrial'},{'day'},header(:)'];

            % initiate stacked table
%             stacked_tbl = cell2table(cell(0,23),'VariableNames',stacked_header);
            stacked_tbl = cell2table(cell(0,25),'VariableNames',stacked_header);
            
            % set maxDays to 100 if not numeric to effectively stack all days
            if ~isnumeric(maxDays); maxDays = 100; end
            
            % get data for each rat and stack by a set number of trials
            for row = 1:height(obj.tbl)
                % pull latency data from obj table
                row_data = obj.tbl(row,:);
                data = row_data.latdata{1};
                
                % check number of trials to stack with 
                if strcmp(maxTrials,'uniform') % stack max # of trials without over indexing 
                    ind = min(cellfun('length',obj.tbl.latdata)); % find animal with lowest number of trials
                    data = data(1:ind,:);
                elseif isnumeric(maxTrials) & maxTrials < height(data) % stack a given number of trials
                    data = data(1:maxTrials,:);  % get data for first #_ of trials 
                end
                
                % create 'subtable' of all rat latency data
                rat_stacked = array2table(data,'VariableNames',header);
                
                % iterate through trials to track days
                day_col = [];
                day_counter = 0;
                for iTrial = 1:height(rat_stacked)
                    % check if max days reached
                    if day_counter > maxDays
                        break
                    end
                    % check if trial number restarts
                    if rat_stacked.TrialNumber(iTrial) == 1
                        day_counter = day_counter + 1;
                    end
                    % add day counter to column
                    day_col = [day_col; day_counter];
                end
                
                % remove rows/trials longer than max days
                if height(day_col) < height(data)
                    data = data(1:height(day_col),:);
                    
                    % redefine rat_stacked
                    rat_stacked = array2table(data,'VariableNames',header);
                end
                
                % add continuous trial count and day columns
                rat_stacked.('ContTrial') = (1:height(data)).';
                rat_stacked.('day') = day_col;

                % add remainder of rat info
                rat_stacked.('rati') = repmat(row_data.rati,height(data),1);
                rat_stacked.('condphase') = repmat(row_data.condphase,height(data),1);
                rat_stacked.('prob') = repmat(row_data.prob,height(data),1);
                rat_stacked.('sex') = repmat(row_data.sex,height(data),1);
                rat_stacked.('region') = repmat(row_data.region,height(data),1);
                rat_stacked.('brainregion') = repmat(row_data.brainregion,height(data),1);
%                 rat_stacked.('control') = repmat(row_data.control,height(data),1);
%                 rat_stacked.('OFCDREADD_EGFPS') = repmat(row_data.OFCDREADD_EGFPS,height(data),1);
                rat_stacked.('virus') = repmat(row_data.virus,height(data),1);
                rat_stacked.('drug') = repmat(row_data.drug,height(data),1);
                rat_stacked.('order') = repmat(row_data.order,height(data),1);
                rat_stacked.('drugorder') = repmat(row_data.drugorder,height(data),1);        
                rat_stacked.('phase') = repmat(row_data.phase,height(data),1);     
                
%                 table_order = ismember(stacked_tbl.Properties.VariableNames,rat_stacked.Properties.VariableNames);
                
                % add rat info to the rest of stacked table
                stacked_tbl = [stacked_tbl; rat_stacked];
            end
            stacked_tbl.CorrectPercent = stacked_tbl.CorrectPercent/100;
            
        end
        
        % restructure table with resampled/cropped number of trials
        function Data = ResampleTrials(obj,tbl,trialnum)
            % make copy of tbl to edit while moving through each row and
            % cropping number of trials
            Data = tbl;
            
            % loop through each row/rat in the table
            for ratid=1:height(Data)

                % isolate current rat's data (curr row) in current table
                ratdata = Data(ratid,:);
                old_row = ratdata; % save old rat data for check
                
                % check that trialnum doesn't exceed current trials; if not
                % enough trials to crop, keep the same data
                if ratdata.trials < trialnum
                    continue
                end

                % access raw latency data with chosen number of trials 
                crop_data = ratdata.latdata{1};
                crop_data = crop_data(1:trialnum,:);

                % rewrite row properties: latdata and number of trials
                ratdata.latdata{1} = crop_data;
                ratdata.trials = trialnum;

                % variable names for the latency data table (raw data)
                header = {'TrialNumber','CommittedChoices','InitiationOmission',...
                    'ChoiceOmission','Correct','Rewarded','CorrectPercent',...
                    'PositionCorrect','InitiationLatency_Duration','CorrectLatency_Duration',...
                    'IncorrectLatency_Duration','CorrectRewardLatency_Duration'};

                % create table with raw latency data
                data = array2table(crop_data,'VariableNames',header);
                comm_data = data(data.CommittedChoices==1,:);

%                 % number of days taken for the trials selected
                ratdata.STC = sum(data.TrialNumber == 1);

                % calculate new num of rews, inoms, choms, and oms
                ratdata.rew = length(table2array(data(data.Rewarded==1,:))); % num rewarded trials
                ratdata.inom = length(table2array(data(data.InitiationOmission==1,:))); % num initiation omissions
                ratdata.chom = length(table2array(data(data.ChoiceOmission==1,:))); % num choice omissions
                ratdata.oms = length(table2array(data(data.InitiationOmission==1,:)))+length(table2array(data(data.ChoiceOmission==1,:))); % num omissions

                % calculate new latency med/mean/std stats
                ratdata.inlatmed = median(comm_data.InitiationLatency_Duration);
                ratdata.inlatmean = mean(comm_data.InitiationLatency_Duration);
                ratdata.inlatsd = std(comm_data.InitiationLatency_Duration);
                ratdata.rewlatmed = median(comm_data(comm_data.Rewarded==1,:).CorrectRewardLatency_Duration);
                ratdata.rewlatmean = mean(comm_data(comm_data.Rewarded==1,:).CorrectRewardLatency_Duration);
                ratdata.rewlatsd = std(comm_data(comm_data.Rewarded==1,:).CorrectRewardLatency_Duration);
                ratdata.corrlatmed = median(comm_data(comm_data.Correct==1,:).CorrectLatency_Duration);
                ratdata.corrlatmean = mean(comm_data(comm_data.Correct==1,:).CorrectLatency_Duration);
                ratdata.corrlatsd = std(comm_data(comm_data.Correct==1,:).CorrectLatency_Duration);
                ratdata.incorrlatmed = median(comm_data(comm_data.Correct==0,:).IncorrectLatency_Duration);
                ratdata.incorrlatmean = mean(comm_data(comm_data.Correct==0,:).IncorrectLatency_Duration);
                ratdata.incorrlatsd = std(comm_data(comm_data.Correct==0,:).IncorrectLatency_Duration);

                % compute new winstay/loseshift stats
                trials = height(comm_data) - 1;
                [winstay,loseshift] = deal(zeros(1,trials),zeros(1,trials)); 
                [win,lose] = deal(zeros(1,trials),zeros(1,trials));
                for t = 1:trials
                    if data.InitiationOmission(t) ~=1 && comm_data.ChoiceOmission(t) ~= 1 
                    if comm_data.Rewarded(t) == 1
                        [win(1,t),lose(1,t)] = deal(1,0);
                        if comm_data.Correct(t)==comm_data.Correct(t+1); winstay(1,t)=1;
                        else; winstay(1,t)=0;
                        end
                    else
                        [lose(1,t), win(1,t)] = deal(1,0);
                        if comm_data.Correct(t)==comm_data.Correct(t+1); loseshift(1,t)=0;
                        else; loseshift(1,t) = 1;
                        end
                    end
                    else; [win(t),lose(t),winstay(t),loseshift(t)] = deal(0,0,0,0);
                    end
                end

                % calculate new winstay/loseshift stats
                ratdata.wstay_stim = sum(winstay)/sum(win); % # of win-stays per animal
                ratdata.lshift_stim = sum(loseshift)/sum(lose); % # of lose-shifts/animal
                
                % set new row to data
                Data(ratid,:) = ratdata;
            end
        end
        
        % restructure day table with cropped number of days 
        function tbl = ResampleDays(obj, tbl_day, days)
            % select rows within the day range
            tbl = tbl_day(tbl_day.day <= days,:);
        end
        
        % call all other resample functions
        function DATA = Resample(obj, DATA, maxTrials, maxDays)
            % unpack table and day table
            obj.tbl = DATA.tbl;
            obj.tbl_day = DATA.tbl_day;
            
            % resample number of trials
            if isnumeric(maxTrials)
                DATA.tbl = obj.ResampleTrials(obj.tbl, maxTrials);
            end
            
            % resample number of days
            DATA.tbl_day = obj.ResampleDays(obj.tbl_day, maxDays);
            
            % create table by trials using stack function
            DATA.tbl_trials = obj.Stack(obj.tbl,maxTrials,maxDays);

        end
       
        % get stats (means, SEMs) across group - NOT CALLED CURRENTLY
        function obj = GroupStats(obj)
            OFC = obj.tbl(obj.tbl.brainregion == 0,:);
            BLA = obj.tbl(obj.tbl.brainregion == 1,:);
            ACC = obj.tbl(obj.tbl.brainregion == 2,:);
            
            group_data = {OFC(OFC.drug == 0,:); OFC(OFC.drug == 1,:);... % OFC VEH, OFC CNO (dreadd and egfp)
                BLA(BLA.virus == 0,:); BLA(BLA.drug == 1,:);... % BLA VEH, BLA CNO (dreadd and egfp)
                ACC(ACC.virus == 0,:); ACC(ACC.drug == 1,:);... % ACC VEH, ACC CNO (dreadd and egfp)
                OFC(OFC.virus == 0,:); OFC(OFC.group == 1,:);... % OFC DREADD, OFC EGFP
                BLA(BLA.virus == 0,:); BLA(BLA.group == 1,:);... % BLA DREADD, BLA GFP
                ACC(ACC.virus == 0,:); ACC(ACC.group == 1,:);... % ACC DREADD, BLA GFP
                OFC(OFC.virus == 1 & OFC.drug == 0,:);...     % OFC DREADD, VEH
                OFC(OFC.virus == 1 & OFC.drug == 1,:);...     % OFC DREADD, CNO
                OFC(OFC.virus == 0 & OFC.drug == 0,:);...     % OFC EGFP, VEH
                OFC(OFC.virus == 0 & OFC.drug == 1,:);...     % OFC EGFP, CNO
                BLA(BLA.virus == 1 & BLA.drug == 0,:);...     % BLA DREADD, VEH
                BLA(BLA.virus == 1 & BLA.drug == 1,:);...     % BLA DREADD, CNO
                BLA(BLA.virus == 0 & BLA.drug == 0,:);...     % BLA EGFP, VEH
                BLA(BLA.virus == 0 & BLA.drug == 1,:);...     % BLA EGFP, CNO
                ACC(ACC.virus == 1 & ACC.drug == 0,:);...     % ACC DREADD, VEH
                ACC(ACC.virus == 1 & ACC.drug == 1,:);...     % ACC DREADD, CNO
                ACC(ACC.virus == 0 & ACC.drug == 0,:);...     % ACC EGFP, VEH
                ACC(ACC.virus == 0 & ACC.drug == 1,:)};       % ACC EGFP, CNO
            
            % variable stats are columns
            header = {'STC_mean','STC_sem','PerCor_mean','PerCor_sem',...
                'InitLat_mean','InitLat_sem','CorLat_mean','CorLat_sem',...
                'IncorLat_mean','IncorLat_sem','RewLat_mean','RewLat_sem'};
            % groups conditions are rows
            rows = {'OFC_VEH','OFC_CNO','BLA_VEH','BLA_CNO','ACC_VEH','ACC_CNO',...
                'OFC_DREADD','OFC_EGFP','BLA_DREADD','BLA_EGFP','ACC_DREADD','ACC_EGFP',...
                'DREADDOFC_VEH','DREADDOFC_CNO','EGFPOFC_VEH',...
                'EGFPOFC_CNO','DREADDBLA_VEH','DREADDBLA_CNO','EGFPBLA_VEH','EGFPBLA_CNO',...
                'DREADDACC_VEH','DREADDACC_CNO','EGFPACC_VEH','EGFPACC_CNO'};
            
            % initiate group table
            data = zeros(length(rows),length(header));
            % fill group table
            for i = 1:length(group_data)
                % get data for currect condition group
                curr = group_data{i};
                % STC stats
                mean_STC = mean(curr.STC);
                sem_STC = std(curr.STC) / height(curr.STC);
                % Percent correct stats
                stacked = obj.Stack(curr,'max');
                mean_percor = mean(stacked.CorrectPercent);
                sem_percor = std(stacked.CorrectPercent) / height(stacked.CorrectPercent);
                % Initiation latency stats
                mean_initlat = mean(stacked.InitiationLatency_Duration);
                sem_initlat = std(stacked.InitiationLatency_Duration) / height(stacked.InitiationLatency_Duration);
                % Correct Latency stats
                mean_corlat = mean(stacked.CorrectLatency_Duration);
                sem_corlat = std(stacked.CorrectLatency_Duration) / height(stacked.CorrectLatency_Duration);
                % Incorrect Latency stats
                mean_incorlat = mean(stacked.IncorrectLatency_Duration);
                sem_incorlat = std(stacked.IncorrectLatency_Duration) / height(stacked.IncorrectLatency_Duration);
                % Correct Reward Latency stats
                mean_rewlat = mean(stacked.CorrectRewardLatency_Duration);
                sem_rewlat = std(stacked.CorrectRewardLatency_Duration) / height(stacked.CorrectRewardLatency_Duration);
                
                % add all stats to array
                data(i,:) = [mean_STC sem_STC mean_percor sem_percor ,...
                    mean_initlat sem_initlat mean_corlat sem_corlat ,...
                    mean_incorlat sem_incorlat mean_rewlat sem_rewlat];
           end
           obj.group_tbl = array2table(data);
           obj.group_tbl.Properties.VariableNames = header;
           obj.group_tbl.Properties.RowNames = rows; 
        end

    end
end