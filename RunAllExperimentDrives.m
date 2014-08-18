% % Condition 1 = base, 2 = involuntary, 3 = voluntary
% addpath('Part101')
% addpath('Part102')
% addpath('Part103')
% addpath('Part105')
% addpath('Part106')
% addpath('Part107')
% addpath('Part108')
% addpath('Part109')
% addpath('Part110')
% addpath('Part111')
% addpath('Part112')
% addpath('Part113') 
% addpath('Part114')
% addpath('Part115')
% addpath('Part116')
% addpath('Part117')
% addpath('Part118')
% addpath('Part119')
% addpath('Part120')
% addpath('Part121')
% addpath('Part122')
% addpath('Part123')
% addpath('Part124')
% addpath('Part125')
% addpath('Part126')
% addpath('Part127')
% addpath('Part129')
% addpath('Part130')
% addpath('Part131')
% addpath('Part132')
% addpath('Part133')
% addpath('Part134')
% addpath('Part135')
% addpath('Part136')
% addpath('Part137')
% addpath('Part138')
% 


condition = 'base'; 
load('C:\Users\lhoek_000\Documents\MATLAB\Part101\Part101Drives.mat');
partLabel = '101';
runDriveFile(partLabel, condition, Part101_DriveA_base);


clearvars -except condition;
load('C:\Users\lhoek_000\Documents\MATLAB\Part102\Part102Drives.mat');
partLabel = '102'; 
runDriveFile(partLabel, condition, Part102_DriveA_base);


% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part103\Part103Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part103_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 103; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part105\Part105Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part105_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 105; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part106\Part106Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part106_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 106; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part107\Part107Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part107_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 107; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part108\Part108Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part108_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 108; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part109\Part109Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part109_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 109; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part110\Part110Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part110_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 110; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part111\Part111Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part111_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 111; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part112\Part112Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part112_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 112; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part113\Part113Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part113_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 113; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part114\Part114Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part114_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 114; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part115\Part115Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part115_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 115; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part116\Part116Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part116_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 116; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part117\Part117Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part117_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 117; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part118\Part118Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part118_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 118; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1;
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part119\Part119Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part119_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 119; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part120\Part120Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part120_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 120; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part121\Part121Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part121_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 121; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part122\Part122Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part122_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 122; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part123\Part123Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part123_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 123; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part124\Part124Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part124_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 124; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part125\Part125Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part125_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 125; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part126\Part126Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part126_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 126; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part127\Part127Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part127_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 127; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part129\Part129Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part129_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 129; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part130\Part130Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part130_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 130; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part131\Part131Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part131_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 131; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part132\Part132Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part132_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 132; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part133\Part133Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part133_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 133; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part134\Part134Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part134_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 134; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part135\Part135Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part135_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 135; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part136\Part136Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part136_DriveB_base);
% % AllDrivingMetrics(rowIndex,1) = 136; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part137\Part137Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part137_DriveA_base);
% % AllDrivingMetrics(rowIndex,1) = 137; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part138\Part138Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part138_DriveC_base);
% % AllDrivingMetrics(rowIndex,1) = 138; 
% % AllDrivingMetrics(rowIndex,2) = 1  ;
% % rowIndex = rowIndex + 1; 
% 
% condition = 'invol'; 
% clearvars -except condition;
% load('C:\Users\lhoek_000\Documents\MATLAB\Part101\Part101Drives.mat');
% partLabel = '101'; 
% runDriveFile(partLabel, condition, Part101_DriveB_invol);
% 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part101\Part101Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part101_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 101; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part102\Part102Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part102_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 102; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part103\Part103Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part103_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 103; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part105\Part105Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part105_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 105; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part106\Part106Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part106_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 106; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part107\Part107Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part107_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 107; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part108\Part108Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part108_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 108; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part109\Part109Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part109_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 109; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part110\Part110Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part110_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 110; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part111\Part111Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part111_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 111; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part112\Part112Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part112_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 112; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part113\Part113Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part113_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 113; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part114\Part114Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part114_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 114; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part115\Part115Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part115_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 115; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part116\Part116Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part116_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 116; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part117\Part117Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part117_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 117; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part118\Part118Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part118_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 118; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1;
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part119\Part119Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part119_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 119; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part120\Part120Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part120_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 120; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part121\Part121Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part121_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 121; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part122\Part122Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part122_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 122; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part123\Part123Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part123_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 123; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part124\Part124Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part124_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 124; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part125\Part125Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part125_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 125; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part126\Part126Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part126_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 126; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part127\Part127Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part127_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 127; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part129\Part129Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part129_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 129; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part130\Part130Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part130_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 130; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part131\Part131Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part131_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 131; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part132\Part132Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part132_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 132; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part133\Part133Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part133_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 133; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part134\Part134Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part134_DriveB_invol);
% % AllDrivingMetrics(rowIndex,1) = 134; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part135\Part135Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part135_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 135; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part136\Part136Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part136_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 136; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part137\Part137Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part137_DriveC_invol);
% % AllDrivingMetrics(rowIndex,1) = 137; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part138\Part138Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part138_DriveA_invol);
% % AllDrivingMetrics(rowIndex,1) = 138; 
% % AllDrivingMetrics(rowIndex,2) = 2  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part101\Part101Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part101_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 101; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% 
% condition = 'vol'; 
% clearvars -except condition;
% load('C:\Users\lhoek_000\Documents\MATLAB\Part101\Part101Drives.mat');
% partLabel = '101'; 
% runDriveFile(partLabel, condition, Part101_DriveC_vol);
% 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part102\Part102Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part102_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 102; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part103\Part103Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part103_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 103; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part105\Part105Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part105_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 105; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part106\Part106Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part106_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 106; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part107\Part107Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part107_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 107; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part108\Part108Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part108_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 108; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part109\Part109Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part109_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 109; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part110\Part110Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part110_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 110; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part111\Part111Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part111_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 111; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part112\Part112Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part112_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 112; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part113\Part113Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part113_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 113; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part114\Part114Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part114_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 114; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part115\Part115Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part115_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 115; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part116\Part116Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part116_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 116; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part117\Part117Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part117_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 117; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part118\Part118Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part118_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 118; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1;
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part119\Part119Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part119_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 119; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part120\Part120Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part120_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 120; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part121\Part121Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part121_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 121; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part122\Part122Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part122_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 122; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part123\Part123Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part123_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 123; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part124\Part124Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part124_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 124; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part125\Part125Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part125_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 125; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part126\Part126Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part126_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 126; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part127\Part127Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part127_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 127; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part129\Part129Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part129_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 129; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part130\Part130Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part130_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 130; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part131\Part131Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part131_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 131; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part132\Part132Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part132_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 132; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part133\Part133Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part133_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 133; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part134\Part134Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part134_DriveA_vol);
% % AllDrivingMetrics(rowIndex,1) = 134; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part135\Part135Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part135_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 135; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part136\Part136Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part136_DriveC_vol);
% % AllDrivingMetrics(rowIndex,1) = 136; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part137\Part137Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part137_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 137; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % 
% % clearvars -except AllDrivingMetrics rowIndex;
% % load('C:\Users\lhoek_000\Documents\MATLAB\Part138\Part138Drives.mat');
% % AllDrivingMetrics(rowIndex, 3:18) = getAccelReleaseTimes(Part138_DriveB_vol);
% % AllDrivingMetrics(rowIndex,1) = 138; 
% % AllDrivingMetrics(rowIndex,2) = 3  ;
% % rowIndex = rowIndex + 1; 
% % clearvars -except AllDrivingMetrics rowIndex;
% %  AllDrivingMetrics
% xlswrite('RuralDrivingMetrics', AllDrivingMetrics,'AccelReleaseTimesBrakeEvents','A1');



