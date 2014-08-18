function event_fn = PopulateRegion2StepFunction(frames, log_Braking, log_Unexpected, log_Gap, log_Location)
%Make a step function denoting regions where rural = 1, transtion = 2,
%urban = 3
%Create the correct size array populated with zeros
fNum = size(frames);
fNum = fNum(1);
event_fn = zeros(fNum, 1); 
stepValue=1; 
regionFlags = zeros(1,21);
brakeFlag = 0; 
bikeFlag = 0; 
carFlag = 0; 
j = 0; 
checkVal = 0; 
Intersection5Passed = 0; 
for i = 1:fNum
    %Find Brake1Straight region
    if (log_Braking(i) == 1)
        if(regionFlags(4) == 1)
            brakeFlag = 4;
        elseif(regionFlags(3) == 1)
            brakeFlag = 3;
        elseif(regionFlags(2) == 1)
            brakeFlag = 2;
        elseif(regionFlags(1) == 1)
            brakeFlag = 1; 
        end
    end 
    if (log_Braking(i) == 2 && regionFlags(1) == 0 && brakeFlag == 0)
        regionFlags(1) = 1;  
        stepValue = 2; 
    end
   
    %Find Brake2Curve region
     if (log_Braking(i) == 2 && regionFlags(2) == 0 && brakeFlag == 1)
        regionFlags(2) = 1; 
        stepValue = 3; 
    end
    %Find Brake3Straight region
     if (log_Braking(i) == 2 && regionFlags(3) == 0 && brakeFlag == 2)
        regionFlags(3) = 1; 
        stepValue = 4; 
    end
    %Find Brake4Curve region
     if (log_Braking(i) == 2 && regionFlags(4) == 0 && brakeFlag == 3)
        regionFlags(4) = 1; 
        stepValue = 5; 
     end
      %Find BikeInert region1
     if(log_Unexpected(i) == 2 && regionFlags(5) == 1 && log_Location(i) == 1 && regionFlags(6) == 0)
        regionFlags(6) = 1;
        stepValue = 7;
     end
     %Find BikeCrossing region
     if (log_Unexpected(i) == 2 && regionFlags(7) == 0 && regionFlags(5) == 0)
         j = i; 
         while(log_Location(j) ~= 2)
             if(log_Unexpected(j) == 3)
               bikeFlag = 1;     
             end
             j = j + 1 ;
         end
         if(bikeFlag == 1)
             stepValue = 6;
             regionFlags(5) = 1;
         elseif(bikeFlag == 0)
             stepValue = 7;
             regionFlags(6) = 1;
         end
     end        
    
    %Find HillTransition region
     if (log_Location(i) == 7 && regionFlags(7) == 0)
        regionFlags(7) = 1; 
        stepValue = 8; 
    end
    %Find BikeInert region2
     if (regionFlags(7) == 1 && log_Location(i)== 6 && regionFlags(8) == 0)
        regionFlags(8) = 1; 
        stepValue = 9; 
    end
    %Find RegionTransition region
     if (log_Location(i) == 9 && regionFlags(9) == 0)
        regionFlags(9) = 1; 
        stepValue = 10; 
    end
    %Find Gap1Intersection region
     if (log_Gap(i) == 1 && regionFlags(10) == 0)
        regionFlags(10) = 1; 
        stepValue = 11; 
    end
    %Find Straight1Inert region
     if (log_Gap(i) == 3 && regionFlags(11) == 0)
        regionFlags(11) = 1; 
        stepValue = 12; 
    end
    %Find Intersection2Inert region
     if (log_Location(i) == 3 && regionFlags(12) == 0)
        regionFlags(12) = 1; 
        stepValue = 13; 
    end
    %Find Straight2Inert region
     if (regionFlags(12) == 1 && log_Location(i)== 1 && regionFlags(13) == 0)
        regionFlags(13) = 1; 
        stepValue = 14; 
    end
    %Find Intersection3Inert region
     if (regionFlags(13) == 1 && log_Location(i)== 3 && regionFlags(14) == 0)
        regionFlags(14) = 1; 
        stepValue = 15; 
    end
    %Find Straight3Inert region
     if (regionFlags(14) && log_Location(i)== 1 && regionFlags(15) == 0)
        regionFlags(15) = 1; 
        stepValue = 16; 
    end
    %Find Gap2Intersection region
     if (regionFlags(15) ==1 && log_Gap(i)== 1 && regionFlags(16) == 0)
        regionFlags(16) = 1; 
        stepValue = 17; 
    end
    %Find Straight4Inert region
     if (regionFlags(16)==1 && log_Gap(i) == 3 && regionFlags(17) == 0)
        regionFlags(17) = 1; 
        stepValue = 18; 
    end
    %Find PullOutCarIntersection region (starts when pull out car starts
    %driving)
     if (log_Unexpected(i)== 4 && regionFlags(18) == 0)
        regionFlags(18) = 1; 
        stepValue = 19; 
       
    end
    %Find PullOutCarStraight region
     if (log_Unexpected(i)== 5 && regionFlags(19) == 0)
        regionFlags(19) = 1; 
        stepValue = 20; 
    end
    %Find LeftOverIntersection region if occurs before pullout car
     if (regionFlags(16) == 1 && log_Location(i)== 3 && log_Unexpected(i) == 2 && regionFlags(19) == 0 && regionFlags(20) == 0)
        regionFlags(20) = 1; 
        stepValue = 21; 
        Intersection5Passed = 1; 
    end
    %Find LeftOverStraight region if occurs before pullout car 
     if (Intersection5Passed == 1 && regionFlags(16) == 1 && log_Unexpected(i) == 2 && regionFlags(19) ==0 && log_Location(i)== 1 && regionFlags(21) == 0)
        regionFlags(21) = 1; 
        stepValue = 22; 
     end
      %Mark straight after pullout car to skip 
     if (regionFlags(16) == 1 && log_Location(i)== 1 && regionFlags(19) == 1 && carFlag == 0)
        carFlag = 1;
     end
     %Find LeftOverIntersection region if occurs after pullout car 
     if (regionFlags(19) == 1 && log_Location(i)== 3 && regionFlags(20) == 0 &&carFlag == 1 )
        regionFlags(20) = 1; 
        stepValue = 23; 
     end
     %Find LeftOverStraight region if occurs after pullout car
     if (regionFlags(19) == 1 && regionFlags(20) ==1 && log_Location(i)== 1 && regionFlags(21) == 0 && carFlag == 1)
        regionFlags(21) = 1; 
        stepValue = 24; 
     end
            event_fn(i) = stepValue;
end