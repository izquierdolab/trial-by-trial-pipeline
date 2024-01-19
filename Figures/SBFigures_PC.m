clear, clc
close all

load('ALL_OUT_DATA.mat')

%%
%PERCENT CORRECT - SB D5

%Create Discrimination table from larger mat file 
D100Day=(SO_resample.tbl_day(SO_resample.tbl_day.phase==0,:)); 

%%
%OFC SB D5 PC - Discrim
OFCDREADD_PC=D100Day(D100Day.brainregion==0 & D100Day.virus==1,:); %OFC hM4DI OFCDREADDs 
EGFP_PC=D100Day(D100Day.virus==0,:);  %All eGFP Controls

%Create percent correct data tables for OFCDREADDs/eGFP groups 

%Calculate Means & SEMs for each groups in each day
OFCDREADD_PCMean=splitapply(@mean,OFCDREADD_PC.CorrectPercent,OFCDREADD_PC.day);
OFCDREADD_PCSEM=splitapply(@std,OFCDREADD_PC.CorrectPercent,OFCDREADD_PC.day)./sqrt(splitapply(@length,OFCDREADD_PC.CorrectPercent,OFCDREADD_PC.day));

EGFP_PCMean=splitapply(@mean,EGFP_PC.CorrectPercent,EGFP_PC.day);
EGFP_PCSEM=splitapply(@std,EGFP_PC.CorrectPercent,EGFP_PC.day)./sqrt(splitapply(@length,EGFP_PC.CorrectPercent,EGFP_PC.day));

%%
%Plot figure OFC HM4DI DREADD

figure 
plot(1:size(OFCDREADD_PCMean),OFCDREADD_PCMean,'m-');
hold on
shadedErrorBar(1:length(OFCDREADD_PCMean),OFCDREADD_PCMean,OFCDREADD_PCSEM, 'lineprops', 'm-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('vlOFC hM4Di Discrimination (100/0)')
legend ({'OFC hM4Di'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%Plot figure eGFP controls 

figure
plot(1:size(EGFP_PCMean),EGFP_PCMean,'m-');
hold on
shadedErrorBar(1:length(EGFP_PCMean),EGFP_PCMean,EGFP_PCSEM, 'lineprops', 'm-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('eGFP Discrimination (100/0)')
legend ({'eGFP'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - Discrim
BLADREADD_PC=D100Day(D100Day.brainregion==1 & D100Day.virus==1,:); %BLA hM4DI DREADDs 

%Create percent correct data tables for DREADDs/eGFP groups 

%Calculate Means & SEMs for each groups in each day
BLADREADD_PCMean=splitapply(@mean,BLADREADD_PC.CorrectPercent,BLADREADD_PC.day);
BLADREADD_PCSEM=splitapply(@std,BLADREADD_PC.CorrectPercent,BLADREADD_PC.day)./sqrt(splitapply(@length,BLADREADD_PC.CorrectPercent,BLADREADD_PC.day));

%Plot figure BLA HM4DI DREADD

figure 
plot(1:size(BLADREADD_PCMean),BLADREADD_PCMean,'m-');
hold on
shadedErrorBar(1:length(BLADREADD_PCMean),BLADREADD_PCMean,BLADREADD_PCSEM, 'lineprops', 'm-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di Discrimination(100/0)')
legend ({'BLA hM4Di'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%Create R100 (R1 & R2) & R90 (R3 & R4) table from larger mat file 

R1Day=(SO_resample.tbl_day(SO_resample.tbl_day.phase==1,:)); 
R2Day=(SO_resample.tbl_day(SO_resample.tbl_day.phase==2,:)); 
R3Day=(SO_resample.tbl_day(SO_resample.tbl_day.phase==3,:)); 
R4Day=(SO_resample.tbl_day(SO_resample.tbl_day.phase==4,:)); 

%%
%OFC SB D5 PC - R1 
OFCDREADDVEH_R1PC=R1Day(R1Day.brainregion==0 & R1Day.virus==1 & R1Day.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R1PC=R1Day(R1Day.brainregion==0 & R1Day.virus==1 & R1Day.drug==1,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R1PC=R1Day(R1Day.virus==0 & R1Day.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R1PC=R1Day(R1Day.virus==0 & R1Day.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R1PCMean=splitapply(@mean,OFCDREADDCNO_R1PC.CorrectPercent,OFCDREADDCNO_R1PC.day);
OFCDREADDCNO_R1PCSEM=splitapply(@std,OFCDREADDCNO_R1PC.CorrectPercent,OFCDREADDCNO_R1PC.day)./sqrt(splitapply(@length,OFCDREADDCNO_R1PC.CorrectPercent,OFCDREADDCNO_R1PC.day));

OFCDREADDVEH_R1PCMean=splitapply(@mean,OFCDREADDVEH_R1PC.CorrectPercent,OFCDREADDVEH_R1PC.day);
OFCDREADDVEH_R1PCSEM=splitapply(@std,OFCDREADDVEH_R1PC.CorrectPercent,OFCDREADDVEH_R1PC.day)./sqrt(splitapply(@length,OFCDREADDVEH_R1PC.CorrectPercent,OFCDREADDVEH_R1PC.day));

EGFPCNO_R1PCMean=splitapply(@mean,EGFPCNO_R1PC.CorrectPercent,EGFPCNO_R1PC.day);
EGFPCNO_R1PCSEM=splitapply(@std,EGFPCNO_R1PC.CorrectPercent,EGFPCNO_R1PC.day)./sqrt(splitapply(@length,EGFPCNO_R1PC.CorrectPercent,EGFPCNO_R1PC.day));

EGFPVEH_R1PCMean=splitapply(@mean,EGFPVEH_R1PC.CorrectPercent,EGFPVEH_R1PC.day);
EGFPVEH_R1PCSEM=splitapply(@std,EGFPVEH_R1PC.CorrectPercent,EGFPVEH_R1PC.day)./sqrt(splitapply(@length,EGFPVEH_R1PC.CorrectPercent,EGFPVEH_R1PC.day));


%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R1PCMean),OFCDREADDCNO_R1PCMean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R1PCMean),OFCDREADDVEH_R1PCMean,'c-');
shadedErrorBar(1:length(OFCDREADDCNO_R1PCMean),OFCDREADDCNO_R1PCMean,OFCDREADDCNO_R1PCSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R1PCMean),OFCDREADDVEH_R1PCMean,OFCDREADDVEH_R1PCSEM, 'lineprops', 'c-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R1 (100/0)')
legend ({'CNO1(n=5)','VEH1(n=8)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%%
%Plot figure (CNO vs. VEH (EGFP))

figure 
plot(1:size(EGFPCNO_R1PCMean),EGFPCNO_R1PCMean,'r-');
hold on
plot(1:size(EGFPVEH_R1PCMean),EGFPVEH_R1PCMean,'c-');
shadedErrorBar(1:length(EGFPCNO_R1PCMean),EGFPCNO_R1PCMean,EGFPCNO_R1PCSEM,'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R1PCMean),EGFPVEH_R1PCMean,EGFPVEH_R1PCSEM, 'lineprops', 'c-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('eGFP R1 (100/0)')
legend ({'CNO1(n=4)','VEH1(n=8)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - R1 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug
BLADREADDVEH_R1PC=R1Day(R1Day.brainregion==1 & R1Day.virus==1 & R1Day.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R1PC=R1Day(R1Day.brainregion==1 & R1Day.virus==1 & R1Day.drug==1,:);  %BLA hM4DI DREADDs- CNO  

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R1PCMean=splitapply(@mean,BLADREADDCNO_R1PC.CorrectPercent,BLADREADDCNO_R1PC.day);
BLADREADDCNO_R1PCSEM=splitapply(@std,BLADREADDCNO_R1PC.CorrectPercent,BLADREADDCNO_R1PC.day)./sqrt(splitapply(@length,BLADREADDCNO_R1PC.CorrectPercent,BLADREADDCNO_R1PC.day));

BLADREADDVEH_R1PCMean=splitapply(@mean,BLADREADDVEH_R1PC.CorrectPercent,BLADREADDVEH_R1PC.day);
BLADREADDVEH_R1PCSEM=splitapply(@std,BLADREADDVEH_R1PC.CorrectPercent,BLADREADDVEH_R1PC.day)./sqrt(splitapply(@length,BLADREADDVEH_R1PC.CorrectPercent,BLADREADDVEH_R1PC.day));


%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R1PCMean),BLADREADDCNO_R1PCMean,'r-');
hold on
plot(1:size(BLADREADDVEH_R1PCMean),BLADREADDVEH_R1PCMean,'c-');
shadedErrorBar(1:length(BLADREADDCNO_R1PCMean),BLADREADDCNO_R1PCMean,BLADREADDCNO_R1PCSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R1PCMean),BLADREADDVEH_R1PCMean,BLADREADDVEH_R1PCSEM, 'lineprops', 'c-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R1 (100/0)')
legend ({'CNO1(n=4)','VEH1(n=5)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%OFC SB D5 PC - R1 (FEMALES)

OFCDREADDVEH_R1PC_FEM=R1Day(R1Day.brainregion==0 & R1Day.virus==1 & R1Day.drug==0 & R1Day.sex==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R1PC_FEM=R1Day(R1Day.brainregion==0 & R1Day.virus==1 & R1Day.drug==1 & R1Day.sex==0,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R1PC_FEM=R1Day(R1Day.virus==0 & R1Day.drug==0 & R1Day.sex==0,:);  %All eGFP Control- VEH
EGFPCNO_R1PC_FEM=R1Day(R1Day.virus==0 & R1Day.drug==1 & R1Day.sex==0,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R1PC_FEMMean=splitapply(@mean,OFCDREADDCNO_R1PC_FEM.CorrectPercent,OFCDREADDCNO_R1PC_FEM.day);
OFCDREADDCNO_R1PC_FEMSEM=splitapply(@std,OFCDREADDCNO_R1PC_FEM.CorrectPercent,OFCDREADDCNO_R1PC_FEM.day)./sqrt(splitapply(@length,OFCDREADDCNO_R1PC_FEM.CorrectPercent,OFCDREADDCNO_R1PC_FEM.day));

OFCDREADDVEH_R1PC_FEMMean=splitapply(@mean,OFCDREADDVEH_R1PC_FEM.CorrectPercent,OFCDREADDVEH_R1PC_FEM.day);
OFCDREADDVEH_R1PC_FEMSEM=splitapply(@std,OFCDREADDVEH_R1PC_FEM.CorrectPercent,OFCDREADDVEH_R1PC_FEM.day)./sqrt(splitapply(@length,OFCDREADDVEH_R1PC_FEM.CorrectPercent,OFCDREADDVEH_R1PC_FEM.day));

EGFPCNO_R1PC_FEMMean=splitapply(@mean,EGFPCNO_R1PC_FEM.CorrectPercent,EGFPCNO_R1PC_FEM.day);
EGFPCNO_R1PC_FEMSEM=splitapply(@std,EGFPCNO_R1PC_FEM.CorrectPercent,EGFPCNO_R1PC_FEM.day)./sqrt(splitapply(@length,EGFPCNO_R1PC_FEM.CorrectPercent,EGFPCNO_R1PC_FEM.day));

EGFPVEH_R1PC_FEMMean=splitapply(@mean,EGFPVEH_R1PC_FEM.CorrectPercent,EGFPVEH_R1PC_FEM.day);
EGFPVEH_R1PC_FEMSEM=splitapply(@std,EGFPVEH_R1PC_FEM.CorrectPercent,EGFPVEH_R1PC_FEM.day)./sqrt(splitapply(@length,EGFPVEH_R1PC_FEM.CorrectPercent,EGFPVEH_R1PC_FEM.day));


%%
%Plot figure OFC female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R1PC_FEMMean),OFCDREADDCNO_R1PC_FEMMean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R1PC_FEMMean),OFCDREADDVEH_R1PC_FEMMean,'c-');
shadedErrorBar(1:length(OFCDREADDCNO_R1PC_FEMMean),OFCDREADDCNO_R1PC_FEMMean,OFCDREADDCNO_R1PC_FEMSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R1PC_FEMMean),OFCDREADDVEH_R1PC_FEMMean,OFCDREADDVEH_R1PC_FEMSEM, 'lineprops', 'c-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Female vlOFC hM4Di R1 (100/0)')
legend ({'CNO1 (n=2)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%Plot figure OFC female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(EGFPCNO_R3PC_FEMMean),EGFPCNO_R3PC_FEMMean,'r-');
hold on
plot(1:size(EGFPVEH_R3PC_FEMMean),EGFPVEH_R3PC_FEMMean,'c-');
shadedErrorBar(1:length(EGFPCNO_R3PC_FEMMean),EGFPCNO_R3PC_FEMMean,EGFPCNO_R3PC_FEMSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R3PC_FEMMean),EGFPVEH_R3PC_FEMMean,EGFPVEH_R3PC_FEMSEM, 'lineprops', 'c-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Female eGFP R1 (100/0)')
legend ({'CNO1 (n=3)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - R1 (Females)

BLADREADDVEH_R1PC_FEM=R1Day(R1Day.brainregion==1 & R1Day.virus==1 & R1Day.drug==0 & R1Day.sex==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R1PC_FEM=R1Day(R1Day.brainregion==1 & R1Day.virus==1 & R1Day.drug==1 & R1Day.sex==0,:);  %BLA hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R1PC_FEMMean=splitapply(@mean,BLADREADDCNO_R1PC_FEM.CorrectPercent,BLADREADDCNO_R1PC_FEM.day);
BLADREADDCNO_R1PC_FEMSEM=splitapply(@std,BLADREADDCNO_R1PC_FEM.CorrectPercent,BLADREADDCNO_R1PC_FEM.day)./sqrt(splitapply(@length,BLADREADDCNO_R1PC_FEM.CorrectPercent,BLADREADDCNO_R1PC_FEM.day));

BLADREADDVEH_R1PC_FEMMean=splitapply(@mean,BLADREADDVEH_R1PC_FEM.CorrectPercent,BLADREADDVEH_R1PC_FEM.day);
BLADREADDVEH_R1PC_FEMSEM=splitapply(@std,BLADREADDVEH_R1PC_FEM.CorrectPercent,BLADREADDVEH_R1PC_FEM.day)./sqrt(splitapply(@length,BLADREADDVEH_R1PC_FEM.CorrectPercent,BLADREADDVEH_R1PC_FEM.day));

%%
%Plot figure BLA female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R1PC_FEMMean),BLADREADDCNO_R1PC_FEMMean,'r-');
hold on
plot(1:size(BLADREADDVEH_R1PC_FEMMean),BLADREADDVEH_R1PC_FEMMean,'c-');
shadedErrorBar(1:length(BLADREADDCNO_R1PC_FEMMean),BLADREADDCNO_R1PC_FEMMean,BLADREADDCNO_R1PC_FEMSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R1PC_FEMMean),BLADREADDVEH_R1PC_FEMMean,BLADREADDVEH_R1PC_FEMSEM, 'lineprops', 'c-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Female BLA hM4Di R1 (100/0)')
legend ({'CNO1 (n=5)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%OFC SB D5 PC - R1 (Males)

OFCDREADDVEH_R1PC_MAL=R1Day(R1Day.brainregion==0 & R1Day.virus==1 & R1Day.drug==0 & R1Day.sex==1,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R1PC_MAL=R1Day(R1Day.brainregion==0 & R1Day.virus==1 & R1Day.drug==1 & R1Day.sex==1,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R1PC_MAL=R1Day(R1Day.virus==0 & R1Day.drug==0 & R1Day.sex==1,:);  %All eGFP Control- VEH
EGFPCNO_R1PC_MAL=R1Day(R1Day.virus==0 & R1Day.drug==1 & R1Day.sex==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R1PC_MALMean=splitapply(@mean,OFCDREADDCNO_R1PC_MAL.CorrectPercent,OFCDREADDCNO_R1PC_MAL.day);
OFCDREADDCNO_R1PC_MALSEM=splitapply(@std,OFCDREADDCNO_R1PC_MAL.CorrectPercent,OFCDREADDCNO_R1PC_MAL.day)./sqrt(splitapply(@length,OFCDREADDCNO_R1PC_MAL.CorrectPercent,OFCDREADDCNO_R1PC_MAL.day));

OFCDREADDVEH_R1PC_MALMean=splitapply(@mean,OFCDREADDVEH_R1PC_MAL.CorrectPercent,OFCDREADDVEH_R1PC_MAL.day);
OFCDREADDVEH_R1PC_MALSEM=splitapply(@std,OFCDREADDVEH_R1PC_MAL.CorrectPercent,OFCDREADDVEH_R1PC_MAL.day)./sqrt(splitapply(@length,OFCDREADDVEH_R1PC_MAL.CorrectPercent,OFCDREADDVEH_R1PC_MAL.day));

EGFPCNO_R1PC_MALMean=splitapply(@mean,EGFPCNO_R1PC_MAL.CorrectPercent,EGFPCNO_R1PC_MAL.day);
EGFPCNO_R1PC_MALSEM=splitapply(@std,EGFPCNO_R1PC_MAL.CorrectPercent,EGFPCNO_R1PC_MAL.day)./sqrt(splitapply(@length,EGFPCNO_R1PC_MAL.CorrectPercent,EGFPCNO_R1PC_MAL.day));

EGFPVEH_R1PC_MALMean=splitapply(@mean,EGFPVEH_R1PC_MAL.CorrectPercent,EGFPVEH_R1PC_MAL.day);
EGFPVEH_R1PC_MALSEM=splitapply(@std,EGFPVEH_R1PC_MAL.CorrectPercent,EGFPVEH_R1PC_MAL.day)./sqrt(splitapply(@length,EGFPVEH_R1PC_MAL.CorrectPercent,EGFPVEH_R1PC_MAL.day));


%%
%Plot figure OFC Male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R1PC_MALMean),OFCDREADDCNO_R1PC_MALMean,'r-');
hold on
plot(1:size(OFCDREADDVEH_R1PC_MALMean),OFCDREADDVEH_R1PC_MALMean,'c-');
shadedErrorBar(1:length(OFCDREADDCNO_R1PC_MALMean),OFCDREADDCNO_R1PC_MALMean,OFCDREADDCNO_R1PC_MALSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(OFCDREADDVEH_R1PC_MALMean),OFCDREADDVEH_R1PC_MALMean,OFCDREADDVEH_R1PC_MALSEM, 'lineprops', 'c-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Male vlOFC hM4Di R1 (100/0)')
legend ({'CNO1 (n=3)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%Plot figure EGFP Male (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R3PC_MALMean),EGFPCNO_R3PC_MALMean,'r-');
hold on
plot(1:size(EGFPVEH_R3PC_MALMean),EGFPVEH_R3PC_MALMean,'c-');
shadedErrorBar(1:length(EGFPCNO_R3PC_MALMean),EGFPCNO_R3PC_MALMean,EGFPCNO_R3PC_MALSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(EGFPVEH_R3PC_MALMean),EGFPVEH_R3PC_MALMean,EGFPVEH_R3PC_MALSEM, 'lineprops', 'c-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Male eGFP R1 (100/0)')
legend ({'CNO1 (n=3)','VEH1 (n=7)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - R1 (Males)

BLADREADDVEH_R1PC_MAL=R1Day(R1Day.brainregion==1 & R1Day.virus==1 & R1Day.drug==0 & R1Day.sex==1,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R1PC_MAL=R1Day(R1Day.brainregion==1 & R1Day.virus==1 & R1Day.drug==1 & R1Day.sex==1,:);  %BLA hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R1PC_MALMean=splitapply(@mean,BLADREADDCNO_R1PC_MAL.CorrectPercent,BLADREADDCNO_R1PC_MAL.day);
BLADREADDCNO_R1PC_MALSEM=splitapply(@std,BLADREADDCNO_R1PC_MAL.CorrectPercent,BLADREADDCNO_R1PC_MAL.day)./sqrt(splitapply(@length,BLADREADDCNO_R1PC_MAL.CorrectPercent,BLADREADDCNO_R1PC_MAL.day));

BLADREADDVEH_R1PC_MALMean=splitapply(@mean,BLADREADDVEH_R1PC_MAL.CorrectPercent,BLADREADDVEH_R1PC_MAL.day);
BLADREADDVEH_R1PC_MALSEM=splitapply(@std,BLADREADDVEH_R1PC_MAL.CorrectPercent,BLADREADDVEH_R1PC_MAL.day)./sqrt(splitapply(@length,BLADREADDVEH_R1PC_MAL.CorrectPercent,BLADREADDVEH_R1PC_MAL.day));

%%
%Plot figure BLA Male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R1PC_MALMean),BLADREADDCNO_R1PC_MALMean,'r-');
hold on
plot(1:size(BLADREADDVEH_R1PC_MALMean),BLADREADDVEH_R1PC_MALMean,'c-');
shadedErrorBar(1:length(BLADREADDCNO_R1PC_MALMean),BLADREADDCNO_R1PC_MALMean,BLADREADDCNO_R1PC_MALSEM, 'lineprops', 'r-')
shadedErrorBar(1:length(BLADREADDVEH_R1PC_MALMean),BLADREADDVEH_R1PC_MALMean,BLADREADDVEH_R1PC_MALSEM, 'lineprops', 'c-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Male BLA hM4Di R1 (100/0)')
legend ({'CNO1 (n=3)','VEH1 (n=3)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%OFC SB D5 PC - R3 (Females)

OFCDREADDVEH_R3PC_FEM=R3Day(R3Day.brainregion==0 & R3Day.virus==1 & R3Day.drug==0 & R3Day.sex==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R3PC_FEM=R3Day(R3Day.brainregion==0 & R3Day.virus==1 & R3Day.drug==1 & R3Day.sex==0,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R3PC_FEM=R3Day(R3Day.virus==0 & R3Day.drug==0 & R3Day.sex==0,:);  %All eGFP Control- VEH
EGFPCNO_R3PC_FEM=R3Day(R3Day.virus==0 & R3Day.drug==1 & R3Day.sex==0,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R3PC_FEMMean=splitapply(@mean,OFCDREADDCNO_R3PC_FEM.CorrectPercent,OFCDREADDCNO_R3PC_FEM.day);
OFCDREADDCNO_R3PC_FEMSEM=splitapply(@std,OFCDREADDCNO_R3PC_FEM.CorrectPercent,OFCDREADDCNO_R3PC_FEM.day)./sqrt(splitapply(@length,OFCDREADDCNO_R3PC_FEM.CorrectPercent,OFCDREADDCNO_R3PC_FEM.day));

OFCDREADDVEH_R3PC_FEMMean=splitapply(@mean,OFCDREADDVEH_R3PC_FEM.CorrectPercent,OFCDREADDVEH_R3PC_FEM.day);
OFCDREADDVEH_R3PC_FEMSEM=splitapply(@std,OFCDREADDVEH_R3PC_FEM.CorrectPercent,OFCDREADDVEH_R3PC_FEM.day)./sqrt(splitapply(@length,OFCDREADDVEH_R3PC_FEM.CorrectPercent,OFCDREADDVEH_R3PC_FEM.day));

EGFPCNO_R3PC_FEMMean=splitapply(@mean,EGFPCNO_R3PC_FEM.CorrectPercent,EGFPCNO_R3PC_FEM.day);
EGFPCNO_R3PC_FEMSEM=splitapply(@std,EGFPCNO_R3PC_FEM.CorrectPercent,EGFPCNO_R3PC_FEM.day)./sqrt(splitapply(@length,EGFPCNO_R3PC_FEM.CorrectPercent,EGFPCNO_R3PC_FEM.day));

EGFPVEH_R3PC_FEMMean=splitapply(@mean,EGFPVEH_R3PC_FEM.CorrectPercent,EGFPVEH_R3PC_FEM.day);
EGFPVEH_R3PC_FEMSEM=splitapply(@std,EGFPVEH_R3PC_FEM.CorrectPercent,EGFPVEH_R3PC_FEM.day)./sqrt(splitapply(@length,EGFPVEH_R3PC_FEM.CorrectPercent,EGFPVEH_R3PC_FEM.day));


%%
%Plot figure OFC female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R3PC_FEMMean),OFCDREADDCNO_R3PC_FEMMean,'b-');
hold on
plot(1:size(OFCDREADDVEH_R3PC_FEMMean),OFCDREADDVEH_R3PC_FEMMean,'g-');
shadedErrorBar(1:length(OFCDREADDCNO_R3PC_FEMMean),OFCDREADDCNO_R3PC_FEMMean,OFCDREADDCNO_R3PC_FEMSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(OFCDREADDVEH_R3PC_FEMMean),OFCDREADDVEH_R3PC_FEMMean,OFCDREADDVEH_R3PC_FEMSEM, 'lineprops', 'g-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Female vlOFC hM4Di R3 (90/10)')
legend ({'CNO1 (n=2)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%Plot figure EGFP female (CNO vs. VEH)

figure 
plot(1:size(EGFPCNO_R3PC_FEMMean),EGFPCNO_R3PC_FEMMean,'b-');
hold on
plot(1:size(EGFPVEH_R3PC_FEMMean),EGFPVEH_R3PC_FEMMean,'g-');
shadedErrorBar(1:length(EGFPCNO_R3PC_FEMMean),EGFPCNO_R3PC_FEMMean,EGFPCNO_R3PC_FEMSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(EGFPVEH_R3PC_FEMMean),EGFPVEH_R3PC_FEMMean,EGFPVEH_R3PC_FEMSEM, 'lineprops', 'g-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Female eGFP R3 (90/10)')
legend ({'CNO1 (n=3)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - R3 (Females)

BLADREADDVEH_R3PC_FEM=R3Day(R3Day.brainregion==1 & R3Day.virus==1 & R3Day.drug==0 & R3Day.sex==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R3PC_FEM=R3Day(R3Day.brainregion==1 & R3Day.virus==1 & R3Day.drug==1 & R3Day.sex==0,:);  %BLA hM4DI DREADDs- CNO 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R3PC_FEMMean=splitapply(@mean,BLADREADDCNO_R3PC_FEM.CorrectPercent,BLADREADDCNO_R3PC_FEM.day);
BLADREADDCNO_R3PC_FEMSEM=splitapply(@std,BLADREADDCNO_R3PC_FEM.CorrectPercent,BLADREADDCNO_R3PC_FEM.day)./sqrt(splitapply(@length,BLADREADDCNO_R3PC_FEM.CorrectPercent,BLADREADDCNO_R3PC_FEM.day));

BLADREADDVEH_R3PC_FEMMean=splitapply(@mean,BLADREADDVEH_R3PC_FEM.CorrectPercent,BLADREADDVEH_R3PC_FEM.day);
BLADREADDVEH_R3PC_FEMSEM=splitapply(@std,BLADREADDVEH_R3PC_FEM.CorrectPercent,BLADREADDVEH_R3PC_FEM.day)./sqrt(splitapply(@length,BLADREADDVEH_R3PC_FEM.CorrectPercent,BLADREADDVEH_R3PC_FEM.day));

%%
%Plot figure BLA female (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R3PC_FEMMean),BLADREADDCNO_R3PC_FEMMean,'b-');
hold on
plot(1:size(BLADREADDVEH_R3PC_FEMMean),BLADREADDVEH_R3PC_FEMMean,'g-');
shadedErrorBar(1:length(BLADREADDCNO_R3PC_FEMMean),BLADREADDCNO_R3PC_FEMMean,BLADREADDCNO_R3PC_FEMSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(BLADREADDVEH_R3PC_FEMMean),BLADREADDVEH_R3PC_FEMMean,BLADREADDVEH_R3PC_FEMSEM, 'lineprops', 'g-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Female BLA hM4Di R3 (90/10)')
legend ({'CNO1 (n=5)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%OFC SB D5 PC - R3 (Males)

OFCDREADDVEH_R3PC_MAL=R3Day(R3Day.brainregion==0 & R3Day.virus==1 & R3Day.drug==0 & R3Day.sex==1,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R3PC_MAL=R3Day(R3Day.brainregion==0 & R3Day.virus==1 & R3Day.drug==1 & R3Day.sex==1,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R3PC_MAL=R3Day(R3Day.virus==0 & R3Day.drug==0 & R3Day.sex==1,:);  %All eGFP Control- VEH
EGFPCNO_R3PC_MAL=R3Day(R3Day.virus==0 & R3Day.drug==1 & R3Day.sex==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R3PC_MALMean=splitapply(@mean,OFCDREADDCNO_R3PC_MAL.CorrectPercent,OFCDREADDCNO_R3PC_MAL.day);
OFCDREADDCNO_R3PC_MALSEM=splitapply(@std,OFCDREADDCNO_R3PC_MAL.CorrectPercent,OFCDREADDCNO_R3PC_MAL.day)./sqrt(splitapply(@length,OFCDREADDCNO_R3PC_MAL.CorrectPercent,OFCDREADDCNO_R3PC_MAL.day));

OFCDREADDVEH_R3PC_MALMean=splitapply(@mean,OFCDREADDVEH_R3PC_MAL.CorrectPercent,OFCDREADDVEH_R3PC_MAL.day);
OFCDREADDVEH_R3PC_MALSEM=splitapply(@std,OFCDREADDVEH_R3PC_MAL.CorrectPercent,OFCDREADDVEH_R3PC_MAL.day)./sqrt(splitapply(@length,OFCDREADDVEH_R3PC_MAL.CorrectPercent,OFCDREADDVEH_R3PC_MAL.day));

EGFPCNO_R3PC_MALMean=splitapply(@mean,EGFPCNO_R3PC_MAL.CorrectPercent,EGFPCNO_R3PC_MAL.day);
EGFPCNO_R3PC_MALSEM=splitapply(@std,EGFPCNO_R3PC_MAL.CorrectPercent,EGFPCNO_R3PC_MAL.day)./sqrt(splitapply(@length,EGFPCNO_R3PC_MAL.CorrectPercent,EGFPCNO_R3PC_MAL.day));

EGFPVEH_R3PC_MALMean=splitapply(@mean,EGFPVEH_R3PC_MAL.CorrectPercent,EGFPVEH_R3PC_MAL.day);
EGFPVEH_R3PC_MALSEM=splitapply(@std,EGFPVEH_R3PC_MAL.CorrectPercent,EGFPVEH_R3PC_MAL.day)./sqrt(splitapply(@length,EGFPVEH_R3PC_MAL.CorrectPercent,EGFPVEH_R3PC_MAL.day));


%%
%Plot figure OFC Male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R3PC_MALMean),OFCDREADDCNO_R3PC_MALMean,'b-');
hold on
plot(1:size(OFCDREADDVEH_R3PC_MALMean),OFCDREADDVEH_R3PC_MALMean,'g-');
shadedErrorBar(1:length(OFCDREADDCNO_R3PC_MALMean),OFCDREADDCNO_R3PC_MALMean,OFCDREADDCNO_R3PC_MALSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(OFCDREADDVEH_R3PC_MALMean),OFCDREADDVEH_R3PC_MALMean,OFCDREADDVEH_R3PC_MALSEM, 'lineprops', 'g-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Male vlOFC hM4Di R3 (90/10)')
legend ({'CNO1 (n=3)','VEH1 (n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%Plot figure EGFP Male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(EGFPCNO_R3PC_MALMean),EGFPCNO_R3PC_MALMean,'b-');
hold on
plot(1:size(EGFPVEH_R3PC_MALMean),EGFPVEH_R3PC_MALMean,'g-');
shadedErrorBar(1:length(EGFPCNO_R3PC_MALMean),EGFPCNO_R3PC_MALMean,EGFPCNO_R3PC_MALSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(EGFPVEH_R3PC_MALMean),EGFPVEH_R3PC_MALMean,EGFPVEH_R3PC_MALSEM, 'lineprops', 'g-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Male eGFP R3 (90/10)')
legend ({'CNO1 (n=3)','VEH1 (n=7)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - R3 (Male)

BLADREADDVEH_R3PC_MAL=R3Day(R3Day.brainregion==1 & R3Day.virus==1 & R3Day.drug==0 & R3Day.sex==1,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R3PC_MAL=R3Day(R3Day.brainregion==1 & R3Day.virus==1 & R3Day.drug==1 & R3Day.sex==1,:);  %BLA hM4DI DREADDs- CNO 
EGFPVEH_R3PC_MAL=R3Day(R3Day.virus==0 & R3Day.drug==0 & R3Day.sex==1,:);  %All eGFP Control- VEH
EGFPCNO_R3PC_MAL=R3Day(R3Day.virus==0 & R3Day.drug==1 & R3Day.sex==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R3PC_MALMean=splitapply(@mean,BLADREADDCNO_R3PC_MAL.CorrectPercent,BLADREADDCNO_R3PC_MAL.day);
BLADREADDCNO_R3PC_MALSEM=splitapply(@std,BLADREADDCNO_R3PC_MAL.CorrectPercent,BLADREADDCNO_R3PC_MAL.day)./sqrt(splitapply(@length,BLADREADDCNO_R3PC_MAL.CorrectPercent,BLADREADDCNO_R3PC_MAL.day));

BLADREADDVEH_R3PC_MALMean=splitapply(@mean,BLADREADDVEH_R3PC_MAL.CorrectPercent,BLADREADDVEH_R3PC_MAL.day);
BLADREADDVEH_R3PC_MALSEM=splitapply(@std,BLADREADDVEH_R3PC_MAL.CorrectPercent,BLADREADDVEH_R3PC_MAL.day)./sqrt(splitapply(@length,BLADREADDVEH_R3PC_MAL.CorrectPercent,BLADREADDVEH_R3PC_MAL.day));

%%
%Plot figure BLA Male (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R3PC_MALMean),BLADREADDCNO_R3PC_MALMean,'b-');
hold on
plot(1:size(BLADREADDVEH_R3PC_MALMean),BLADREADDVEH_R3PC_MALMean,'g-');
shadedErrorBar(1:length(BLADREADDCNO_R3PC_MALMean),BLADREADDCNO_R3PC_MALMean,BLADREADDCNO_R3PC_MALSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(BLADREADDVEH_R3PC_MALMean),BLADREADDVEH_R3PC_MALMean,BLADREADDVEH_R3PC_MALSEM, 'lineprops', 'g-')

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Male BLA hM4Di R3 (90/10)')
legend ({'CNO1 (n=3)','VEH1 (n=3)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%%
%OFC SB D5 PC - R2 
OFCDREADDVEH_R2PC=R2Day(R2Day.brainregion==0 & R2Day.virus==1 & R2Day.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R2PC=R2Day(R2Day.brainregion==0 & R2Day.virus==1 & R2Day.drug==1,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R2PC=R2Day(R2Day.virus==0 & R2Day.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R2PC=R2Day(R2Day.virus==0 & R2Day.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R2PCMean=splitapply(@mean,OFCDREADDCNO_R2PC.CorrectPercent,OFCDREADDCNO_R2PC.day);
OFCDREADDCNO_R2PCSEM=splitapply(@std,OFCDREADDCNO_R2PC.CorrectPercent,OFCDREADDCNO_R2PC.day)./sqrt(splitapply(@length,OFCDREADDCNO_R2PC.CorrectPercent,OFCDREADDCNO_R2PC.day));

OFCDREADDVEH_R2PCMean=splitapply(@mean,OFCDREADDVEH_R2PC.CorrectPercent,OFCDREADDVEH_R2PC.day);
OFCDREADDVEH_R2PCSEM=splitapply(@std,OFCDREADDVEH_R2PC.CorrectPercent,OFCDREADDVEH_R2PC.day)./sqrt(splitapply(@length,OFCDREADDVEH_R2PC.CorrectPercent,OFCDREADDVEH_R2PC.day));

EGFPCNO_R2PCMean=splitapply(@mean,EGFPCNO_R2PC.CorrectPercent,EGFPCNO_R2PC.day);
EGFPCNO_R2PCSEM=splitapply(@std,EGFPCNO_R2PC.CorrectPercent,EGFPCNO_R2PC.day)./sqrt(splitapply(@length,EGFPCNO_R2PC.CorrectPercent,EGFPCNO_R2PC.day));

EGFPVEH_R2PCMean=splitapply(@mean,EGFPVEH_R2PC.CorrectPercent,EGFPVEH_R2PC.day);
EGFPVEH_R2PCSEM=splitapply(@std,EGFPVEH_R2PC.CorrectPercent,EGFPVEH_R2PC.day)./sqrt(splitapply(@length,EGFPVEH_R2PC.CorrectPercent,EGFPVEH_R2PC.day));


%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R2PCMean),OFCDREADDCNO_R2PCMean,'c-');
hold on
plot(1:size(OFCDREADDVEH_R2PCMean),OFCDREADDVEH_R2PCMean,'r-');
shadedErrorBar(1:length(OFCDREADDCNO_R2PCMean),OFCDREADDCNO_R2PCMean,OFCDREADDCNO_R2PCSEM, 'lineprops', 'c-')
shadedErrorBar(1:length(OFCDREADDVEH_R2PCMean),OFCDREADDVEH_R2PCMean,OFCDREADDVEH_R2PCSEM, 'lineprops', 'r-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R2 (100/0)')
legend ({'CNO2(n=8)','VEH2(n=5)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%Plot figure (CNO vs. VEH (EGFP))

figure 
plot(1:size(EGFPCNO_R2PCMean),EGFPCNO_R2PCMean,'c-');
hold on
plot(1:size(EGFPVEH_R2PCMean),EGFPVEH_R2PCMean,'r-');
shadedErrorBar(1:length(EGFPCNO_R2PCMean),EGFPCNO_R2PCMean,EGFPCNO_R2PCSEM,'lineprops', 'c-')
shadedErrorBar(1:length(EGFPVEH_R2PCMean),EGFPVEH_R2PCMean,EGFPVEH_R2PCSEM, 'lineprops', 'r-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('eGFP R2 (100/0)')
legend ({'CNO2(n=8)','VEH2(n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%%
%BLA SB D5 PC - R2 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug
BLADREADDVEH_R2PC=R2Day(R2Day.brainregion==1 & R2Day.virus==1 & R2Day.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R2PC=R2Day(R2Day.brainregion==1 & R2Day.virus==1 & R2Day.drug==1,:);  %BLA hM4DI DREADDs- CNO  

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R2PCMean=splitapply(@mean,BLADREADDCNO_R2PC.CorrectPercent,BLADREADDCNO_R2PC.day);
BLADREADDCNO_R2PCSEM=splitapply(@std,BLADREADDCNO_R2PC.CorrectPercent,BLADREADDCNO_R2PC.day)./sqrt(splitapply(@length,BLADREADDCNO_R2PC.CorrectPercent,BLADREADDCNO_R2PC.day));

BLADREADDVEH_R2PCMean=splitapply(@mean,BLADREADDVEH_R2PC.CorrectPercent,BLADREADDVEH_R2PC.day);
BLADREADDVEH_R2PCSEM=splitapply(@std,BLADREADDVEH_R2PC.CorrectPercent,BLADREADDVEH_R2PC.day)./sqrt(splitapply(@length,BLADREADDVEH_R2PC.CorrectPercent,BLADREADDVEH_R2PC.day));


%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R2PCMean),BLADREADDCNO_R2PCMean,'c-');
hold on
plot(1:size(BLADREADDVEH_R2PCMean),BLADREADDVEH_R2PCMean,'r-');
shadedErrorBar(1:length(BLADREADDCNO_R2PCMean),BLADREADDCNO_R2PCMean,BLADREADDCNO_R2PCSEM, 'lineprops', 'c-')
shadedErrorBar(1:length(BLADREADDVEH_R2PCMean),BLADREADDVEH_R2PCMean,BLADREADDVEH_R2PCSEM, 'lineprops', 'r-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R2 (100/0)')
legend ({'CNO2(n=5)','VEH2(n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%OFC SB D5 PC - R3 
OFCDREADDVEH_R3PC=R3Day(R3Day.brainregion==0 & R3Day.virus==1 & R3Day.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R3PC=R3Day(R3Day.brainregion==0 & R3Day.virus==1 & R3Day.drug==1,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R3PC=R3Day(R3Day.virus==0 & R3Day.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R3PC=R3Day(R3Day.virus==0 & R3Day.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R3PCMean=splitapply(@mean,OFCDREADDCNO_R3PC.CorrectPercent,OFCDREADDCNO_R3PC.day);
OFCDREADDCNO_R3PCSEM=splitapply(@std,OFCDREADDCNO_R3PC.CorrectPercent,OFCDREADDCNO_R3PC.day)./sqrt(splitapply(@length,OFCDREADDCNO_R3PC.CorrectPercent,OFCDREADDCNO_R3PC.day));

OFCDREADDVEH_R3PCMean=splitapply(@mean,OFCDREADDVEH_R3PC.CorrectPercent,OFCDREADDVEH_R3PC.day);
OFCDREADDVEH_R3PCSEM=splitapply(@std,OFCDREADDVEH_R3PC.CorrectPercent,OFCDREADDVEH_R3PC.day)./sqrt(splitapply(@length,OFCDREADDVEH_R3PC.CorrectPercent,OFCDREADDVEH_R3PC.day));

EGFPCNO_R3PCMean=splitapply(@mean,EGFPCNO_R3PC.CorrectPercent,EGFPCNO_R3PC.day);
EGFPCNO_R3PCSEM=splitapply(@std,EGFPCNO_R3PC.CorrectPercent,EGFPCNO_R3PC.day)./sqrt(splitapply(@length,EGFPCNO_R3PC.CorrectPercent,EGFPCNO_R3PC.day));

EGFPVEH_R3PCMean=splitapply(@mean,EGFPVEH_R3PC.CorrectPercent,EGFPVEH_R3PC.day);
EGFPVEH_R3PCSEM=splitapply(@std,EGFPVEH_R3PC.CorrectPercent,EGFPVEH_R3PC.day)./sqrt(splitapply(@length,EGFPVEH_R3PC.CorrectPercent,EGFPVEH_R3PC.day));


%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R3PCMean),OFCDREADDCNO_R3PCMean,'b-');
hold on
plot(1:size(OFCDREADDVEH_R3PCMean),OFCDREADDVEH_R3PCMean,'g-');
shadedErrorBar(1:length(OFCDREADDCNO_R3PCMean),OFCDREADDCNO_R3PCMean,OFCDREADDCNO_R3PCSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(OFCDREADDVEH_R3PCMean),OFCDREADDVEH_R3PCMean,OFCDREADDVEH_R3PCSEM, 'lineprops', 'g-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R3 (90/10)')
legend ({'CNO1(n=5)','VEH1(n=8)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%Plot figure (CNO vs. VEH (EGFP))

figure 
plot(1:size(EGFPCNO_R3PCMean),EGFPCNO_R3PCMean,'b-');
hold on
plot(1:size(EGFPVEH_R3PCMean),EGFPVEH_R3PCMean,'g-');
shadedErrorBar(1:length(EGFPCNO_R3PCMean),EGFPCNO_R3PCMean,EGFPCNO_R3PCSEM,'lineprops', 'b-')
shadedErrorBar(1:length(EGFPVEH_R3PCMean),EGFPVEH_R3PCMean,EGFPVEH_R3PCSEM, 'lineprops', 'g-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('eGFP R3 (90/10)')
legend ({'CNO1(n=4)','VEH1(n=8)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - R3 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug
BLADREADDVEH_R3PC=R3Day(R3Day.brainregion==1 & R3Day.virus==1 & R3Day.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R3PC=R3Day(R3Day.brainregion==1 & R3Day.virus==1 & R3Day.drug==1,:);  %BLA hM4DI DREADDs- CNO  

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R3PCMean=splitapply(@mean,BLADREADDCNO_R3PC.CorrectPercent,BLADREADDCNO_R3PC.day);
BLADREADDCNO_R3PCSEM=splitapply(@std,BLADREADDCNO_R3PC.CorrectPercent,BLADREADDCNO_R3PC.day)./sqrt(splitapply(@length,BLADREADDCNO_R3PC.CorrectPercent,BLADREADDCNO_R3PC.day));

BLADREADDVEH_R3PCMean=splitapply(@mean,BLADREADDVEH_R3PC.CorrectPercent,BLADREADDVEH_R3PC.day);
BLADREADDVEH_R3PCSEM=splitapply(@std,BLADREADDVEH_R3PC.CorrectPercent,BLADREADDVEH_R3PC.day)./sqrt(splitapply(@length,BLADREADDVEH_R3PC.CorrectPercent,BLADREADDVEH_R3PC.day));


%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R3PCMean),BLADREADDCNO_R3PCMean,'b-');
hold on
plot(1:size(BLADREADDVEH_R3PCMean),BLADREADDVEH_R3PCMean,'g-');
shadedErrorBar(1:length(BLADREADDCNO_R3PCMean),BLADREADDCNO_R3PCMean,BLADREADDCNO_R3PCSEM, 'lineprops', 'b-')
shadedErrorBar(1:length(BLADREADDVEH_R3PCMean),BLADREADDVEH_R3PCMean,BLADREADDVEH_R3PCSEM, 'lineprops', 'g-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R3 (90/10)')
legend ({'CNO1(n=4)','VEH1(n=5)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%OFC SB D5 PC - R4 
OFCDREADDVEH_R4PC=R4Day(R4Day.brainregion==0 & R4Day.virus==1 & R4Day.drug==0,:); %OFC hM4DI DREADDs- VEH 
OFCDREADDCNO_R4PC=R4Day(R4Day.brainregion==0 & R4Day.virus==1 & R4Day.drug==1,:);  %OFC hM4DI DREADDs- CNO 
EGFPVEH_R4PC=R4Day(R4Day.virus==0 & R4Day.drug==0,:);  %All eGFP Control- VEH
EGFPCNO_R4PC=R4Day(R4Day.virus==0 & R4Day.drug==1,:); %All eGFP Control- CNO

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug

%Calculate Means & SEMs for each groups in each day

OFCDREADDCNO_R4PCMean=splitapply(@mean,OFCDREADDCNO_R4PC.CorrectPercent,OFCDREADDCNO_R4PC.day);
OFCDREADDCNO_R4PCSEM=splitapply(@std,OFCDREADDCNO_R4PC.CorrectPercent,OFCDREADDCNO_R4PC.day)./sqrt(splitapply(@length,OFCDREADDCNO_R4PC.CorrectPercent,OFCDREADDCNO_R4PC.day));

OFCDREADDVEH_R4PCMean=splitapply(@mean,OFCDREADDVEH_R4PC.CorrectPercent,OFCDREADDVEH_R4PC.day);
OFCDREADDVEH_R4PCSEM=splitapply(@std,OFCDREADDVEH_R4PC.CorrectPercent,OFCDREADDVEH_R4PC.day)./sqrt(splitapply(@length,OFCDREADDVEH_R4PC.CorrectPercent,OFCDREADDVEH_R4PC.day));

EGFPCNO_R4PCMean=splitapply(@mean,EGFPCNO_R4PC.CorrectPercent,EGFPCNO_R4PC.day);
EGFPCNO_R4PCSEM=splitapply(@std,EGFPCNO_R4PC.CorrectPercent,EGFPCNO_R4PC.day)./sqrt(splitapply(@length,EGFPCNO_R4PC.CorrectPercent,EGFPCNO_R4PC.day));

EGFPVEH_R4PCMean=splitapply(@mean,EGFPVEH_R4PC.CorrectPercent,EGFPVEH_R4PC.day);
EGFPVEH_R4PCSEM=splitapply(@std,EGFPVEH_R4PC.CorrectPercent,EGFPVEH_R4PC.day)./sqrt(splitapply(@length,EGFPVEH_R4PC.CorrectPercent,EGFPVEH_R4PC.day));


%%
%Plot figure OFC (CNO vs. VEH (HM4DI))

figure 
plot(1:size(OFCDREADDCNO_R4PCMean),OFCDREADDCNO_R4PCMean,'g-');
hold on
plot(1:size(OFCDREADDVEH_R4PCMean),OFCDREADDVEH_R4PCMean,'b-');
shadedErrorBar(1:length(OFCDREADDCNO_R4PCMean),OFCDREADDCNO_R4PCMean,OFCDREADDCNO_R4PCSEM, 'lineprops', 'g-')
shadedErrorBar(1:length(OFCDREADDVEH_R4PCMean),OFCDREADDVEH_R4PCMean,OFCDREADDVEH_R4PCSEM, 'lineprops', 'b-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('OFC hM4Di R4 (90/10)')
legend ({'CNO2(n=8)','VEH2(n=5)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%Plot figure (CNO vs. VEH (EGFP))

figure 
plot(1:size(EGFPCNO_R4PCMean),EGFPCNO_R4PCMean,'g-');
hold on
plot(1:size(EGFPVEH_R4PCMean),EGFPVEH_R4PCMean,'b-');
shadedErrorBar(1:length(EGFPCNO_R4PCMean),EGFPCNO_R4PCMean,EGFPCNO_R4PCSEM,'lineprops', 'g-')
shadedErrorBar(1:length(EGFPVEH_R4PCMean),EGFPVEH_R4PCMean,EGFPVEH_R4PCSEM, 'lineprops', 'b-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('eGFP R4 (90/10)')
legend ({'CNO2(n=8)','VEH2(n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%BLA SB D5 PC - R4 

%Create percent correct data tables for DREADDs/eGFP groups & CNO/VEH drug
BLADREADDVEH_R4PC=R4Day(R4Day.brainregion==1 & R4Day.virus==1 & R4Day.drug==0,:); %BLA hM4DI DREADDs- VEH 
BLADREADDCNO_R4PC=R4Day(R4Day.brainregion==1 & R4Day.virus==1 & R4Day.drug==1,:);  %BLA hM4DI DREADDs- CNO  

%Calculate Means & SEMs for each groups in each day

BLADREADDCNO_R4PCMean=splitapply(@mean,BLADREADDCNO_R4PC.CorrectPercent,BLADREADDCNO_R4PC.day);
BLADREADDCNO_R4PCSEM=splitapply(@std,BLADREADDCNO_R4PC.CorrectPercent,BLADREADDCNO_R4PC.day)./sqrt(splitapply(@length,BLADREADDCNO_R4PC.CorrectPercent,BLADREADDCNO_R4PC.day));

BLADREADDVEH_R4PCMean=splitapply(@mean,BLADREADDVEH_R4PC.CorrectPercent,BLADREADDVEH_R4PC.day);
BLADREADDVEH_R4PCSEM=splitapply(@std,BLADREADDVEH_R4PC.CorrectPercent,BLADREADDVEH_R4PC.day)./sqrt(splitapply(@length,BLADREADDVEH_R4PC.CorrectPercent,BLADREADDVEH_R4PC.day));


%Plot figure BLA (CNO vs. VEH (HM4DI))

figure 
plot(1:size(BLADREADDCNO_R4PCMean),BLADREADDCNO_R4PCMean,'g-');
hold on
plot(1:size(BLADREADDVEH_R4PCMean),BLADREADDVEH_R4PCMean,'b-');
shadedErrorBar(1:length(BLADREADDCNO_R4PCMean),BLADREADDCNO_R4PCMean,BLADREADDCNO_R4PCSEM, 'lineprops', 'g-')
shadedErrorBar(1:length(BLADREADDVEH_R4PCMean),BLADREADDVEH_R4PCMean,BLADREADDVEH_R4PCSEM, 'lineprops', 'b-')

plot([0 15],[0.5,0.5],'--k')
hold off
 
title('BLA hM4Di R4 (90/10)')
legend ({'CNO2(n=5)','VEH2(n=4)'}, 'Location','southeast','FontSize',16,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','LineWidth',1); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Session'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')
