clear, clc
close all

load('OFC_ALL_OUT_DATA_STATS')
% load('BLA_ALL_OUT_DATA_STATS')
% load('OFC_DIS_SB_OUT_DATA')
% load('BLA_DIS_SB_OUT_DATA')

%%
%Discrimination S-B

%PERCENT CORRECT 

'Percent Correct by Day (Full Model- DIS)'
glmepc = fitglme(SO_resample.tbl_day,'CorrectPercent~1+day*virus*sex+(1+day|rati)')
% 

%%
%%Percent Correct by Day 

%OFC SB STATS

'Percent Correct by Day (OFC Full Model)'
glmepc = fitglme(SO_resample.tbl_day,'CorrectPercent~1+day*phase*virus*drug*drugorder*sex+(1+day*phase*drug|rati)')
% 

'Percent Correct by Day (OFC R1 100-0)'
glmepc = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.phase==1,:),'CorrectPercent~1+day*drug*virus+(1+day|rati)')

'Percent Correct by Day (OFC R2 100-0)'
glmepc = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.phase==2,:),'CorrectPercent~1+day*drug*virus+(1+day|rati)')
     
'Percent Correct by Day (OFC R3 90-10)'
glmepc = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.phase==3,:),'CorrectPercent~1+day*drug*virus+(1+day|rati)')

OFC_R3=(SO_resample.tbl_day(SO_resample.tbl_day.phase==3,:)); 

            'PC POST-HOC (day*virus)- EGFP '
            glmePCEGFP = fitglme(OFC_R3(OFC_R3.virus==0,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=2;
         
            'P for effect of day on EGFP'
            glmePCEGFP.Coefficients.pValue(2)*nTests
            
            'PC POST-HOC (day*virus)- HM4DI '
            glmePCHM4DI = fitglme(OFC_R3(OFC_R3.virus==1,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=2;
         
            'P for effect of day on HM4DI'
            glmePCHM4DI.Coefficients.pValue(2)*nTests

                     
'Percent Correct by Day (OFC R4 90-10)'
glmepc = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.phase==4,:),'CorrectPercent~1+day*drug*virus+(1+day|rati)')

%%
%BLA SB STATS

'Percent Correct by Day (BLA Full Model)'
glmepc = fitglme(SO_resample.tbl_day,'CorrectPercent~1+day*phase*virus*drug*drugorder*sex+(1+day*phase*drug|rati)')
% 
%BLA (day*drug*virus)

            'PC POST-HOC (day*drug*virus)- EGFP+CNO'
            glmePCEGFPCNO = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.virus==0 & SO_resample.tbl_day.drug==1,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=4;
         
            'P for effect of day on EGFP+CNO'
            glmePCEGFPCNO.Coefficients.pValue(2)*nTests
            
            'PC POST-HOC (day*drug*virus)- EGFP+VEH'
            glmePCEGFPVEH = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.virus==0 & SO_resample.tbl_day.drug==0,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=4;
         
            'P for effect of day on EGFP+VEH'
            glmePCEGFPVEH.Coefficients.pValue(2)*nTests
            
            'PC POST-HOC (day*drug*virus)- HM4DI+CNO'
            glmePCHM4DICNO = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.virus==1 &  SO_resample.tbl_day.drug==1,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=4;
         
            'P for effect of day on HM4DI+CNO'
            glmePCHM4DICNO.Coefficients.pValue(2)*nTests
            
             'PC POST-HOC (day*drug*virus)- HM4DI+VEH'
            glmePCHM4DIVEH = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.virus==1 &  SO_resample.tbl_day.drug==0,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=4;
         
            'P for effect of day on HM4DI+VEH'
            glmePCHM4DIVEH.Coefficients.pValue(2)*nTests
%BLA (day*drug)

           'PC POST-HOC (day*drug)- CNO'
            glmePCCNO = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.drug==1,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=2;
         
            'P for effect of CNO on day'
            glmePCCNO.Coefficients.pValue(2)*nTests
            
           'PC POST-HOC (day*drug)- VEH'
            glmePCVEH = fitglme(SO_resample.tbl_day(SO_resample.tbl_day.drug==0,:),'CorrectPercent~1+day+(1+day|rati)')
             nTests=2;
         
            'P for effect of VEH on day'
            glmePCVEH.Coefficients.pValue(2)*nTests
            