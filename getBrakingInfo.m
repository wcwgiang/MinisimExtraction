function brakingSummary_table  = getBrakingInfo(braking_fn, accel_fn, startDriveIndex, endDriveIndex, frames, partLabel, regionL1_fn, regionL2_fn, regionL3_fn)
brakeFound = 0; 
brakeCount = 0; 

participant = str2num(partLabel); 
startFrame = frames(startDriveIndex);
endFrame = frames(endDriveIndex); 

%count braking events
for i = 1:size(braking_fn)
    if(frames(i) >= startFrame && frames(i) <= endFrame && brakeFound == 0 && braking_fn(i) == 3)
        brakeCount = brakeCount + 1; 
        brakeFound = 1; 
    end
    if(braking_fn(i) ~= 3)
        brakeFound = 0; 
    end 
    if(frames(i) == startFrame)
        startFrameIndex = i; 
    end 
    if(frames(i) == endFrame)
        endFrameIndex = i; 
    end
end 

brakingSummary_table = zeros(brakeCount,11);
brakeFound = 0; 
brakeCount = 0; 
backTrackCount = 0; 
brakeDurCount = 0; 
minAcc = 0; 
accSum = 0; 
%table (x, 1) = BrakeMovementTime(MS)
%table (x, 2) = brake number
%table (x, 3) = first index
%table (x, 4) = first frame
%table (x, 5) = frames in brake
%table (x, 6) = BrakeMovementFrames
%table (x, 7) = Average acceleration
%table (x, 8) = Min acceleration
%table (x, 9) = Region (Level 1)
%table (x, 10) = Region (Level 2)
%table (x, 11) = Region (Level 3)
for i = startFrameIndex:endFrameIndex
    if(braking_fn(i) == 3 && brakeFound == 0)
        brakeFound = 1; 
        brakeCount = brakeCount + 1; 
        brakingSummary_table(brakeCount, 2) = brakeCount;
        brakingSummary_table(brakeCount, 3) = i;
        brakingSummary_table(brakeCount, 4) = frames(i); 
        brakingSummary_table(brakeCount, 9) = regionL1_fn(i);
        brakingSummary_table(brakeCount, 10) =regionL2_fn(i);
        brakingSummary_table(brakeCount, 11) =regionL3_fn(i); 
        for j = i:endFrameIndex
            if(braking_fn(j) == 3)
                %finding brake duration
                brakeDurCount = brakeDurCount + 1;
                %finding average acceleration
                accSum = accSum + accel_fn(j); 
                %finding max acceleration
                if (accel_fn(j) < minAcc) 
                    minAcc = accel_fn(j);
                end 
            end
            if(braking_fn(j) ~= 3 )
                brakingSummary_table(brakeCount, 5) = brakeDurCount;
                brakingSummary_table(brakeCount, 7) = accSum / brakeDurCount;
                brakingSummary_table(brakeCount, 8) = minAcc; 
                brakeDurCount = 0;
                minAcc = 0; 
                accSum = 0; 
                break; 
            end 
            if(braking_fn(j) == 3 && j == endFrameIndex)
                brakingSummary_table(brakeCount, 5) = brakeDurCount;
                brakingSummary_table(brakeCount, 7) = accSum / brakeDurCount;
                brakingSummary_table(brakeCount, 8) = minAcc; 
                brakeDurCount = 0;
                minAcc = 0; 
                accSum = 0; 
            end 
        end
        RTIndex = i-1; 
        %go backwards to find the beginning of the switch from accelerator
        %to brake
        while(RTIndex > 0)
            if(braking_fn(RTIndex) == 1)
                backTrackCount = backTrackCount +1; 
                RTIndex = RTIndex - 1; 
            end
            if(braking_fn(RTIndex) ~=1)
                brakingSummary_table(brakeCount, 6) = backTrackCount; 
                 brakingSummary_table(brakeCount, 1) = (backTrackCount / 60) * 1000; 
                backTrackCount = 0; 
                break; 
            end
        end 
    end 
    if(braking_fn(i) ~=3)
         brakeFound = 0; 
    end
end
 