function runDriveFile(partLabel, condition, driveFile)
ttcInfo = driveFile.SCC_Follow_Info(:,5);
leadVel = driveFile.SCC_Follow_Info(:,6);
distObj = driveFile.SCC_OwnVehToLeadObjDist; 
frames = driveFile.Frames;
speed = driveFile.VDS_Veh_Speed;
laneDev = driveFile.SCC_Lane_Deviation(:,2);
steerAngle = driveFile.CFS_Steering_Wheel_Angle; 
accPedalPosition = driveFile.CFS_Accelerator_Pedal_Position;
brakePedalForce = driveFile.CFS_Brake_Pedal_Force;
log_notif = driveFile.SCC_LogStreams(:,1);
log_Braking = driveFile.SCC_LogStreams(:,2);
log_Unexpected = driveFile.SCC_LogStreams(:,3);
log_Gap = driveFile.SCC_LogStreams(:,4);
log_Location = driveFile.SCC_LogStreams(:,5);
collisions = driveFile.SCC_Collision_Count; 
adjustTTC = zeros(size(ttcInfo));
for i = 1: size(ttcInfo)
    if (ttcInfo(i) > 200)
        adjustTTC(i) = -5;
    else
        adjustTTC(i) = ttcInfo(i);
    end
end

regionsLevel1 = PopulateRegion1StepFunction(frames, log_Braking, log_Unexpected, log_Gap, log_Location);
regionsLevel2 = PopulateRegion2StepFunction(frames, log_Braking, log_Unexpected, log_Gap, log_Location);
regionsLevel3 = PopulateRegion3StepFunction(frames, log_Braking, log_Unexpected, log_Gap, log_Location);
braking_fn = PopulateBrakingStepFunction(frames, accPedalPosition, brakePedalForce);
accel_fn = GetSpeedAccelerationFn(frames, speed);
%   figNum = 1; 
%      figure(figNum);
%  plot(frames, speed, frames ,regionsLevel2*2, frames, braking_fn*10, frames, adjustTTC, frames, leadVel, frames, collisions)

%Entire Drive data
    %get start/end drive
    startDriveIndex = getStartDrive(speed); 
    endDriveIndex = getEndDrive(speed); 

    %get drive and region lengths in frames and MS
    driveFrames = endDriveIndex - startDriveIndex;
    driveTimeMS = (driveFrames / 60) * 1000; 
    
    %find frame where urban starts and thus speed limit changes for speeding
    %metrics
    driveSpeedChangeVector = find(regionsLevel1 == 3); 
    driveSpeedChangeFrame = driveSpeedChangeVector(1); 
 
    %Threshold list
    SpeedOver2kmph = 1.24;
    SpeedOver10kmph =  6.2; 
    SpeedOver20kmph = 12.4; 
    %Agg speed metrics
    %number of frames 2kmph, 10kmph, 20kmph over the speed limit ( 1.24mph, 6.2mph, 12.4mph over)
    getSpeedingDur2_Agg = getSpeedingDurations(0, driveSpeedChangeFrame, SpeedOver2kmph, speed, startDriveIndex, endDriveIndex, 0);
    getSpeedingDur10_Agg = getSpeedingDurations(0, driveSpeedChangeFrame, SpeedOver10kmph, speed, startDriveIndex, endDriveIndex, 0);
    getSpeedingDur20_Agg = getSpeedingDurations(0, driveSpeedChangeFrame, SpeedOver20kmph, speed, startDriveIndex, endDriveIndex, 0);
     %All brake info
     brakingSummary_table  = getBrakingInfo(braking_fn, accel_fn, startDriveIndex, endDriveIndex, frames, partLabel, regionsLevel1, regionsLevel2, regionsLevel3);
     %Count hard brakes
     hardBrakeCountSummary_point2gs = getHardBrakes(-.2, brakingSummary_table, 0);
     hardBrakeCountSummary_point3gs = getHardBrakes(-.3, brakingSummary_table, 0);
     hardBrakeCountSummary_point4gs = getHardBrakes(-.4, brakingSummary_table, 0);
     hardBrakeCountSummary_point6gs = getHardBrakes(-.6, brakingSummary_table, 0);
%Regions Level 1 data 
    regionsLevel1Durations = getRegionDurations(regionsLevel1, startDriveIndex, endDriveIndex);
    regionL1DurFrames = regionsLevel1Durations(:,2);
     %number of frames 2kmph, 10kmph, 20kmph over the speed limit ( 1.24mph, 6.2mph, 12.4mph over)
    getSpeedingDur2_Level1 = getSpeedingDurations(regionsLevel1, driveSpeedChangeFrame, SpeedOver2kmph, speed, startDriveIndex, endDriveIndex, regionL1DurFrames);
    getSpeedingDur10_Level1 = getSpeedingDurations(regionsLevel1, driveSpeedChangeFrame, SpeedOver10kmph, speed, startDriveIndex, endDriveIndex, regionL1DurFrames);
    getSpeedingDur20_Level1 = getSpeedingDurations(regionsLevel1, driveSpeedChangeFrame, SpeedOver20kmph, speed, startDriveIndex, endDriveIndex, regionL1DurFrames);

    %run speed/lanedev on all drives
    drivingMetrics_speed_Level1 = getSpeedMetrics( regionsLevel1, speed, startDriveIndex, endDriveIndex);
    drivingMetrics_lanePos_Level1 = getLaneDevMetrics(regionsLevel1, laneDev, startDriveIndex, endDriveIndex);
   
    %Count hard brakes
    hardBrakeCountRegionsLevel1_point2gs = getHardBrakes(-.2, brakingSummary_table, regionsLevel1);
    hardBrakeCountRegionsLevel1_point3gs = getHardBrakes(-.3, brakingSummary_table, regionsLevel1);
    hardBrakeCountRegionsLevel1_point4gs = getHardBrakes(-.4, brakingSummary_table, regionsLevel1);
    hardBrakeCountRegionsLevel1_point6gs = getHardBrakes(-.6, brakingSummary_table, regionsLevel1);

 %Regions Level 2 data 
    regionsLevel2Durations = getRegionDurations(regionsLevel2, startDriveIndex, endDriveIndex);
    regionL2DurFrames = regionsLevel2Durations(:,2);
    %number of frames 2kmph, 10kmph, 20kmph over the speed limit ( 1.24mph, 6.2mph, 12.4mph over)
    getSpeedingDur2_Level2= getSpeedingDurations(regionsLevel2, driveSpeedChangeFrame, SpeedOver2kmph, speed, startDriveIndex, endDriveIndex, regionL2DurFrames);
    getSpeedingDur10_Level2 = getSpeedingDurations(regionsLevel2, driveSpeedChangeFrame, SpeedOver10kmph, speed, startDriveIndex, endDriveIndex, regionL2DurFrames);
    getSpeedingDur20_Level2 = getSpeedingDurations(regionsLevel2, driveSpeedChangeFrame, SpeedOver20kmph, speed, startDriveIndex, endDriveIndex, regionL2DurFrames);

    %run speed/lanedev on all drives
    drivingMetrics_speed_Level2 = getSpeedMetrics( regionsLevel2, speed, startDriveIndex, endDriveIndex);
    drivingMetrics_lanePos_Level2 = getLaneDevMetrics(regionsLevel2, laneDev, startDriveIndex, endDriveIndex);
       
    %Count hard brakes
    hardBrakeCountRegionsLevel2_point2gs = getHardBrakes(-.2, brakingSummary_table, regionsLevel2);
    hardBrakeCountRegionsLevel2_point3gs = getHardBrakes(-.3, brakingSummary_table, regionsLevel2);
    hardBrakeCountRegionsLevel2_point4gs = getHardBrakes(-.4, brakingSummary_table, regionsLevel2);
    hardBrakeCountRegionsLevel2_point6gs = getHardBrakes(-.6, brakingSummary_table, regionsLevel2);

 %Regions Level 3 data 
    regionsLevel3Durations = getRegionDurations(regionsLevel3, startDriveIndex, endDriveIndex);
    regionL3DurFrames = regionsLevel3Durations(:,2);
     %number of frames 2kmph, 10kmph, 20kmph over the speed limit ( 1.24mph, 6.2mph, 12.4mph over)
    getSpeedingDur2_Level3 = getSpeedingDurations(regionsLevel3, driveSpeedChangeFrame, SpeedOver2kmph, speed, startDriveIndex, endDriveIndex, regionL3DurFrames);
    getSpeedingDur10_Level3 = getSpeedingDurations(regionsLevel3, driveSpeedChangeFrame, SpeedOver10kmph, speed, startDriveIndex, endDriveIndex, regionL3DurFrames);
    getSpeedingDur20_Level3 = getSpeedingDurations(regionsLevel3, driveSpeedChangeFrame, SpeedOver20kmph, speed, startDriveIndex, endDriveIndex, regionL3DurFrames);

    %run speed/lanedev on all drives
    drivingMetrics_speed_Level3 = getSpeedMetrics( regionsLevel3, speed, startDriveIndex, endDriveIndex);
    drivingMetrics_lanePos_Level3 = getLaneDevMetrics(regionsLevel3, laneDev, startDriveIndex, endDriveIndex);
   
    %Count hard brakes
    hardBrakeCountRegionsLevel3_point2gs = getHardBrakes(-.2, brakingSummary_table, regionsLevel3);
    hardBrakeCountRegionsLevel3_point3gs = getHardBrakes(-.3, brakingSummary_table, regionsLevel3);
    hardBrakeCountRegionsLevel3_point4gs = getHardBrakes(-.4, brakingSummary_table, regionsLevel3);
    hardBrakeCountRegionsLevel3_point6gs = getHardBrakes(-.6, brakingSummary_table, regionsLevel3);

%braking events
 eventMetricsBrake1 = getEventBrakingMetrics(3,endDriveIndex, regionsLevel3, braking_fn, ttcInfo, accel_fn);
 eventMetricsBrake2 = getEventBrakingMetrics(6,endDriveIndex, regionsLevel3, braking_fn, ttcInfo, accel_fn);
 eventMetricsBrake3 = getEventBrakingMetrics(9,endDriveIndex, regionsLevel3, braking_fn, ttcInfo, accel_fn);
 eventMetricsBrake4 = getEventBrakingMetrics(12,endDriveIndex, regionsLevel3, braking_fn, ttcInfo, accel_fn);
 %bike event
  eventMetricsBikeSmallSlice = getEventBrakingMetrics(15,endDriveIndex, regionsLevel3, braking_fn, ttcInfo, accel_fn);
  eventMetricsBikeBigSlice = getEventBrakingMetrics(6,endDriveIndex, regionsLevel2, braking_fn, ttcInfo, accel_fn);
 %pullout car event
 eventMetricsPullOutCarSmallSlice = getEventBrakingMetrics(37,endDriveIndex, regionsLevel3, braking_fn, ttcInfo, accel_fn);
  eventMetricsPullOutCarBigSlice = getEventBrakingMetrics(19,endDriveIndex, regionsLevel2, braking_fn, ttcInfo, accel_fn);
    
  dataLabels = [{'startIndex'}, {'endIndex'}, {'startAccelReleaseIndex'}, {'accelReleaseDurFrames'},{'accelReleaseTimeMs'},{'startBrakeIndex'}, {'movementDurFrames'},{'movementDurTimeMS'},{'brakeRespDurFrames'},{'brakeRespTimeMS'}, {'minTTCEntire'},{'minTTCBrakeSection'}, {'minAccelEntire'},{'minAccelBrakeSection'}, {'didBrakeStartInRegion'}, {'didBrakeEndInRegion'}, {'endBrakeIndex'}];
    printPartData(partLabel, condition, eventMetricsBrake1, dataLabels, 'eventMetricsBrake1');
    printPartData(partLabel, condition, eventMetricsBrake2, dataLabels, 'eventMetricsBrake2');   
    printPartData(partLabel, condition, eventMetricsBrake3, dataLabels, 'eventMetricsBrake3');
    printPartData(partLabel, condition, eventMetricsBrake4, dataLabels, 'eventMetricsBrake4');
    printPartData(partLabel, condition, eventMetricsBikeSmallSlice, dataLabels, 'eventBikeSmallSlice');
    printPartData(partLabel, condition, eventMetricsBikeBigSlice, dataLabels, 'eventBikeBigSlice');   
    printPartData(partLabel, condition, eventMetricsPullOutCarSmallSlice, dataLabels, 'eventPullOutCarSmSlice');
    printPartData(partLabel, condition, eventMetricsPullOutCarBigSlice, dataLabels, 'eventPullOutCarBigSlice');
%Driving metrics printouts 
%Agg region printouts
dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedPercentFrames'}]; 
printPartData(partLabel, condition, getSpeedingDur2_Agg, dataLabels, 'AggSpeeding2kph');
dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver10kphPercent'}]; 
printPartData(partLabel, condition, getSpeedingDur10_Agg, dataLabels, 'AggSpeeding10kph');
dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver20kphPercent'}]; 
printPartData(partLabel, condition, getSpeedingDur20_Agg, dataLabels, 'AggSpeeding20kph');

dataLabels = [{'BrakeMovementDurMS'}, {'BrakeCount'}, {'BrakeFirstIndex'}, {'BrakeFirstFrame'}, {'BrakeDurFrames'},{'BrakeMovementDurFrames'}, {'BrakeAveAccel'}, {'BrakeMinAccel'},{'RegionL1'},{'RegionL2'},{'RegionL3'}];
printPartData(partLabel, condition, brakingSummary_table, dataLabels, 'IndividualBrakeInfo');
dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint2Gs'}];
printPartData(partLabel, condition, hardBrakeCountSummary_point2gs, dataLabels, 'AggBrakeCountPlusPoint2Gs');
dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint3Gs'}];
printPartData(partLabel, condition, hardBrakeCountSummary_point3gs, dataLabels, 'AggBrakeCountPlusPoint3Gs');
dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint4Gs'}];
printPartData(partLabel, condition, hardBrakeCountSummary_point4gs, dataLabels, 'AggBrakeCountPlusPoint4Gs');
dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint6Gs'}];
printPartData(partLabel, condition, hardBrakeCountSummary_point6gs, dataLabels, 'AggBrakeCountPlusPoint6Gs');

driveAggs = [startDriveIndex, endDriveIndex, driveFrames, driveTimeMS]; 
dataLabels = [{'StartDriveIndex'}, {'endDriveIndex'}, {'DriveFrames'}, {'DriveTimeMS'}]; 
printPartData(partLabel, condition, driveAggs, dataLabels, 'aggRegionMetrics');

%Region Level 1 printouts
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedPercentFrames'}]; 
    printPartData(partLabel, condition, getSpeedingDur2_Level1, dataLabels, 'regionsLevel1Speeding2kph');
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver10kphPercent'}]; 
    printPartData(partLabel, condition, getSpeedingDur10_Level1, dataLabels, 'regionsLevel1Speeding10kph');
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver20kphPercent'}]; 
    printPartData(partLabel, condition, getSpeedingDur20_Level1, dataLabels, 'regionsLevel1Speeding20kph');
     dataLabels = [{'Region'}, {'DriveFrames'}, {'DriveTimeMS'}]; 
    printPartData(partLabel, condition, regionsLevel1Durations, dataLabels, 'regionsLevel1Durations');
    dataLabels = [{'Region'}, {'SpeedAve'}, {'SpeedVariability'}]; 
    printPartData(partLabel, condition, drivingMetrics_speed_Level1, dataLabels, 'drivingMetrics_speed_Level1');
    dataLabels = [{'Region'}, {'LaneDevVariability'}]; 
    printPartData(partLabel, condition, drivingMetrics_lanePos_Level1, dataLabels, 'drivingMetrics_lanePos_Level1');

    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint2Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel1_point2gs, dataLabels, 'L1BrakeCountPlusPoint2Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint3Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel1_point3gs, dataLabels, 'L1BrakeCountPlusPoint3Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint4Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel1_point4gs, dataLabels, 'L1BrakeCountPlusPoint4Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint6Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel1_point6gs, dataLabels, 'L1BrakeCountPlusPoint6Gs');

%Region Level 2 printouts
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedPercentFrames'}]; 
    printPartData(partLabel, condition, getSpeedingDur2_Level2, dataLabels, 'regionsLevel2Speeding2kph');
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver10kphPercent'}]; 
    printPartData(partLabel, condition, getSpeedingDur10_Level2, dataLabels, 'regionsLevel2Speeding10kph');
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver20kphPercent'}]; 
    printPartData(partLabel, condition, getSpeedingDur20_Level2, dataLabels, 'regionsLevel2Speeding20kph');
     dataLabels = [{'Region'}, {'DriveFrames'}, {'DriveTimeMS'}]; 
    printPartData(partLabel, condition, regionsLevel2Durations, dataLabels, 'regionsLevel2Durations');
    dataLabels = [{'Region'}, {'SpeedAve'}, {'SpeedVariability'}]; 
    printPartData(partLabel, condition, drivingMetrics_speed_Level2, dataLabels, 'drivingMetrics_speed_Level2');
    dataLabels = [{'Region'}, {'LaneDevVariability'}]; 
    printPartData(partLabel, condition, drivingMetrics_lanePos_Level2, dataLabels, 'drivingMetrics_lanePos_Level2');

    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint2Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel2_point2gs, dataLabels, 'L2BrakeCountPlusPoint2Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint3Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel2_point3gs, dataLabels, 'L2BrakeCountPlusPoint3Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint4Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel2_point4gs, dataLabels, 'L2BrakeCountPlusPoint4Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint6Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel2_point6gs, dataLabels, 'L2BrakeCountPlusPoint6Gs');

%Region Level 3 printouts
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedPercentFrames'}]; 
    printPartData(partLabel, condition, getSpeedingDur2_Level3, dataLabels, 'regionsLevel3Speeding2kph');
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver10kphPercent'}]; 
    printPartData(partLabel, condition, getSpeedingDur10_Level3, dataLabels, 'regionsLevel3Speeding10kph');
    dataLabels = [{'Region'}, {'SpeedNumFrames'}, {'SpeedTime'}, {'SpeedOver20kphPercent'}]; 
    printPartData(partLabel, condition, getSpeedingDur20_Level3, dataLabels, 'regionsLevel3Speeding20kph');
     dataLabels = [{'Region'}, {'DriveFrames'}, {'DriveTimeMS'}]; 
    printPartData(partLabel, condition, regionsLevel3Durations, dataLabels, 'regionsLevel3Durations');
    dataLabels = [{'Region'}, {'SpeedAve'}, {'SpeedVariability'}]; 
    printPartData(partLabel, condition, drivingMetrics_speed_Level3, dataLabels, 'drivingMetrics_speed_Level3');
    dataLabels = [{'Region'}, {'LaneDevVariability'}]; 
    printPartData(partLabel, condition, drivingMetrics_lanePos_Level3, dataLabels, 'drivingMetrics_lanePos_Level3');

    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint2Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel3_point2gs, dataLabels, 'L3BrakeCountPlusPoint2Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint3Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel3_point3gs, dataLabels, 'L3BrakeCountPlusPoint3Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint4Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel3_point4gs, dataLabels, 'L3BrakeCountPlusPoint4Gs');
    dataLabels = [{'BrakeRegion'},{'BrakeCountPlusPoint6Gs'}];
    printPartData(partLabel, condition, hardBrakeCountRegionsLevel3_point6gs, dataLabels, 'L3BrakeCountPlusPoint6Gs');






glanceThresh1 = 100;
glanceThresh2 = 1600;
glanceThresh3 = 2000; 
if (strcmpi(condition,'invol'))
    load('involGlanceData.mat');
    involGlanceFn = PopulateGlanceStepFunction(frames, InvolGlanceStartFrame, partLabel, InvolGlancePart, InvolGlanceDur);
    %Regions Level 1 data 
        involGlanceCountRegionsLevel1 = CountGlanceInRegionFunction(glanceThresh1, frames(1), regionsLevel1, InvolGlanceStartFrame, partLabel, InvolGlancePart, InvolGlanceDurMS);
        involglanceDurByRegionLevel1 = GlanceDurInRegion(regionsLevel1, involGlanceFn);

        dataLabels = [{'Region'}, {'InvolGlanceNum100msPlus'}]; 
        printPartData(partLabel, condition, involGlanceCountRegionsLevel1, dataLabels, 'involGlanceCountLevel1');
        dataLabels = [{'Region'}, {'InvolGlanceDurFrames'}, {'InvolGlanceDurMS'}]; 
        printPartData(partLabel, condition, involglanceDurByRegionLevel1, dataLabels, 'involglanceDurByLevel1');
    %Regions Level 2 data 
        involGlanceCountRegionsLevel2 = CountGlanceInRegionFunction(glanceThresh1, frames(1), regionsLevel2, InvolGlanceStartFrame, partLabel, InvolGlancePart, InvolGlanceDurMS);
        involglanceDurByRegionLevel2 = GlanceDurInRegion(regionsLevel2, involGlanceFn);

        dataLabels = [{'Region'}, {'InvolGlanceNum100msPlus'}]; 
        printPartData(partLabel, condition, involGlanceCountRegionsLevel2, dataLabels, 'involGlanceCountLevel2');
        dataLabels = [{'Region'}, {'InvolGlanceDurFrames'}, {'InvolGlanceDurMS'}]; 
        printPartData(partLabel, condition, involglanceDurByRegionLevel2, dataLabels, 'involglanceDurByLevel2');
    %Regions Level 3 data 
        involGlanceCountRegionsLevel3 = CountGlanceInRegionFunction(glanceThresh1, frames(1), regionsLevel3, InvolGlanceStartFrame, partLabel, InvolGlancePart, InvolGlanceDurMS);
        involglanceDurByRegionLevel3 = GlanceDurInRegion(regionsLevel3, involGlanceFn);

        dataLabels = [{'Region'}, {'InvolGlanceNum100msPlus'}]; 
        printPartData(partLabel, condition, involGlanceCountRegionsLevel3, dataLabels, 'involGlanceCountLevel3');
        dataLabels = [{'Region'}, {'InvolGlanceDurFrames'}, {'InvolGlanceDurMS'}]; 
        printPartData(partLabel, condition, involglanceDurByRegionLevel3, dataLabels, 'involglanceDurByLevel3');
    
end
if (strcmpi(condition,'vol')) 
    load('volGlanceData.mat');
    load('volTapData.mat');
       
    volGlanceFn = PopulateGlanceStepFunction(frames, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurFrames);
    volTapFn = PopulateTapStepFunction(frames, VolTapFrame, partLabel, VolTapPart); 
    
    %Regions Level 1 data 
        glanceDurByRegionLevel1 = GlanceDurInRegion(regionsLevel1, volGlanceFn); 
        volGlanceCountRegionsLevel1_100ms = CountGlanceInRegionFunction(glanceThresh1, frames(1), regionsLevel1, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volGlanceCountRegionsLevel1_1600ms = CountGlanceInRegionFunction(glanceThresh2, frames(1), regionsLevel1, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volGlanceCountRegionsLevel1_2000ms = CountGlanceInRegionFunction(glanceThresh3, frames(1), regionsLevel1, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volTapCountRegionsLevel1 = CountTapInRegionFunction(frames(1), regionsLevel1, VolTapFrame, partLabel, VolTapPart);
       
        dataLabels = [{'Region'}, {'VolGlanceDurFrames'}, {'VolGlanceDurMS'}]; 
        printPartData(partLabel, condition, glanceDurByRegionLevel1, dataLabels, 'volGlanceDurByLevel1');
        dataLabels = [{'Region'}, {'VolGlanceNum100msPlus'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel1_100ms, dataLabels, 'volGlanceCountLevel1_100ms');
        dataLabels = [{'Region'}, {'VolGlanceNum1600msPlus'}, {'SpeedTime'}, {'SpeedPercentFrames'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel1_1600ms, dataLabels, 'volGlanceCountLevel1_1600ms');
        dataLabels = [{'Region'}, {'VolGlanceNum2000msPlus'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel1_2000ms, dataLabels, 'volGlanceCountLevel1_2000ms');
        dataLabels = [{'Region'}, {'VolTapNum'}]; 
        printPartData(partLabel, condition, volTapCountRegionsLevel1, dataLabels, 'volTapCountLevel1');
    
    %Regions Level 2 data 
        glanceDurByRegionLevel2 = GlanceDurInRegion(regionsLevel2, volGlanceFn); 
        volGlanceCountRegionsLevel2_100ms = CountGlanceInRegionFunction(glanceThresh1, frames(1), regionsLevel2, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volGlanceCountRegionsLevel2_1600ms = CountGlanceInRegionFunction(glanceThresh2, frames(1), regionsLevel2, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volGlanceCountRegionsLevel2_2000ms = CountGlanceInRegionFunction(glanceThresh3, frames(1), regionsLevel2, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volTapCountRegionsLevel2 = CountTapInRegionFunction(frames(1), regionsLevel2, VolTapFrame, partLabel, VolTapPart);
    
        dataLabels = [{'Region'}, {'VolGlanceDurFrames'}, {'VolGlanceDurMS'}]; 
        printPartData(partLabel, condition, glanceDurByRegionLevel2, dataLabels, 'volGlanceDurByLevel2');
        dataLabels = [{'Region'}, {'VolGlanceNum100msPlus'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel2_100ms, dataLabels, 'volGlanceCountLevel2_100ms');
        dataLabels = [{'Region'}, {'VolGlanceNum1600msPlus'}, {'SpeedTime'}, {'SpeedPercentFrames'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel2_1600ms, dataLabels, 'volGlanceCountLevel2_1600ms');
        dataLabels = [{'Region'}, {'VolGlanceNum2000msPlus'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel2_2000ms, dataLabels, 'volGlanceCountLevel2_2000ms');
        dataLabels = [{'Region'}, {'VolTapNum'}]; 
        printPartData(partLabel, condition, volTapCountRegionsLevel2, dataLabels, 'volTapCountLevel2');
        
    %Regions Level 3 data 
        glanceDurByRegionLevel3 = GlanceDurInRegion(regionsLevel3, volGlanceFn); 
        volGlanceCountRegionsLevel3_100ms = CountGlanceInRegionFunction(glanceThresh1, frames(1), regionsLevel3, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volGlanceCountRegionsLevel3_1600ms = CountGlanceInRegionFunction(glanceThresh2, frames(1), regionsLevel3, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volGlanceCountRegionsLevel3_2000ms = CountGlanceInRegionFunction(glanceThresh3, frames(1), regionsLevel3, VolGlanceAveStartFrame, partLabel, VolGlanceParticipant, VolGlanceDurMS);
        volTapCountRegionsLevel3 = CountTapInRegionFunction(frames(1), regionsLevel3, VolTapFrame, partLabel, VolTapPart);
    
        dataLabels = [{'Region'}, {'VolGlanceDurFrames'}, {'VolGlanceDurMS'}]; 
        printPartData(partLabel, condition, glanceDurByRegionLevel3, dataLabels, 'volGlanceDurByLevel3');
        dataLabels = [{'Region'}, {'VolGlanceNum100msPlus'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel3_100ms, dataLabels, 'volGlanceCountLevel3_100ms');
        dataLabels = [{'Region'}, {'VolGlanceNum1600msPlus'}, {'SpeedTime'}, {'SpeedPercentFrames'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel3_1600ms, dataLabels, 'volGlanceCountLevel3_1600ms');
        dataLabels = [{'Region'}, {'VolGlanceNum2000msPlus'}]; 
        printPartData(partLabel, condition, volGlanceCountRegionsLevel3_2000ms, dataLabels, 'volGlanceCountLevel3_2000ms');
        dataLabels = [{'Region'}, {'VolTapNum'}]; 
        printPartData(partLabel, condition, volTapCountRegionsLevel3, dataLabels, 'volTapCountLevel3');
 

 
end
% 
% 
%  figNum = 1; 
%     figure(figNum);
%     plot(frames, speed, frames ,regionsLevel1*2, frames, brakePedalForce, frames, accPedalPosition*10, frames, involGlanceFn*10)
end

