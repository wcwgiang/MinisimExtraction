function event_fn = PopulateRegion3StepFunction(frames, log_Braking, log_Unexpected, log_Gap, log_Location)
%Make a step function denoting regions where rural = 1, transtion = 2,
%urban = 3
%Create the correct size array populated with zeros
fNum = size(frames);
fNum = fNum(1);
event_fn = zeros(fNum, 1); 
stepValue=1; 
transCurveFlag = 0; 
brakeFlag = 0; 
bikeFlag = 0; 
carFlag = 0; 
j = 0; 
checkVal = 0; 
Intersection5Passed = 0; 

%Region Flags

IsBrake1MaintainingGapFound = 0;
IsBrake1Found = 0;
IsBrake1SpeedRecoveryFound = 0;
IsBrake2MaintainingGapFound = 0; 
IsBrake2Found = 0;
IsBrake2SpeedRecoveryFound = 0;
IsBrake3MaintainingGapFound = 0;
IsBrake3Found = 0;
IsBrake3SpeedRecoveryFound = 0;
IsBrake4MaintainingGapFound = 0;
IsBrake4Found = 0;
IsBrake4SpeedRecoveryFound = 0;
IsBikeStartedFound = 0;
IsBikeCrossingFound = 0;
IsBikePassedFound = 0;
IsInertBike1StartedFound = 0;
IsInertBike1PassedFound = 0;
IsHillCurve1Found = 0;
IsHillFound = 0;
IsHillCurve2Found = 0;
IsInertBikeRegionFound = 0;
IsTransitionCurve1Found = 0;
IsTransitionCurve2Found = 0;
IsTransitionStraightFound = 0;
IsAtGap1Found = 0;
IsInGap1TurnFound = 0;
IsStraight1InertFound = 0;
IsIntersection2InertFound = 0;
IsStraight2InertFound = 0;
IsIntersection3InertFound = 0;
IsStraight3InertFound = 0;
IsAtGap2Found = 0;
IsInGap2TurnFound = 0;
IsStraight4InertFound = 0;
IsCarStartedFound = 0;
IsCarPullOutFound = 0;
IsCarAheadFound = 0;
IsLeftOverIntersectionFound = 0;
IsLeftOverStraightFound  = 0;


for i = 1:fNum
     %Find Brake1MaintainingGap region
    if (log_Braking(i) == 2 && IsBrake1MaintainingGapFound == 0)
        IsBrake1MaintainingGapFound = 1;  
        stepValue = 2; 
    end 
    %Find Brake1 region
    if (log_Braking(i) == 3 && IsBrake1Found == 0 && IsBrake1MaintainingGapFound == 1)
        IsBrake1Found = 1;  
        stepValue = 3; 
    end
    %Find Brake1SpeedRecovery region
    if (log_Braking(i) == 1 && IsBrake1SpeedRecoveryFound == 0 && IsBrake1Found == 1)
        IsBrake1SpeedRecoveryFound = 1;  
        stepValue = 4; 
    end
    %Find Brake2MaintainingGap region
     if (log_Braking(i) == 2 && IsBrake2MaintainingGapFound == 0 && IsBrake1SpeedRecoveryFound == 1)
        IsBrake2MaintainingGapFound = 1; 
        stepValue = 5; 
     end
    %Find Brake2 region
     if (log_Braking(i) == 4 && IsBrake2Found == 0 && IsBrake2MaintainingGapFound == 1)
        IsBrake2Found = 1; 
        stepValue = 6; 
     end
    %Find Brake2SpeedRecovery region
     if (log_Braking(i) == 1 && IsBrake2SpeedRecoveryFound  == 0 && IsBrake2Found == 1)
        IsBrake2SpeedRecoveryFound  = 1; 
        stepValue = 7; 
    end
    %Find Brake3MaintainingGap region
     if (log_Braking(i) == 2 && IsBrake3MaintainingGapFound == 0 && IsBrake2SpeedRecoveryFound == 1)
        IsBrake3MaintainingGapFound = 1; 
        stepValue = 8; 
     end
     %Find Brake3 region
     if (log_Braking(i) == 3 && IsBrake3Found == 0 && IsBrake3MaintainingGapFound == 1)
        IsBrake3Found = 1; 
        stepValue = 9; 
     end
     %Find Brake3SpeedRecovery region
     if (log_Braking(i) == 1 && IsBrake3SpeedRecoveryFound == 0 && IsBrake3Found == 1)
        IsBrake3SpeedRecoveryFound = 1; 
        stepValue = 10; 
    end
    %Find Brake4MaintainingGap region
     if (log_Braking(i) == 2 && IsBrake4MaintainingGapFound == 0 && IsBrake3SpeedRecoveryFound == 1)
        IsBrake4MaintainingGapFound = 1; 
        stepValue = 11; 
     end
     %Find Brake4 region
     if (log_Braking(i) == 4 && IsBrake4Found == 0 && IsBrake4MaintainingGapFound == 1)
        IsBrake4Found = 1; 
        stepValue = 12; 
     end
     %Find Brake4SpeedRecovery region
     if (log_Braking(i) == 1 && IsBrake4SpeedRecoveryFound == 0 && IsBrake4Found == 1)
        IsBrake4SpeedRecoveryFound = 1; 
        stepValue = 13; 
     end
      %Find BikeInert region1
     if(log_Unexpected(i) == 2 && IsHillCurve1Found == 0 && bikeFlag == 0 && IsInertBike1StartedFound == 0 && IsBikeStartedFound == 1)
        IsInertBike1StartedFound = 1;
        stepValue = 17;
        
     end
     %Find BikeStarted
     if (log_Unexpected(i) == 2 && IsHillCurve1Found == 0 && IsBikeStartedFound == 0)
         j = i; 
         while(log_Location(j) ~= 2)
             if(log_Unexpected(j) == 3)
               bikeFlag = 1;     
             end
             j = j + 1 ;
         end
         if(bikeFlag == 1)
             stepValue = 14;
             IsBikeStartedFound = 1;
         elseif(bikeFlag == 0 && IsInertBike1StartedFound == 0)
             stepValue = 17;
            IsInertBike1StartedFound  = 1;
         end
     end        
    %FindBikeCross
    if(log_Unexpected(i) == 3 && IsBikeCrossingFound ==0)
        IsBikeCrossingFound = 1;
        stepValue = 15; 
    end
    
    
    %FindBikePass
    if(log_Location(i) == 2 && IsHillCurve1Found == 0 && IsBikePassedFound ==0 && bikeFlag == 1)
        IsBikePassedFound = 1; 
        stepValue = 16; 
        bikeFlag = 0 ;
    end
    %Find Inert bike pass
    if(log_Location(i) == 2 && IsHillCurve1Found == 0 && IsInertBike1PassedFound == 0 && IsInertBike1StartedFound ==1 &&bikeFlag == 0)
         IsInertBike1PassedFound = 1;
         stepValue = 18;
    end
    
    %Find HillCurve 1 
     if (log_Location(i) == 7 && IsHillCurve1Found  == 0)
        IsHillCurve1Found  = 1; 
        stepValue = 19; 
     end
    %Find Hill
    if (log_Location(i) == 8 && IsHillFound  == 0)
        IsHillFound  = 1; 
        stepValue = 20; 
     end
    %Find HillCurve2
    if (log_Location(i) == 7 && IsHillFound  == 1 && IsHillCurve2Found == 0)
        IsHillCurve2Found  = 1; 
        stepValue = 21; 
    end
    %Find InertBike region  
    if (IsHillCurve2Found == 1 && log_Location(i) == 6 && IsInertBikeRegionFound == 0)
        IsInertBikeRegionFound = 1;
        stepValue = 22; 
    end


    %Find transition curve 1  region
     if (log_Location(i) == 9 && IsTransitionCurve1Found == 0 && transCurveFlag == 0)
         IsTransitionCurve1Found = 1; 
         stepValue = 23; 
     end
     %Curve change flag in transition  region
     if (log_Location(i) == 1 && IsTransitionCurve1Found == 1 && transCurveFlag == 0)
         transCurveFlag = 1; 
     end
     %Find Transition Curve 2  region
     if (log_Location(i) == 9 && transCurveFlag == 1 && IsTransitionCurve2Found == 0)
         IsTransitionCurve2Found = 1; 
         stepValue = 24; 
     end
    
     %Find Transition Straight 
      if (log_Location(i) == 1 && IsTransitionCurve2Found == 1 &&  IsTransitionStraightFound == 0)
         IsTransitionStraightFound = 1; 
         stepValue = 25; 
     end
     
    %Find Gap1Intersection arrival region
     if (log_Gap(i) == 1 && IsAtGap1Found == 0)
        IsAtGap1Found = 1; 
        stepValue = 26; 
    end
    %Find Gap1Intersection turn region
     if (log_Gap(i) == 2 && IsInGap1TurnFound == 0)
        IsInGap1TurnFound = 1; 
        stepValue = 27; 
     end
    
    %Find Straight1Inert region
     if (log_Gap(i) == 3 && IsStraight1InertFound == 0)
        IsStraight1InertFound = 1; 
        stepValue = 28; 
    end
    %Find Intersection2Inert region
     if (log_Location(i) == 3 && IsIntersection2InertFound == 0)
        IsIntersection2InertFound = 1; 
        stepValue = 29; 
    end
    %Find Straight2Inert region
     if (IsIntersection2InertFound == 1 && log_Location(i)== 1 && IsStraight2InertFound == 0)
        IsStraight2InertFound = 1; 
        stepValue = 30; 
    end
    %Find Intersection3Inert region
     if (IsStraight2InertFound == 1 && log_Location(i)== 3 && IsIntersection3InertFound  == 0)
        IsIntersection3InertFound  = 1; 
        stepValue = 31; 
    end
    %Find Straight3Inert region
     if (IsIntersection3InertFound == 1 && log_Location(i)== 1 && IsStraight3InertFound == 0)
        IsStraight3InertFound = 1; 
        stepValue = 32; 
     end
    
       %Find Gap2Intersection arrival region
     if (IsStraight3InertFound == 1 && log_Gap(i) == 1 && IsAtGap2Found == 0)
        IsAtGap2Found = 1; 
        stepValue = 33; 
    end
    %Find Gap2Intersection turning region
     if (IsStraight3InertFound == 1 && log_Gap(i) == 2 && IsInGap2TurnFound == 0)
        IsInGap2TurnFound = 1; 
        stepValue = 34; 
     end
    %Find Straight4Inert region
     if (IsInGap2TurnFound == 1 && log_Gap(i) == 3 && IsStraight4InertFound == 0)
        IsStraight4InertFound = 1; 
        stepValue = 35; 
     end
    % Find car started region
     if(log_Unexpected(i)== 4 && IsCarStartedFound == 0)
        IsCarStartedFound = 1; 
        stepValue = 36; 
    end
    % Find car pull out region
    if(log_Unexpected(i)== 6 && IsCarPullOutFound == 0)
        IsCarPullOutFound  = 1; 
        stepValue = 37; 
    end
    % Find when pull out car is ahead of driver
     if (log_Unexpected(i)== 5 && IsCarAheadFound == 0)
        IsCarAheadFound = 1; 
        stepValue = 38; 
     end

    %Find LeftOverIntersection region if occurs before pullout car
     if (IsInGap2TurnFound == 1 && log_Location(i)== 3 && log_Unexpected(i) == 2 && IsCarAheadFound == 0 && IsLeftOverIntersectionFound == 0)
        IsLeftOverIntersectionFound = 1; 
        stepValue = 39; 
        Intersection5Passed = 1; 
    end
    %Find LeftOverStraight region if occurs before pullout car 
     if (Intersection5Passed == 1 && IsInGap2TurnFound == 1 && log_Unexpected(i) == 2 && IsCarAheadFound ==0 && log_Location(i)== 1 && IsLeftOverStraightFound == 0)
        IsLeftOverStraightFound = 1; 
        stepValue = 40; 
     end
      %Mark straight after pullout car to skip 
     if (IsInGap2TurnFound == 1 && log_Location(i)== 1 && IsCarAheadFound == 1 && carFlag == 0)
        carFlag = 1;
     end
     %Find LeftOverIntersection region if occurs after pullout car 
     if (IsCarAheadFound == 1 && log_Location(i)== 3 && IsLeftOverIntersectionFound == 0 &&carFlag == 1 )
        IsLeftOverIntersectionFound = 1; 
        stepValue = 41; 
     end
     %Find LeftOverStraight region if occurs after pullout car
     if (IsCarAheadFound == 1 && IsLeftOverIntersectionFound ==1 && log_Location(i)== 1 && IsLeftOverStraightFound == 0 && carFlag == 1)
        IsLeftOverStraightFound = 1; 
        stepValue = 42; 
     end
            event_fn(i) = stepValue;
end