function drivingMetrics = getSpeedingDurations(region_fn, driveSpeedChangeFrame, threshold, speed_fn, startFrame, endFrame, regionDurations)
%get speeding durations in frames, milliseconds, and percent of drive
%If regions == 0, peform analysis for entire drive
ruralThreshold = 50 + threshold; 
urbanThreshold = 35 + threshold; 
if (region_fn == 0)
    drivingMetrics = [0,0,0]; 
     for i = startFrame:endFrame
        if(i < driveSpeedChangeFrame)
            if(speed_fn(i) >= ruralThreshold)
                drivingMetrics(1) = drivingMetrics(1) + 1; 
            end
        else
            if(speed_fn(i) >= urbanThreshold)
                 drivingMetrics(1) = drivingMetrics(1) + 1; 
            end
        end
     end
     drivingMetrics(2) = (drivingMetrics(1) / 60) * 1000; 
    drivingMetrics(3) = (drivingMetrics(1) / (endFrame-startFrame))*100; 
else
    numRegions = max(region_fn); 
    %Create the correct size array populated with zeros
    drivingMetrics = zeros(numRegions, 4);
    for i = startFrame:endFrame
        if(i < driveSpeedChangeFrame)
            if(speed_fn(i) >= ruralThreshold)
                drivingMetrics(region_fn(i), 2) = drivingMetrics(region_fn(i), 2) +1; 
            end
        else
            if(speed_fn(i) >= urbanThreshold)
                drivingMetrics(region_fn(i), 2) = drivingMetrics(region_fn(i), 2) +1; 
            end
        end 
    end
    for i = 1:numRegions
    drivingMetrics(i, 1) = i;
    drivingMetrics(i, 3) = (drivingMetrics(i,2) / 60) * 1000; 
   
    if(regionDurations(i) == 0)
         drivingMetrics(i, 4) = 0; 
    else
        drivingMetrics(i, 4) = (drivingMetrics(i,2) / regionDurations(i))*100; 
    end
    end
end


