clear, clc
close all

losad('ALL_OUT_DATA.mat')

%%
%PERCENT CORRECT - AB D5

%Create Discrimination table from larger mat file 
D100Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==0,:)); 


%%
%OFC SB D5 PC - Discrim
BLADREADD_DPC=D100Trials(D100Trials.brainregion==1 & D100Trials.virus==1,:); %BLA hM4DI OFCDREADDs 

%Create percent correct data tables for DREADDs/eGFP groups 

%Calculate Means & SEMs for each groups in each day


BLADREADD_DPCMean=splitapply(@mean,BLADREADD_DPC.CorrectPercent,BLADREADD_DPC.ContTrial);
BLADREADD_DPCSEM=splitapply(@std,BLADREADD_DPC.CorrectPercent,BLADREADD_DPC.ContTrial)./sqrt(splitapply(@length,BLADREADD_DPC.CorrectPercent,BLADREADD_DPC.ContTrial));

% MovMean (sliding trials of 10)

BLADREADD_DPCmovmean = movmean(BLADREADD_DPCMean,[10 0]); %sliding trials of 10
BLADREADD_DPCmovSEM= movmean(BLADREADD_DPCSEM,[10 0]);

%%

%Plot figure BLA HM4DI DREADD

figure 
plot(1:size(BLADREADD_DPCmovmean),BLADREADD_DPCmovmean,'r-');
hold on
shadedErrorBar(1:length(BLADREADD_DPCmovmean),BLADREADD_DPCmovmean,BLADREADD_DPCmovSEM, 'lineprops', 'r-')

plot([0 150],[0.5,0.5],'--k')
hold off

title('BLA hM4Di Discrimination (100/0)')
legend ({'BLA hM4Di(n=17)'}, 'Location','southwest','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%OFC SB D5 PC - Discrim
OFCDREADD_DPC=D100Trials(D100Trials.brainregion==0 & D100Trials.virus==1,:); %OFC hM4DI OFCDREADDs 

%Create percent correct data tables for DREADDs/eGFP groups 

%Calculate Means & SEMs for each groups in each day


OFCDREADD_DPCMean=splitapply(@mean,OFCDREADD_DPC.CorrectPercent,OFCDREADD_DPC.ContTrial);
OFCDREADD_DPCSEM=splitapply(@std,OFCDREADD_DPC.CorrectPercent,OFCDREADD_DPC.ContTrial)./sqrt(splitapply(@length,OFCDREADD_DPC.CorrectPercent,OFCDREADD_DPC.ContTrial));

% MovMean (sliding trials of 10)

OFCDREADD_DPCmovmean = movmean(OFCDREADD_DPCMean,[10 0]); %sliding trials of 10
OFCDREADD_DPCmovSEM= movmean(OFCDREADD_DPCSEM,[10 0]);

%%

%Plot figure OFC HM4DI DREADD

figure 
plot(1:size(OFCDREADD_DPCmovmean),OFCDREADD_DPCmovmean,'r-');
hold on
shadedErrorBar(1:length(OFCDREADD_DPCmovmean),OFCDREADD_DPCmovmean,OFCDREADD_DPCmovSEM, 'lineprops', 'r-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di Discrimination (100/0)')
legend ({'OFC hM4Di(n=19)'}, 'Location','southwest','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%EGFP SB D5 PC - Discrim

EGFP_DPC=D100Trials(D100Trials.virus==0,:);  %All eGFP Controls

%Create percent correct data tables for DREADDs/eGFP groups 

%Calculate Means & SEMs for each groups in each day

EGFP_DPCMean=splitapply(@mean,EGFP_DPC.CorrectPercent,EGFP_DPC.ContTrial);
EGFP_DPCSEM=splitapply(@std,EGFP_DPC.CorrectPercent,EGFP_DPC.ContTrial)./sqrt(splitapply(@length,EGFP_DPC.CorrectPercent,EGFP_DPC.ContTrial));

% MovMean (sliding trials of 10)

EGFP_DPCmovmean = movmean(EGFP_DPCMean,[10 0]);
EGFP_DPCmovSEM= movmean(EGFP_DPCSEM,[10 0]);

%%

%Plot figure eGFP controls 

figure
plot(1:size(EGFP_DPCmovmean),EGFP_DPCmovmean,'r-');
hold on
shadedErrorBar(1:length(EGFP_DPCmovmean),EGFP_DPCmovmean,EGFP_DPCmovSEM, 'lineprops', 'r-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('eGFP Discrimination (100/0)')
legend ({'eGFP(n=16)'}, 'Location','southwest','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%Create R100 (R1 & R2) & R90 (R3 & R4) table from larger mat file 

R1Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==1,:)); 
R2Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==2,:)); 
R3Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==3,:)); 
R4Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==4,:)); 

%%
%AB D5 PC - R1 

BLADREADDVEH_R1PC=R1Trials(R1Trials.brainregion==1 & R1Trials.virus==1 & R1Trials.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R1PC=R1Trials(R1Trials.brainregion==1 & R1Trials.virus==1 & R1Trials.drug==1,:);  %BLA hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day


BLADREADDCNO_R1PCMean=splitapply(@mean,BLADREADDCNO_R1PC.CorrectPercent,BLADREADDCNO_R1PC.ContTrial);
BLADREADDCNO_R1PCSEM=splitapply(@std,BLADREADDCNO_R1PC.CorrectPercent,BLADREADDCNO_R1PC.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R1PC.CorrectPercent,BLADREADDCNO_R1PC.ContTrial));

BLADREADDVEH_R1PCMean=splitapply(@mean,BLADREADDVEH_R1PC.CorrectPercent,BLADREADDVEH_R1PC.ContTrial);
BLADREADDVEH_R1PCSEM=splitapply(@std,BLADREADDVEH_R1PC.CorrectPercent,BLADREADDVEH_R1PC.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R1PC.CorrectPercent,BLADREADDVEH_R1PC.ContTrial));


% MovMean (sliding trials of 10)


BLADREADDCNO_R1PCmovmean = movmean(BLADREADDCNO_R1PCMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R1PCmovmean = movmean(BLADREADDVEH_R1PCMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R1PCmovSEM= movmean(BLADREADDCNO_R1PCSEM,[10 0]);
BLADREADDVEH_R1PCmovSEM= movmean(BLADREADDVEH_R1PCSEM,[10 0]);


%%
%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R1PCmovmean),BLADREADDCNO_R1PCmovmean,'r-');
hold on
plot(1:size(BLADREADDVEH_R1PCmovmean),BLADREADDVEH_R1PCmovmean,'b-');
shadedErrorBar(1:length(BLADREADDCNO_R1PCmovmean),BLADREADDCNO_R1PCmovmean,BLADREADDCNO_R1PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R1PCmovmean),BLADREADDVEH_R1PCmovmean,BLADREADDVEH_R1PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R1 (100/0)')
legend ({'CNO (n=9)','VEH (n=8)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=5)','VEH (n=3)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%MALE AB R1 

BLADREADDVEH_R1PC_MALE=R1Trials(R1Trials.brainregion==1 & R1Trials.virus==1 & R1Trials.drug==0 & R1Trials.sex==1,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R1PC_MALE=R1Trials(R1Trials.brainregion==1 & R1Trials.virus==1 & R1Trials.drug==1 & R1Trials.sex==1,:);  %BLA hM4DI DREADDs- CNO 

BLADREADDCNO_R1PC_MALEMean=splitapply(@mean,BLADREADDCNO_R1PC_MALE.CorrectPercent,BLADREADDCNO_R1PC_MALE.ContTrial);
BLADREADDCNO_R1PC_MALESEM=splitapply(@std,BLADREADDCNO_R1PC_MALE.CorrectPercent,BLADREADDCNO_R1PC_MALE.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R1PC_MALE.CorrectPercent,BLADREADDCNO_R1PC_MALE.ContTrial));

BLADREADDVEH_R1PC_MALEMean=splitapply(@mean,BLADREADDVEH_R1PC_MALE.CorrectPercent,BLADREADDVEH_R1PC_MALE.ContTrial);
BLADREADDVEH_R1PC_MALESEM=splitapply(@std,BLADREADDVEH_R1PC_MALE.CorrectPercent,BLADREADDVEH_R1PC_MALE.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R1PC_MALE.CorrectPercent,BLADREADDVEH_R1PC_MALE.ContTrial));

BLADREADDCNO_R1PCMALEmovmean = movmean(BLADREADDCNO_R1PC_MALEMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R1PCMALEmovmean = movmean(BLADREADDVEH_R1PC_MALEMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R1PCMALEmovSEM= movmean(BLADREADDCNO_R1PC_MALESEM,[10 0]);
BLADREADDVEH_R1PCMALEmovSEM= movmean(BLADREADDVEH_R1PC_MALESEM,[10 0]);


%%
%Plot figure BLA male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R1PCMALEmovmean),BLADREADDCNO_R1PCMALEmovmean,'r-');
hold on
plot(1:size(BLADREADDVEH_R1PCMALEmovmean),BLADREADDVEH_R1PCMALEmovmean,'c-');
shadedErrorBar(1:length(BLADREADDCNO_R1PCMALEmovmean),BLADREADDCNO_R1PCMALEmovmean,BLADREADDCNO_R1PCMALEmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R1PCMALEmovmean),BLADREADDVEH_R1PCMALEmovmean,BLADREADDVEH_R1PCMALEmovSEM, 'lineprops', 'c-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Male BLA hM4Di R1 (100/0)')
legend ({'CNO (n=4)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=2)','VEH (n=1)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%%
%FEMALE AB R1

BLADREADDVEH_R1PC_FEMALE=R1Trials(R1Trials.brainregion==1 & R1Trials.virus==1 & R1Trials.drug==0 & R1Trials.sex==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R1PC_FEMALE=R1Trials(R1Trials.brainregion==1 & R1Trials.virus==1 & R1Trials.drug==1 & R1Trials.sex==0,:);  %BLA hM4DI DREADDs- CNO 

BLADREADDCNO_R1PC_FEMALEMean=splitapply(@mean,BLADREADDCNO_R1PC_FEMALE.CorrectPercent,BLADREADDCNO_R1PC_FEMALE.ContTrial);
BLADREADDCNO_R1PC_FEMALESEM=splitapply(@std,BLADREADDCNO_R1PC_FEMALE.CorrectPercent,BLADREADDCNO_R1PC_FEMALE.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R1PC_FEMALE.CorrectPercent,BLADREADDCNO_R1PC_FEMALE.ContTrial));

BLADREADDVEH_R1PC_FEMALEMean=splitapply(@mean,BLADREADDVEH_R1PC_FEMALE.CorrectPercent,BLADREADDVEH_R1PC_FEMALE.ContTrial);
BLADREADDVEH_R1PC_FEMALESEM=splitapply(@std,BLADREADDVEH_R1PC_FEMALE.CorrectPercent,BLADREADDVEH_R1PC_FEMALE.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R1PC_FEMALE.CorrectPercent,BLADREADDVEH_R1PC_FEMALE.ContTrial));

BLADREADDCNO_R1PCFEMALEmovmean = movmean(BLADREADDCNO_R1PC_FEMALEMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R1PCFEMALEmovmean = movmean(BLADREADDVEH_R1PC_FEMALEMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R1PCFEMALEmovSEM= movmean(BLADREADDCNO_R1PC_FEMALESEM,[10 0]);
BLADREADDVEH_R1PCFEMALEmovSEM= movmean(BLADREADDVEH_R1PC_FEMALESEM,[10 0]);

%%
%Plot figure BLA female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R1PCFEMALEmovmean),BLADREADDCNO_R1PCFEMALEmovmean,'r-');
hold on
plot(1:size(BLADREADDVEH_R1PCFEMALEmovmean),BLADREADDVEH_R1PCFEMALEmovmean,'c-');
shadedErrorBar(1:length(BLADREADDCNO_R1PCFEMALEmovmean),BLADREADDCNO_R1PCFEMALEmovmean,BLADREADDCNO_R1PCFEMALEmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R1PCFEMALEmovmean),BLADREADDVEH_R1PCFEMALEmovmean,BLADREADDVEH_R1PCFEMALEmovSEM, 'lineprops', 'c-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Female BLA hM4Di R1 (100/0)')
legend ({'CNO (n=5)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=3)','VEH (n=2)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R1 

OFCDREADDVEH_R1PC=R1Trials(R1Trials.brainregion==0 & R1Trials.virus==1 & R1Trials.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R1PC=R1Trials(R1Trials.brainregion==0 & R1Trials.virus==1 & R1Trials.drug==1,:);  %OFC hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day


OFCDREADDCNO_R1PCMean=splitapply(@mean,OFCDREADDCNO_R1PC.CorrectPercent,OFCDREADDCNO_R1PC.ContTrial);
OFCDREADDCNO_R1PCSEM=splitapply(@std,OFCDREADDCNO_R1PC.CorrectPercent,OFCDREADDCNO_R1PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R1PC.CorrectPercent,OFCDREADDCNO_R1PC.ContTrial));

OFCDREADDVEH_R1PCMean=splitapply(@mean,OFCDREADDVEH_R1PC.CorrectPercent,OFCDREADDVEH_R1PC.ContTrial);
OFCDREADDVEH_R1PCSEM=splitapply(@std,OFCDREADDVEH_R1PC.CorrectPercent,OFCDREADDVEH_R1PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R1PC.CorrectPercent,OFCDREADDVEH_R1PC.ContTrial));


% MovMean (sliding trials of 10)


OFCDREADDCNO_R1PCmovmean = movmean(OFCDREADDCNO_R1PCMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R1PCmovmean = movmean(OFCDREADDVEH_R1PCMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R1PCmovSEM= movmean(OFCDREADDCNO_R1PCSEM,[10 0]);
OFCDREADDVEH_R1PCmovSEM= movmean(OFCDREADDVEH_R1PCSEM,[10 0]);


%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R1PCmovmean),OFCDREADDCNO_R1PCmovmean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R1PCmovmean),OFCDREADDVEH_R1PCmovmean,'b-');
shadedErrorBar(1:length(OFCDREADDCNO_R1PCmovmean),OFCDREADDCNO_R1PCmovmean,OFCDREADDCNO_R1PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R1PCmovmean),OFCDREADDVEH_R1PCmovmean,OFCDREADDVEH_R1PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R1 (100/0)')
legend ({'CNO (n=10)','VEH (n=9)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%MALE AB R1 

OFCDREADDVEH_R1PC_MALE=R1Trials(R1Trials.brainregion==0 & R1Trials.virus==1 & R1Trials.drug==0 & R1Trials.sex==1,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R1PC_MALE=R1Trials(R1Trials.brainregion==0 & R1Trials.virus==1 & R1Trials.drug==1 & R1Trials.sex==1,:);  %OFC hM4DI DREADDs- CNO 

OFCDREADDCNO_R1PC_MALEMean=splitapply(@mean,OFCDREADDCNO_R1PC_MALE.CorrectPercent,OFCDREADDCNO_R1PC_MALE.ContTrial);
OFCDREADDCNO_R1PC_MALESEM=splitapply(@std,OFCDREADDCNO_R1PC_MALE.CorrectPercent,OFCDREADDCNO_R1PC_MALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R1PC_MALE.CorrectPercent,OFCDREADDCNO_R1PC_MALE.ContTrial));

OFCDREADDVEH_R1PC_MALEMean=splitapply(@mean,OFCDREADDVEH_R1PC_MALE.CorrectPercent,OFCDREADDVEH_R1PC_MALE.ContTrial);
OFCDREADDVEH_R1PC_MALESEM=splitapply(@std,OFCDREADDVEH_R1PC_MALE.CorrectPercent,OFCDREADDVEH_R1PC_MALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R1PC_MALE.CorrectPercent,OFCDREADDVEH_R1PC_MALE.ContTrial));

OFCDREADDCNO_R1PCMALEmovmean = movmean(OFCDREADDCNO_R1PC_MALEMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R1PCMALEmovmean = movmean(OFCDREADDVEH_R1PC_MALEMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R1PCMALEmovSEM= movmean(OFCDREADDCNO_R1PC_MALESEM,[10 0]);
OFCDREADDVEH_R1PCMALEmovSEM= movmean(OFCDREADDVEH_R1PC_MALESEM,[10 0]);


%%
%Plot figure OFC male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R1PCMALEmovmean),OFCDREADDCNO_R1PCMALEmovmean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R1PCMALEmovmean),OFCDREADDVEH_R1PCMALEmovmean,'c-');
shadedErrorBar(1:length(OFCDREADDCNO_R1PCMALEmovmean),OFCDREADDCNO_R1PCMALEmovmean,OFCDREADDCNO_R1PCMALEmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R1PCMALEmovmean),OFCDREADDVEH_R1PCMALEmovmean,OFCDREADDVEH_R1PCMALEmovSEM, 'lineprops', 'c-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Male OFC hM4Di R1 (100/0)')
legend ({'CNO (n=5)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%%
%FEMALE AB R1

OFCDREADDVEH_R1PC_FEMALE=R1Trials(R1Trials.brainregion==0 & R1Trials.virus==1 & R1Trials.drug==0 & R1Trials.sex==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R1PC_FEMALE=R1Trials(R1Trials.brainregion==0 & R1Trials.virus==1 & R1Trials.drug==1 & R1Trials.sex==0,:);  %OFC hM4DI DREADDs- CNO 

OFCDREADDCNO_R1PC_FEMALEMean=splitapply(@mean,OFCDREADDCNO_R1PC_FEMALE.CorrectPercent,OFCDREADDCNO_R1PC_FEMALE.ContTrial);
OFCDREADDCNO_R1PC_FEMALESEM=splitapply(@std,OFCDREADDCNO_R1PC_FEMALE.CorrectPercent,OFCDREADDCNO_R1PC_FEMALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R1PC_FEMALE.CorrectPercent,OFCDREADDCNO_R1PC_FEMALE.ContTrial));

OFCDREADDVEH_R1PC_FEMALEMean=splitapply(@mean,OFCDREADDVEH_R1PC_FEMALE.CorrectPercent,OFCDREADDVEH_R1PC_FEMALE.ContTrial);
OFCDREADDVEH_R1PC_FEMALESEM=splitapply(@std,OFCDREADDVEH_R1PC_FEMALE.CorrectPercent,OFCDREADDVEH_R1PC_FEMALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R1PC_FEMALE.CorrectPercent,OFCDREADDVEH_R1PC_FEMALE.ContTrial));

OFCDREADDCNO_R1PCFEMALEmovmean = movmean(OFCDREADDCNO_R1PC_FEMALEMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R1PCFEMALEmovmean = movmean(OFCDREADDVEH_R1PC_FEMALEMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R1PCFEMALEmovSEM= movmean(OFCDREADDCNO_R1PC_FEMALESEM,[10 0]);
OFCDREADDVEH_R1PCFEMALEmovSEM= movmean(OFCDREADDVEH_R1PC_FEMALESEM,[10 0]);

%%
%Plot figure OFC female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R1PCFEMALEmovmean),OFCDREADDCNO_R1PCFEMALEmovmean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R1PCFEMALEmovmean),OFCDREADDVEH_R1PCFEMALEmovmean,'c-');
shadedErrorBar(1:length(OFCDREADDCNO_R1PCFEMALEmovmean),OFCDREADDCNO_R1PCFEMALEmovmean,OFCDREADDCNO_R1PCFEMALEmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R1PCFEMALEmovmean),OFCDREADDVEH_R1PCFEMALEmovmean,OFCDREADDVEH_R1PCFEMALEmovSEM, 'lineprops', 'c-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Female OFC hM4Di R1 (100/0)')
legend ({'CNO (n=5)','VEH (n=5)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R1 

EGFPVEH_R1PC=R1Trials(R1Trials.virus==0 & R1Trials.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R1PC=R1Trials(R1Trials.virus==0 & R1Trials.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

EGFPCNO_R1PCMean=splitapply(@mean,EGFPCNO_R1PC.CorrectPercent,EGFPCNO_R1PC.ContTrial);
EGFPCNO_R1PCSEM=splitapply(@std,EGFPCNO_R1PC.CorrectPercent,EGFPCNO_R1PC.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R1PC.CorrectPercent,EGFPCNO_R1PC.ContTrial));

EGFPVEH_R1PCMean=splitapply(@mean,EGFPVEH_R1PC.CorrectPercent,EGFPVEH_R1PC.ContTrial);
EGFPVEH_R1PCSEM=splitapply(@std,EGFPVEH_R1PC.CorrectPercent,EGFPVEH_R1PC.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R1PC.CorrectPercent,EGFPVEH_R1PC.ContTrial));

% MovMean (sliding trials of 10)

EGFPCNO_R1PCmovmean = movmean(EGFPCNO_R1PCMean,[10 0]);
EGFPVEH_R1PCmovmean = movmean(EGFPVEH_R1PCMean,[10 0]);

EGFPCNO_R1PCmovSEM = movmean(EGFPCNO_R1PCSEM,[10 0]);
EGFPVEH_R1PCmovSEM = movmean(EGFPVEH_R1PCSEM,[10 0]);

%%
%Plot figure EGFP (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R1PCmovmean),EGFPCNO_R1PCmovmean,'r-');
hold on
plot(1:size(EGFPVEH_R1PCmovmean),EGFPVEH_R1PCmovmean,'b-');
shadedErrorBar(1:length(EGFPCNO_R1PCmovmean),EGFPCNO_R1PCmovmean,EGFPCNO_R1PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R1PCmovmean),EGFPVEH_R1PCmovmean,EGFPVEH_R1PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('eGFP R1 (100/0)')
legend ({'CNO (n=6)','VEH (n=10)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%MALE AB R1 

EGFPVEH_R1PC_MALE=R1Trials(R1Trials.virus==0 & R1Trials.drug==0 & R1Trials.sex==1,:); %EGFP- VEH 
EGFPCNO_R1PC_MALE=R1Trials(R1Trials.virus==0 & R1Trials.drug==1 & R1Trials.sex==1,:);  %EGFP- CNO 

EGFPCNO_R1PC_MALEMean=splitapply(@mean,EGFPCNO_R1PC_MALE.CorrectPercent,EGFPCNO_R1PC_MALE.ContTrial);
EGFPCNO_R1PC_MALESEM=splitapply(@std,EGFPCNO_R1PC_MALE.CorrectPercent,EGFPCNO_R1PC_MALE.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R1PC_MALE.CorrectPercent,EGFPCNO_R1PC_MALE.ContTrial));

EGFPVEH_R1PC_MALEMean=splitapply(@mean,EGFPVEH_R1PC_MALE.CorrectPercent,EGFPVEH_R1PC_MALE.ContTrial);
EGFPVEH_R1PC_MALESEM=splitapply(@std,EGFPVEH_R1PC_MALE.CorrectPercent,EGFPVEH_R1PC_MALE.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R1PC_MALE.CorrectPercent,EGFPVEH_R1PC_MALE.ContTrial));

EGFPCNO_R1PCMALEmovmean = movmean(EGFPCNO_R1PC_MALEMean,[10 0]); %sliding trials of 10
EGFPVEH_R1PCMALEmovmean = movmean(EGFPVEH_R1PC_MALEMean,[10 0]); %sliding trials of 10

EGFPCNO_R1PCMALEmovSEM= movmean(EGFPCNO_R1PC_MALESEM,[10 0]);
EGFPVEH_R1PCMALEmovSEM= movmean(EGFPVEH_R1PC_MALESEM,[10 0]);

%%
%Plot figure EGFP male (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R1PCMALEmovmean),EGFPCNO_R1PCMALEmovmean,'r-');
hold on
plot(1:size(EGFPVEH_R1PCMALEmovmean),EGFPVEH_R1PCMALEmovmean,'c-');
shadedErrorBar(1:length(EGFPCNO_R1PCMALEmovmean),EGFPCNO_R1PCMALEmovmean,EGFPCNO_R1PCMALEmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R1PCMALEmovmean),EGFPVEH_R1PCMALEmovmean,EGFPVEH_R1PCMALEmovSEM, 'lineprops', 'c-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Male eGFP R1 (100/0)')
legend ({'CNO (n=3)','VEH (n=6)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%FEMALE AB R1

EGFPVEH_R1PC_FEMALE=R1Trials(R1Trials.virus==0 & R1Trials.drug==0 & R1Trials.sex==0,:); %EGFP- VEH 
EGFPCNO_R1PC_FEMALE=R1Trials(R1Trials.virus==0 & R1Trials.drug==1 & R1Trials.sex==0,:);  %EGFP- CNO 

EGFPCNO_R1PC_FEMALEMean=splitapply(@mean,EGFPCNO_R1PC_FEMALE.CorrectPercent,EGFPCNO_R1PC_FEMALE.ContTrial);
EGFPCNO_R1PC_FEMALESEM=splitapply(@std,EGFPCNO_R1PC_FEMALE.CorrectPercent,EGFPCNO_R1PC_FEMALE.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R1PC_FEMALE.CorrectPercent,EGFPCNO_R1PC_FEMALE.ContTrial));

EGFPVEH_R1PC_FEMALEMean=splitapply(@mean,EGFPVEH_R1PC_FEMALE.CorrectPercent,EGFPVEH_R1PC_FEMALE.ContTrial);
EGFPVEH_R1PC_FEMALESEM=splitapply(@std,EGFPVEH_R1PC_FEMALE.CorrectPercent,EGFPVEH_R1PC_FEMALE.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R1PC_FEMALE.CorrectPercent,EGFPVEH_R1PC_FEMALE.ContTrial));

EGFPCNO_R1PCFEMALEmovmean = movmean(EGFPCNO_R1PC_FEMALEMean,[10 0]); %sliding trials of 10
EGFPVEH_R1PCFEMALEmovmean = movmean(EGFPVEH_R1PC_FEMALEMean,[10 0]); %sliding trials of 10

EGFPCNO_R1PCFEMALEmovSEM= movmean(EGFPCNO_R1PC_FEMALESEM,[10 0]);
EGFPVEH_R1PCFEMALEmovSEM= movmean(EGFPVEH_R1PC_FEMALESEM,[10 0]);

%%
%Plot figure EGFP female (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R1PCFEMALEmovmean),EGFPCNO_R1PCFEMALEmovmean,'r-');
hold on
plot(1:size(EGFPVEH_R1PCFEMALEmovmean),EGFPVEH_R1PCFEMALEmovmean,'c-');
shadedErrorBar(1:length(EGFPCNO_R1PCFEMALEmovmean),EGFPCNO_R1PCFEMALEmovmean,EGFPCNO_R1PCFEMALEmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R1PCFEMALEmovmean),EGFPVEH_R1PCFEMALEmovmean,EGFPVEH_R1PCFEMALEmovSEM, 'lineprops', 'c-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Female eGFP R1 (100/0)')
legend ({'CNO (n=3)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R2 

BLADREADDVEH_R2PC=R2Trials(R2Trials.brainregion==1 & R2Trials.virus==1 & R2Trials.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R2PC=R2Trials(R2Trials.brainregion==1 & R2Trials.virus==1 & R2Trials.drug==1,:);  %BLA hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R2PCMean=splitapply(@mean,BLADREADDCNO_R2PC.CorrectPercent,BLADREADDCNO_R2PC.ContTrial);
BLADREADDCNO_R2PCSEM=splitapply(@std,BLADREADDCNO_R2PC.CorrectPercent,BLADREADDCNO_R2PC.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R2PC.CorrectPercent,BLADREADDCNO_R2PC.ContTrial));

BLADREADDVEH_R2PCMean=splitapply(@mean,BLADREADDVEH_R2PC.CorrectPercent,BLADREADDVEH_R2PC.ContTrial);
BLADREADDVEH_R2PCSEM=splitapply(@std,BLADREADDVEH_R2PC.CorrectPercent,BLADREADDVEH_R2PC.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R2PC.CorrectPercent,BLADREADDVEH_R2PC.ContTrial));

% MovMean (sliding trials of 10)

BLADREADDCNO_R2PCmovmean = movmean(BLADREADDCNO_R2PCMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R2PCmovmean = movmean(BLADREADDVEH_R2PCMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R2PCmovSEM= movmean(BLADREADDCNO_R2PCSEM,[10 0]);
BLADREADDVEH_R2PCmovSEM= movmean(BLADREADDVEH_R2PCSEM,[10 0]);


%%
%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R2PCmovmean),BLADREADDCNO_R2PCmovmean,'r-');
hold on
plot(1:size(BLADREADDVEH_R2PCmovmean),BLADREADDVEH_R2PCmovmean,'b-');
shadedErrorBar(1:length(BLADREADDCNO_R2PCmovmean),BLADREADDCNO_R2PCmovmean,BLADREADDCNO_R2PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R2PCmovmean),BLADREADDVEH_R2PCmovmean,BLADREADDVEH_R2PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R2 (100/0)')
legend ({'CNO (n=8)','VEH (n=9)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=3)','VEH (n=5)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R2 

OFCDREADDVEH_R2PC=R2Trials(R2Trials.brainregion==0 & R2Trials.virus==1 & R2Trials.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R2PC=R2Trials(R2Trials.brainregion==0 & R2Trials.virus==1 & R2Trials.drug==1,:);  %OFC hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R2PCMean=splitapply(@mean,OFCDREADDCNO_R2PC.CorrectPercent,OFCDREADDCNO_R2PC.ContTrial);
OFCDREADDCNO_R2PCSEM=splitapply(@std,OFCDREADDCNO_R2PC.CorrectPercent,OFCDREADDCNO_R2PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R2PC.CorrectPercent,OFCDREADDCNO_R2PC.ContTrial));

OFCDREADDVEH_R2PCMean=splitapply(@mean,OFCDREADDVEH_R2PC.CorrectPercent,OFCDREADDVEH_R2PC.ContTrial);
OFCDREADDVEH_R2PCSEM=splitapply(@std,OFCDREADDVEH_R2PC.CorrectPercent,OFCDREADDVEH_R2PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R2PC.CorrectPercent,OFCDREADDVEH_R2PC.ContTrial));

% MovMean (sliding trials of 10)

OFCDREADDCNO_R2PCmovmean = movmean(OFCDREADDCNO_R2PCMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R2PCmovmean = movmean(OFCDREADDVEH_R2PCMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R2PCmovSEM= movmean(OFCDREADDCNO_R2PCSEM,[10 0]);
OFCDREADDVEH_R2PCmovSEM= movmean(OFCDREADDVEH_R2PCSEM,[10 0]);


%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R2PCmovmean),OFCDREADDCNO_R2PCmovmean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R2PCmovmean),OFCDREADDVEH_R2PCmovmean,'b-');
shadedErrorBar(1:length(OFCDREADDCNO_R2PCmovmean),OFCDREADDCNO_R2PCmovmean,OFCDREADDCNO_R2PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R2PCmovmean),OFCDREADDVEH_R2PCmovmean,OFCDREADDVEH_R2PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R2 (100/0)')
legend ({'CNO (n=9)','VEH (n=10)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R2 

EGFPVEH_R2PC=R2Trials(R2Trials.virus==0 & R2Trials.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R2PC=R2Trials(R2Trials.virus==0 & R2Trials.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day


EGFPCNO_R2PCMean=splitapply(@mean,EGFPCNO_R2PC.CorrectPercent,EGFPCNO_R2PC.ContTrial);
EGFPCNO_R2PCSEM=splitapply(@std,EGFPCNO_R2PC.CorrectPercent,EGFPCNO_R2PC.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R2PC.CorrectPercent,EGFPCNO_R2PC.ContTrial));

EGFPVEH_R2PCMean=splitapply(@mean,EGFPVEH_R2PC.CorrectPercent,EGFPVEH_R2PC.ContTrial);
EGFPVEH_R2PCSEM=splitapply(@std,EGFPVEH_R2PC.CorrectPercent,EGFPVEH_R2PC.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R2PC.CorrectPercent,EGFPVEH_R2PC.ContTrial));

% MovMean (sliding trials of 10)


EGFPCNO_R2PCmovmean = movmean(EGFPCNO_R2PCMean,[10 0]);
EGFPVEH_R2PCmovmean = movmean(EGFPVEH_R2PCMean,[10 0]);

EGFPCNO_R2PCmovSEM = movmean(EGFPCNO_R2PCSEM,[10 0]);
EGFPVEH_R2PCmovSEM = movmean(EGFPVEH_R2PCSEM,[10 0]);

%%
%Plot figure EGFP (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R2PCmovmean),EGFPCNO_R2PCmovmean,'r-');
hold on
plot(1:size(EGFPVEH_R2PCmovmean),EGFPVEH_R2PCmovmean,'b-');
shadedErrorBar(1:length(EGFPCNO_R2PCmovmean),EGFPCNO_R2PCmovmean,EGFPCNO_R2PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R2PCmovmean),EGFPVEH_R2PCmovmean,EGFPVEH_R2PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('eGFP R2 (100/0)')
legend ({'CNO (n=10)','VEH (n=6)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R3 

BLADREADDVEH_R3PC=R3Trials(R3Trials.brainregion==1 & R3Trials.virus==1 & R3Trials.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R3PC=R3Trials(R3Trials.brainregion==1 & R3Trials.virus==1 & R3Trials.drug==1,:);  %BLA hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day
BLADREADDCNO_R3PCMean=splitapply(@mean,BLADREADDCNO_R3PC.CorrectPercent,BLADREADDCNO_R3PC.ContTrial);
BLADREADDCNO_R3PCSEM=splitapply(@std,BLADREADDCNO_R3PC.CorrectPercent,BLADREADDCNO_R3PC.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R3PC.CorrectPercent,BLADREADDCNO_R3PC.ContTrial));

BLADREADDVEH_R3PCMean=splitapply(@mean,BLADREADDVEH_R3PC.CorrectPercent,BLADREADDVEH_R3PC.ContTrial);
BLADREADDVEH_R3PCSEM=splitapply(@std,BLADREADDVEH_R3PC.CorrectPercent,BLADREADDVEH_R3PC.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R3PC.CorrectPercent,BLADREADDVEH_R3PC.ContTrial));

% MovMean (sliding trials of 10)

BLADREADDCNO_R3PCmovmean = movmean(BLADREADDCNO_R3PCMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R3PCmovmean = movmean(BLADREADDVEH_R3PCMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R3PCmovSEM= movmean(BLADREADDCNO_R3PCSEM,[10 0]);
BLADREADDVEH_R3PCmovSEM= movmean(BLADREADDVEH_R3PCSEM,[10 0]);



%%
%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R3PCmovmean),BLADREADDCNO_R3PCmovmean,'r-');
hold on
plot(1:size(BLADREADDVEH_R3PCmovmean),BLADREADDVEH_R3PCmovmean,'b-');
shadedErrorBar(1:length(BLADREADDCNO_R3PCmovmean),BLADREADDCNO_R3PCmovmean,BLADREADDCNO_R3PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R3PCmovmean),BLADREADDVEH_R3PCmovmean,BLADREADDVEH_R3PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R3 (90/10)')
legend ({'CNO (n=9)','VEH (n=8)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=6)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=4)','VEH (n=2)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=5)','VEH (n=3)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%MALE AB R3 

BLADREADDVEH_R3PC_MALE=R3Trials(R3Trials.brainregion==1 & R3Trials.virus==1 & R3Trials.drug==0 & R3Trials.sex==1,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R3PC_MALE=R3Trials(R3Trials.brainregion==1 & R3Trials.virus==1 & R3Trials.drug==1 & R3Trials.sex==1,:);  %BLA hM4DI DREADDs- CNO 

BLADREADDCNO_R3PC_MALEMean=splitapply(@mean,BLADREADDCNO_R3PC_MALE.CorrectPercent,BLADREADDCNO_R3PC_MALE.ContTrial);
BLADREADDCNO_R3PC_MALESEM=splitapply(@std,BLADREADDCNO_R3PC_MALE.CorrectPercent,BLADREADDCNO_R3PC_MALE.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R3PC_MALE.CorrectPercent,BLADREADDCNO_R3PC_MALE.ContTrial));

BLADREADDVEH_R3PC_MALEMean=splitapply(@mean,BLADREADDVEH_R3PC_MALE.CorrectPercent,BLADREADDVEH_R3PC_MALE.ContTrial);
BLADREADDVEH_R3PC_MALESEM=splitapply(@std,BLADREADDVEH_R3PC_MALE.CorrectPercent,BLADREADDVEH_R3PC_MALE.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R3PC_MALE.CorrectPercent,BLADREADDVEH_R3PC_MALE.ContTrial));

BLADREADDCNO_R3PCMALEmovmean = movmean(BLADREADDCNO_R3PC_MALEMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R3PCMALEmovmean = movmean(BLADREADDVEH_R3PC_MALEMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R3PCMALEmovSEM= movmean(BLADREADDCNO_R3PC_MALESEM,[10 0]);
BLADREADDVEH_R3PCMALEmovSEM= movmean(BLADREADDVEH_R3PC_MALESEM,[10 0]);

%%
%Plot figure BLA male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R3PCMALEmovmean),BLADREADDCNO_R3PCMALEmovmean,'b-');
hold on
plot(1:size(BLADREADDVEH_R3PCMALEmovmean),BLADREADDVEH_R3PCMALEmovmean,'g-');
shadedErrorBar(1:length(BLADREADDCNO_R3PCMALEmovmean),BLADREADDCNO_R3PCMALEmovmean,BLADREADDCNO_R3PCMALEmovSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(BLADREADDVEH_R3PCMALEmovmean),BLADREADDVEH_R3PCMALEmovmean,BLADREADDVEH_R3PCMALEmovSEM, 'lineprops', 'g-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Male BLA hM4Di R3 (90/10)')
legend ({'CNO (n=4)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=2)','VEH (n=1)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=2)','VEH (n=1)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')



%%
%FEMALE AB R3

BLADREADDVEH_R3PC_FEMALE=R3Trials(R3Trials.brainregion==1 & R3Trials.virus==1 & R3Trials.drug==0 & R3Trials.sex==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R3PC_FEMALE=R3Trials(R3Trials.brainregion==1 & R3Trials.virus==1 & R3Trials.drug==1 & R3Trials.sex==0,:);  %BLA hM4DI DREADDs- CNO 

BLADREADDCNO_R3PC_FEMALEMean=splitapply(@mean,BLADREADDCNO_R3PC_FEMALE.CorrectPercent,BLADREADDCNO_R3PC_FEMALE.ContTrial);
BLADREADDCNO_R3PC_FEMALESEM=splitapply(@std,BLADREADDCNO_R3PC_FEMALE.CorrectPercent,BLADREADDCNO_R3PC_FEMALE.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R3PC_FEMALE.CorrectPercent,BLADREADDCNO_R3PC_FEMALE.ContTrial));

BLADREADDVEH_R3PC_FEMALEMean=splitapply(@mean,BLADREADDVEH_R3PC_FEMALE.CorrectPercent,BLADREADDVEH_R3PC_FEMALE.ContTrial);
BLADREADDVEH_R3PC_FEMALESEM=splitapply(@std,BLADREADDVEH_R3PC_FEMALE.CorrectPercent,BLADREADDVEH_R3PC_FEMALE.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R3PC_FEMALE.CorrectPercent,BLADREADDVEH_R3PC_FEMALE.ContTrial));

BLADREADDCNO_R3PCFEMALEmovmean = movmean(BLADREADDCNO_R3PC_FEMALEMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R3PCFEMALEmovmean = movmean(BLADREADDVEH_R3PC_FEMALEMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R3PCFEMALEmovSEM= movmean(BLADREADDCNO_R3PC_FEMALESEM,[10 0]);
BLADREADDVEH_R3PCFEMALEmovSEM= movmean(BLADREADDVEH_R3PC_FEMALESEM,[10 0]);



%%
%Plot figure BLA female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R3PCFEMALEmovmean),BLADREADDCNO_R3PCFEMALEmovmean,'b-');
hold on
plot(1:size(BLADREADDVEH_R3PCFEMALEmovmean),BLADREADDVEH_R3PCFEMALEmovmean,'g-');
shadedErrorBar(1:length(BLADREADDCNO_R3PCFEMALEmovmean),BLADREADDCNO_R3PCFEMALEmovmean,BLADREADDCNO_R3PCFEMALEmovSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(BLADREADDVEH_R3PCFEMALEmovmean),BLADREADDVEH_R3PCFEMALEmovmean,BLADREADDVEH_R3PCFEMALEmovSEM, 'lineprops', 'g-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Female BLA hM4Di R3 (90/10)')
legend ({'CNO (n=5)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=2)','VEH (n=1)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
% legend ({'CNO (n=3)','VEH (n=2)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R3 

OFCDREADDVEH_R3PC=R3Trials(R3Trials.brainregion==0 & R3Trials.virus==1 & R3Trials.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R3PC=R3Trials(R3Trials.brainregion==0 & R3Trials.virus==1 & R3Trials.drug==1,:);  %OFC hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day
OFCDREADDCNO_R3PCMean=splitapply(@mean,OFCDREADDCNO_R3PC.CorrectPercent,OFCDREADDCNO_R3PC.ContTrial);
OFCDREADDCNO_R3PCSEM=splitapply(@std,OFCDREADDCNO_R3PC.CorrectPercent,OFCDREADDCNO_R3PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R3PC.CorrectPercent,OFCDREADDCNO_R3PC.ContTrial));

OFCDREADDVEH_R3PCMean=splitapply(@mean,OFCDREADDVEH_R3PC.CorrectPercent,OFCDREADDVEH_R3PC.ContTrial);
OFCDREADDVEH_R3PCSEM=splitapply(@std,OFCDREADDVEH_R3PC.CorrectPercent,OFCDREADDVEH_R3PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R3PC.CorrectPercent,OFCDREADDVEH_R3PC.ContTrial));

% MovMean (sliding trials of 10)

OFCDREADDCNO_R3PCmovmean = movmean(OFCDREADDCNO_R3PCMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R3PCmovmean = movmean(OFCDREADDVEH_R3PCMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R3PCmovSEM= movmean(OFCDREADDCNO_R3PCSEM,[10 0]);
OFCDREADDVEH_R3PCmovSEM= movmean(OFCDREADDVEH_R3PCSEM,[10 0]);



%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R3PCmovmean),OFCDREADDCNO_R3PCmovmean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R3PCmovmean),OFCDREADDVEH_R3PCmovmean,'b-');
shadedErrorBar(1:length(OFCDREADDCNO_R3PCmovmean),OFCDREADDCNO_R3PCmovmean,OFCDREADDCNO_R3PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R3PCmovmean),OFCDREADDVEH_R3PCmovmean,OFCDREADDVEH_R3PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R3 (90/10)')
legend ({'CNO (n=10)','VEH (n=9)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%MALE AB R3 

OFCDREADDVEH_R3PC_MALE=R3Trials(R3Trials.brainregion==0 & R3Trials.virus==1 & R3Trials.drug==0 & R3Trials.sex==1,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R3PC_MALE=R3Trials(R3Trials.brainregion==0 & R3Trials.virus==1 & R3Trials.drug==1 & R3Trials.sex==1,:);  %OFC hM4DI DREADDs- CNO 

OFCDREADDCNO_R3PC_MALEMean=splitapply(@mean,OFCDREADDCNO_R3PC_MALE.CorrectPercent,OFCDREADDCNO_R3PC_MALE.ContTrial);
OFCDREADDCNO_R3PC_MALESEM=splitapply(@std,OFCDREADDCNO_R3PC_MALE.CorrectPercent,OFCDREADDCNO_R3PC_MALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R3PC_MALE.CorrectPercent,OFCDREADDCNO_R3PC_MALE.ContTrial));

OFCDREADDVEH_R3PC_MALEMean=splitapply(@mean,OFCDREADDVEH_R3PC_MALE.CorrectPercent,OFCDREADDVEH_R3PC_MALE.ContTrial);
OFCDREADDVEH_R3PC_MALESEM=splitapply(@std,OFCDREADDVEH_R3PC_MALE.CorrectPercent,OFCDREADDVEH_R3PC_MALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R3PC_MALE.CorrectPercent,OFCDREADDVEH_R3PC_MALE.ContTrial));

OFCDREADDCNO_R3PCMALEmovmean = movmean(OFCDREADDCNO_R3PC_MALEMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R3PCMALEmovmean = movmean(OFCDREADDVEH_R3PC_MALEMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R3PCMALEmovSEM= movmean(OFCDREADDCNO_R3PC_MALESEM,[10 0]);
OFCDREADDVEH_R3PCMALEmovSEM= movmean(OFCDREADDVEH_R3PC_MALESEM,[10 0]);

%%
%Plot figure OFC male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R3PCMALEmovmean),OFCDREADDCNO_R3PCMALEmovmean,'b-');
hold on
plot(1:size(OFCDREADDVEH_R3PCMALEmovmean),OFCDREADDVEH_R3PCMALEmovmean,'g-');
shadedErrorBar(1:length(OFCDREADDCNO_R3PCMALEmovmean),OFCDREADDCNO_R3PCMALEmovmean,OFCDREADDCNO_R3PCMALEmovSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(OFCDREADDVEH_R3PCMALEmovmean),OFCDREADDVEH_R3PCMALEmovmean,OFCDREADDVEH_R3PCMALEmovSEM, 'lineprops', 'g-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Male OFC hM4Di R3 (90/10)')
legend ({'CNO (n=5)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')



%%
%FEMALE AB R3

OFCDREADDVEH_R3PC_FEMALE=R3Trials(R3Trials.brainregion==0 & R3Trials.virus==1 & R3Trials.drug==0 & R3Trials.sex==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R3PC_FEMALE=R3Trials(R3Trials.brainregion==0 & R3Trials.virus==1 & R3Trials.drug==1 & R3Trials.sex==0,:);  %OFC hM4DI DREADDs- CNO 

OFCDREADDCNO_R3PC_FEMALEMean=splitapply(@mean,OFCDREADDCNO_R3PC_FEMALE.CorrectPercent,OFCDREADDCNO_R3PC_FEMALE.ContTrial);
OFCDREADDCNO_R3PC_FEMALESEM=splitapply(@std,OFCDREADDCNO_R3PC_FEMALE.CorrectPercent,OFCDREADDCNO_R3PC_FEMALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R3PC_FEMALE.CorrectPercent,OFCDREADDCNO_R3PC_FEMALE.ContTrial));

OFCDREADDVEH_R3PC_FEMALEMean=splitapply(@mean,OFCDREADDVEH_R3PC_FEMALE.CorrectPercent,OFCDREADDVEH_R3PC_FEMALE.ContTrial);
OFCDREADDVEH_R3PC_FEMALESEM=splitapply(@std,OFCDREADDVEH_R3PC_FEMALE.CorrectPercent,OFCDREADDVEH_R3PC_FEMALE.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R3PC_FEMALE.CorrectPercent,OFCDREADDVEH_R3PC_FEMALE.ContTrial));

OFCDREADDCNO_R3PCFEMALEmovmean = movmean(OFCDREADDCNO_R3PC_FEMALEMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R3PCFEMALEmovmean = movmean(OFCDREADDVEH_R3PC_FEMALEMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R3PCFEMALEmovSEM= movmean(OFCDREADDCNO_R3PC_FEMALESEM,[10 0]);
OFCDREADDVEH_R3PCFEMALEmovSEM= movmean(OFCDREADDVEH_R3PC_FEMALESEM,[10 0]);



%%
%Plot figure OFC female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R3PCFEMALEmovmean),OFCDREADDCNO_R3PCFEMALEmovmean,'b-');
hold on
plot(1:size(OFCDREADDVEH_R3PCFEMALEmovmean),OFCDREADDVEH_R3PCFEMALEmovmean,'g-');
shadedErrorBar(1:length(OFCDREADDCNO_R3PCFEMALEmovmean),OFCDREADDCNO_R3PCFEMALEmovmean,OFCDREADDCNO_R3PCFEMALEmovSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(OFCDREADDVEH_R3PCFEMALEmovmean),OFCDREADDVEH_R3PCFEMALEmovmean,OFCDREADDVEH_R3PCFEMALEmovSEM, 'lineprops', 'g-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Female OFC hM4Di R3 (90/10)')
legend ({'CNO (n=5)','VEH (n=5)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R3 

EGFPVEH_R3PC=R3Trials(R3Trials.virus==0 & R3Trials.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R3PC=R3Trials(R3Trials.virus==0 & R3Trials.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

EGFPCNO_R3PCMean=splitapply(@mean,EGFPCNO_R3PC.CorrectPercent,EGFPCNO_R3PC.ContTrial);
EGFPCNO_R3PCSEM=splitapply(@std,EGFPCNO_R3PC.CorrectPercent,EGFPCNO_R3PC.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R3PC.CorrectPercent,EGFPCNO_R3PC.ContTrial));

EGFPVEH_R3PCMean=splitapply(@mean,EGFPVEH_R3PC.CorrectPercent,EGFPVEH_R3PC.ContTrial);
EGFPVEH_R3PCSEM=splitapply(@std,EGFPVEH_R3PC.CorrectPercent,EGFPVEH_R3PC.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R3PC.CorrectPercent,EGFPVEH_R3PC.ContTrial));

% MovMean (sliding trials of 10)

EGFPCNO_R3PCmovmean = movmean(EGFPCNO_R3PCMean,[10 0]);
EGFPVEH_R3PCmovmean = movmean(EGFPVEH_R3PCMean,[10 0]);

EGFPCNO_R3PCmovSEM = movmean(EGFPCNO_R3PCSEM,[10 0]);
EGFPVEH_R3PCmovSEM = movmean(EGFPVEH_R3PCSEM,[10 0]);

%%
%Plot figure EGFP (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R3PCmovmean),EGFPCNO_R3PCmovmean,'r-');
hold on
plot(1:size(EGFPVEH_R3PCmovmean),EGFPVEH_R3PCmovmean,'b-');
shadedErrorBar(1:length(EGFPCNO_R3PCmovmean),EGFPCNO_R3PCmovmean,EGFPCNO_R3PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R3PCmovmean),EGFPVEH_R3PCmovmean,EGFPVEH_R3PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('eGFP R3 (90/10)')
legend ({'CNO (n=6)','VEH (n=10)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%MALE AB R3 

EGFPVEH_R3PC_MALE=R3Trials(R3Trials.virus==1 & R3Trials.drug==0 & R3Trials.sex==1,:); %EGFP - VEH
EGFPCNO_R3PC_MALE=R3Trials(R3Trials.virus==1 & R3Trials.drug==1 & R3Trials.sex==1,:);  %EGFP - CNO 

EGFPCNO_R3PC_MALEMean=splitapply(@mean,EGFPCNO_R3PC_MALE.CorrectPercent,EGFPCNO_R3PC_MALE.ContTrial);
EGFPCNO_R3PC_MALESEM=splitapply(@std,EGFPCNO_R3PC_MALE.CorrectPercent,EGFPCNO_R3PC_MALE.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R3PC_MALE.CorrectPercent,EGFPCNO_R3PC_MALE.ContTrial));

EGFPVEH_R3PC_MALEMean=splitapply(@mean,EGFPVEH_R3PC_MALE.CorrectPercent,EGFPVEH_R3PC_MALE.ContTrial);
EGFPVEH_R3PC_MALESEM=splitapply(@std,EGFPVEH_R3PC_MALE.CorrectPercent,EGFPVEH_R3PC_MALE.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R3PC_MALE.CorrectPercent,EGFPVEH_R3PC_MALE.ContTrial));

EGFPCNO_R3PCMALEmovmean = movmean(EGFPCNO_R3PC_MALEMean,[10 0]); %sliding trials of 10
EGFPVEH_R3PCMALEmovmean = movmean(EGFPVEH_R3PC_MALEMean,[10 0]); %sliding trials of 10

EGFPCNO_R3PCMALEmovSEM= movmean(EGFPCNO_R3PC_MALESEM,[10 0]);
EGFPVEH_R3PCMALEmovSEM= movmean(EGFPVEH_R3PC_MALESEM,[10 0]);

%%
%Plot figure EGFP male (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R3PCMALEmovmean),EGFPCNO_R3PCMALEmovmean,'b-');
hold on
plot(1:size(EGFPVEH_R3PCMALEmovmean),EGFPVEH_R3PCMALEmovmean,'g-');
shadedErrorBar(1:length(EGFPCNO_R3PCMALEmovmean),EGFPCNO_R3PCMALEmovmean,EGFPCNO_R3PCMALEmovSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(EGFPVEH_R3PCMALEmovmean),EGFPVEH_R3PCMALEmovmean,EGFPVEH_R3PCMALEmovSEM, 'lineprops', 'g-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Male eGFP R3 (90/10)')
legend ({'CNO (n=3)','VEH (n=6)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%

%FEMALE AB R3

EGFPVEH_R3PC_FEMALE=R3Trials(R3Trials.virus==0 & R3Trials.drug==0 & R3Trials.sex==0,:); %EGFP- VEH 
EGFPCNO_R3PC_FEMALE=R3Trials(R3Trials.virus==0 & R3Trials.drug==1 & R3Trials.sex==0,:);  %EGFP- CNO 

EGFPCNO_R3PC_FEMALEMean=splitapply(@mean,EGFPCNO_R3PC_FEMALE.CorrectPercent,EGFPCNO_R3PC_FEMALE.ContTrial);
EGFPCNO_R3PC_FEMALESEM=splitapply(@std,EGFPCNO_R3PC_FEMALE.CorrectPercent,EGFPCNO_R3PC_FEMALE.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R3PC_FEMALE.CorrectPercent,EGFPCNO_R3PC_FEMALE.ContTrial));

EGFPVEH_R3PC_FEMALEMean=splitapply(@mean,EGFPVEH_R3PC_FEMALE.CorrectPercent,EGFPVEH_R3PC_FEMALE.ContTrial);
EGFPVEH_R3PC_FEMALESEM=splitapply(@std,EGFPVEH_R3PC_FEMALE.CorrectPercent,EGFPVEH_R3PC_FEMALE.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R3PC_FEMALE.CorrectPercent,EGFPVEH_R3PC_FEMALE.ContTrial));

EGFPCNO_R3PCFEMALEmovmean = movmean(EGFPCNO_R3PC_FEMALEMean,[10 0]); %sliding trials of 10
EGFPVEH_R3PCFEMALEmovmean = movmean(EGFPVEH_R3PC_FEMALEMean,[10 0]); %sliding trials of 10

EGFPCNO_R3PCFEMALEmovSEM= movmean(EGFPCNO_R3PC_FEMALESEM,[10 0]);
EGFPVEH_R3PCFEMALEmovSEM= movmean(EGFPVEH_R3PC_FEMALESEM,[10 0]);

%%
%Plot figure EGFP male (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R3PCFEMALEmovmean),EGFPCNO_R3PCFEMALEmovmean,'b-');
hold on
plot(1:size(EGFPVEH_R3PCFEMALEmovmean),EGFPVEH_R3PCFEMALEmovmean,'g-');
shadedErrorBar(1:length(EGFPCNO_R3PCFEMALEmovmean),EGFPCNO_R3PCFEMALEmovmean,EGFPCNO_R3PCFEMALEmovSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(EGFPVEH_R3PCFEMALEmovmean),EGFPVEH_R3PCFEMALEmovmean,EGFPVEH_R3PCFEMALEmovSEM, 'lineprops', 'g-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('Female eGFP R3 (90/10)')
legend ({'CNO (n=3)','VEH (n=4)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R4 

BLADREADDVEH_R4PC=R4Trials(R4Trials.brainregion==1 & R4Trials.virus==1 & R4Trials.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R4PC=R4Trials(R4Trials.brainregion==1 & R4Trials.virus==1 & R4Trials.drug==1,:);  %BLA hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day
BLADREADDCNO_R4PCMean=splitapply(@mean,BLADREADDCNO_R4PC.CorrectPercent,BLADREADDCNO_R4PC.ContTrial);
BLADREADDCNO_R4PCSEM=splitapply(@std,BLADREADDCNO_R4PC.CorrectPercent,BLADREADDCNO_R4PC.ContTrial)./sqrt(splitapply(@length,BLADREADDCNO_R4PC.CorrectPercent,BLADREADDCNO_R4PC.ContTrial));

BLADREADDVEH_R4PCMean=splitapply(@mean,BLADREADDVEH_R4PC.CorrectPercent,BLADREADDVEH_R4PC.ContTrial);
BLADREADDVEH_R4PCSEM=splitapply(@std,BLADREADDVEH_R4PC.CorrectPercent,BLADREADDVEH_R4PC.ContTrial)./sqrt(splitapply(@length,BLADREADDVEH_R4PC.CorrectPercent,BLADREADDVEH_R4PC.ContTrial));

% MovMean (sliding trials of 10)

BLADREADDCNO_R4PCmovmean = movmean(BLADREADDCNO_R4PCMean,[10 0]); %sliding trials of 10
BLADREADDVEH_R4PCmovmean = movmean(BLADREADDVEH_R4PCMean,[10 0]); %sliding trials of 10

BLADREADDCNO_R4PCmovSEM= movmean(BLADREADDCNO_R4PCSEM,[10 0]);
BLADREADDVEH_R4PCmovSEM= movmean(BLADREADDVEH_R4PCSEM,[10 0]);


%%
%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R4PCmovmean),BLADREADDCNO_R4PCmovmean,'r-');
hold on
plot(1:size(BLADREADDVEH_R4PCmovmean),BLADREADDVEH_R4PCmovmean,'b-');
shadedErrorBar(1:length(BLADREADDCNO_R4PCmovmean),BLADREADDCNO_R4PCmovmean,BLADREADDCNO_R4PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R4PCmovmean),BLADREADDVEH_R4PCmovmean,BLADREADDVEH_R4PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R4 (90/10)')
% legend ({'CNO (n=8)','VEH (n=9)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend ({'CNO (n=3)','VEH (n=5)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R4 

OFCDREADDVEH_R4PC=R4Trials(R4Trials.brainregion==0 & R4Trials.virus==1 & R4Trials.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R4PC=R4Trials(R4Trials.brainregion==0 & R4Trials.virus==1 & R4Trials.drug==1,:);  %OFC hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day
OFCDREADDCNO_R4PCMean=splitapply(@mean,OFCDREADDCNO_R4PC.CorrectPercent,OFCDREADDCNO_R4PC.ContTrial);
OFCDREADDCNO_R4PCSEM=splitapply(@std,OFCDREADDCNO_R4PC.CorrectPercent,OFCDREADDCNO_R4PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDCNO_R4PC.CorrectPercent,OFCDREADDCNO_R4PC.ContTrial));

OFCDREADDVEH_R4PCMean=splitapply(@mean,OFCDREADDVEH_R4PC.CorrectPercent,OFCDREADDVEH_R4PC.ContTrial);
OFCDREADDVEH_R4PCSEM=splitapply(@std,OFCDREADDVEH_R4PC.CorrectPercent,OFCDREADDVEH_R4PC.ContTrial)./sqrt(splitapply(@length,OFCDREADDVEH_R4PC.CorrectPercent,OFCDREADDVEH_R4PC.ContTrial));

% MovMean (sliding trials of 10)

OFCDREADDCNO_R4PCmovmean = movmean(OFCDREADDCNO_R4PCMean,[10 0]); %sliding trials of 10
OFCDREADDVEH_R4PCmovmean = movmean(OFCDREADDVEH_R4PCMean,[10 0]); %sliding trials of 10

OFCDREADDCNO_R4PCmovSEM= movmean(OFCDREADDCNO_R4PCSEM,[10 0]);
OFCDREADDVEH_R4PCmovSEM= movmean(OFCDREADDVEH_R4PCSEM,[10 0]);


%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R4PCmovmean),OFCDREADDCNO_R4PCmovmean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R4PCmovmean),OFCDREADDVEH_R4PCmovmean,'b-');
shadedErrorBar(1:length(OFCDREADDCNO_R4PCmovmean),OFCDREADDCNO_R4PCmovmean,OFCDREADDCNO_R4PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R4PCmovmean),OFCDREADDVEH_R4PCmovmean,OFCDREADDVEH_R4PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R4 (90/10)')
legend ({'CNO (n=9)','VEH (n=10)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB D5 PC - R4 

EGFPVEH_R4PC=R4Trials(R4Trials.virus==0 & R4Trials.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R4PC=R4Trials(R4Trials.virus==0 & R4Trials.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

EGFPCNO_R4PCMean=splitapply(@mean,EGFPCNO_R4PC.CorrectPercent,EGFPCNO_R4PC.ContTrial);
EGFPCNO_R4PCSEM=splitapply(@std,EGFPCNO_R4PC.CorrectPercent,EGFPCNO_R4PC.ContTrial)./sqrt(splitapply(@length,EGFPCNO_R4PC.CorrectPercent,EGFPCNO_R4PC.ContTrial));

EGFPVEH_R4PCMean=splitapply(@mean,EGFPVEH_R4PC.CorrectPercent,EGFPVEH_R4PC.ContTrial);
EGFPVEH_R4PCSEM=splitapply(@std,EGFPVEH_R4PC.CorrectPercent,EGFPVEH_R4PC.ContTrial)./sqrt(splitapply(@length,EGFPVEH_R4PC.CorrectPercent,EGFPVEH_R4PC.ContTrial));

% MovMean (sliding trials of 10)

EGFPCNO_R4PCmovmean = movmean(EGFPCNO_R4PCMean,[10 0]);
EGFPVEH_R4PCmovmean = movmean(EGFPVEH_R4PCMean,[10 0]);

EGFPCNO_R4PCmovSEM = movmean(EGFPCNO_R4PCSEM,[10 0]);
EGFPVEH_R4PCmovSEM = movmean(EGFPVEH_R4PCSEM,[10 0]);

%%
%Plot figure EGFP (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R4PCmovmean),EGFPCNO_R4PCmovmean,'r-');
hold on
plot(1:size(EGFPVEH_R4PCmovmean),EGFPVEH_R4PCmovmean,'b-');
shadedErrorBar(1:length(EGFPCNO_R4PCmovmean),EGFPCNO_R4PCmovmean,EGFPCNO_R4PCmovSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R4PCmovmean),EGFPVEH_R4PCmovmean,EGFPVEH_R4PCmovSEM, 'lineprops', 'b-')

plot([0 150],[0.5,0.5],'--k')
hold off
 
title('eGFP R4 (90/10)')
legend ({'CNO (n=10)','VEH (n=6)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 150])
set(gca,'XTick',[0 50 100 150],'XTickLabel',{'0','50','100','150'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

