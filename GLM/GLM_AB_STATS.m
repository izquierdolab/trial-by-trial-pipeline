clear, clc
close all

load('OFC_ALL_OUT_DATA_STATS','AO_resample')
% load('BLA_ALL_OUT_DATA_STATS','AO_resample')
% load('OFC_DIS_AB_OUT_DATA')
% load('BLA_DIS_AB_OUT_DATA')
% load('BLA_AB1st_OUT_DATA')

%%
%Discrimination A-B 

'Percent Correct by Trials (Full Model- DIS)'
glmepc = fitglme(AO_resample.tbl_trials,'CorrectPercent~1+TrialNumber+virus*sex+(1+TrialNumber|rati)')

%%
%AO First 150 Trials

TRIALS150  = AO_resample.tbl_trials(AO_resample.tbl_trials.ContTrial<=150,:); 

%BLA STATS

'Percent Correct (150 Trials- BLA Full Model)'
glmepc = fitglme(TRIALS150,'CorrectPercent~1+TrialNumber+phase*drug*drugorder*virus*sex+(1+TrialNumber+phase*drug|rati)') 
% 
'Percent Correct (150 Trials- BLA R1 & R3)'
glmepc = fitglme(TRIALS150(TRIALS150.order==1,:),'CorrectPercent~1+TrialNumber+phase*drug*virus*sex+(1+TrialNumber+phase*drug|rati)') 
% 
'Percent Correct (150 Trials - BLA Reversal 1)'
glmepc = fitglme(TRIALS150(TRIALS150.phase==1,:),'CorrectPercent~1+virus*drug+(1|rati)')  
%
'Percent Correct (150 Trials - BLA Reversal 3)'
glmepc = fitglme(TRIALS150(TRIALS150.phase==3,:),'CorrectPercent~1+virus*drug+(1|rati)')  
%
%BLA R3 POST-HOC (virus*drug) 

R3=(TRIALS150(TRIALS150.phase==3,:)); 

            'PC POST-HOC (BLA drug*virus interaction)- EGFP'
            glmePCEGFP = fitglme(R3(R3.virus==0,:),'CorrectPercent~1+drug+(1|rati)')
             nTests=2;
         
            'P for effect of drug in EGFP'
            glmePCEGFP.Coefficients.pValue(2)*nTests
            
            'PC POST-HOC (BLA drug*virus interaction)- HM4DI'
            glmePCHM4DI = fitglme(R3(R3.virus==1,:),'CorrectPercent~1+drug+(1|rati)')
             nTests=2;
         
            'P for effect of drug in HM4DI'
            glmePCHM4DI.Coefficients.pValue(2)*nTests

% BLA AB1st Stats 
'Percent Correct (150 Trials- R3 BLA hM4Di)'
glmepc = fitglme(TRIALS150(TRIALS150.virus==1 & TRIALS150.phase==3,:),'CorrectPercent~1+TrialNumber+drug+sex+(1+TrialNumber|rati)') 
% 
%OFC STATS 

'Percent Correct (150 Trials- OFC Full Model)'
glmepc = fitglme(TRIALS150,'CorrectPercent~1+TrialNumber+phase*drug*drugorder*virus+sex+(1+TrialNumber+phase*drug|rati)') 
% 
'Percent Correct (150 Trials- OFC Female sex*drugorder)'
glmepc = fitglme(TRIALS150(TRIALS150.sex==0,:),'CorrectPercent~1+drugorder+(1|rati)')
%
'Percent Correct (150 Trials- OFC Male sex*drugorder)'
glmepc = fitglme(TRIALS150(TRIALS150.sex==1,:),'CorrectPercent~1+drugorder+(1|rati)')

'Percent Correct (150 Trials- OFC R1 & R3)'
glmepc = fitglme(TRIALS150(TRIALS150.order==1,:),'CorrectPercent~1+TrialNumber+phase*drug*virus*sex+(1+TrialNumber+phase*drug|rati)') 
% 
%OFC AB R1 1st 10 trials  

TRIALS10  = AO_resample.tbl_trials(AO_resample.tbl_trials.ContTrial<=10,:); 

'Percent Correct (10 Trials- OFC  Full Model)'
glmepc = fitglme(TRIALS10,'CorrectPercent~1+TrialNumber+phase*drug*drugorder*virus*sex+(1+TrialNumber+phase*drug|rati)') 
% 
'Percent Correct (10 Trials- OFC  drug*drug order*virus (sex as covariate))'
glmepc = fitglme(TRIALS10,'CorrectPercent~1+TrialNumber+drug*drugorder*virus+sex+(1+TrialNumber+drug|rati)') 
% 
'Percent Correct (10 Trials- OFC hM4Di)' %(virus x drug order interaction)
glmepc = fitglme(TRIALS10(TRIALS10.virus==1,:),'CorrectPercent~1+drugorder+sex+(1|rati)')
%
'Percent Correct (10 Trials- OFC eGFP)' %(virus x drug order interaction)
glmepc = fitglme(TRIALS10(TRIALS10.virus==0,:),'CorrectPercent~1+drugorder+sex+(1|rati)')
