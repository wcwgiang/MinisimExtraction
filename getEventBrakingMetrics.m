function eventMetrics = getEventBrakingMetrics(eventNum, endDriveIndex, region_fn, brakeResp_fn, ttc_fn, accel_fn)
%returns accelerator release time, movement time, min accel, min ttc in response to event 
    eventMetrics = zeros(1, 17);

    startIndex = find(region_fn == eventNum, 1, 'first');
    endIndex = find(region_fn == eventNum + 1, 1, 'last');
    foundAccelRelease = 0; 
    startAccelReleaseIndex = 0; 
    foundBrakeStart = 0; 
    foundBrakeEnd = 0; 
    minAccelBrakeSection =-1;
    minTTCBrakeSection=-1;
    brakeStartInRegion = 0; 
    brakeEndInRegion = 0;
    minTTCEntire = 1000; 
    minAccelEntire = 0; 
%     foundBrakeEnd = 0; 
%because accel fn is one index smaller than the entire drive array, need to
%do this modification to avoid out of bounds error 
if (endIndex >= endDriveIndex)
    endIndex = endDriveIndex - 1; 
end 
    for i = startIndex:endIndex
         if (brakeResp_fn(i) == 1 && foundAccelRelease == 0)
             startAccelReleaseIndex = i; 
             foundAccelRelease = 1; 
         end
         if(brakeResp_fn(i) == 3 && foundBrakeStart == 0)
             startBrakeIndex = i; 
             foundBrakeStart = 1;
             brakeStartInRegion = 1; 
         end
         if(brakeResp_fn(i) == 2 && foundBrakeStart == 1 && foundBrakeEnd == 0)
             endBrakeIndex = i; 
             minTTCBrakeSection = minTTCEntire;
             minAccelBrakeSection = minAccelEntire; 
             foundBrakeEnd = 1; 
             brakeEndInRegion = 1; 
         end
         %find minimum TTC and Acceleration
         
         if(ttc_fn(i) < minTTCEntire)
             minTTCEntire = ttc_fn(i); 
         end
         if(accel_fn(i) < minAccelEntire)
             minAccelEntire = accel_fn(i); 
         end
         %if we are at the end and have found accel release, but not brake
         %start
         if(i == endIndex && foundAccelRelease == 1 && foundBrakeStart == 0)
             j = i; 
             while(j < endDriveIndex)
                 if(brakeResp_fn(i) == 3)
                     startBrakeIndex = i; 
                     foundBrakeStart = 1;
                 end
                 if(brakeResp_fn(i) == 2 && foundBrakeStart == 1 && foundBrakeEnd == 0)
                     endBrakeIndex = i; 
                     foundBrakeEnd = 1;
                     
                     break; 
                 end
                 if(ttc_fn(i) < minTTCEntire)
                     minTTCEntire = ttc_fn(i); 
                 end
                 if(accel_fn(i) < minAccelEntire)
                     minAccelEntire = accel_fn(i); 
                 end
             end 
         end
         %if we are at the end of the region and have found brake start,
         %but not brake end
         if(i == endIndex&& foundBrakeStart == 1 && foundBrakeEnd == 0)
             j = i; 
              while(j < endDriveIndex)
                 if(brakeResp_fn(i) == 2 && foundBrakeStart == 1)
                     endBrakeIndex = i; 
                     foundBrakeEnd = 1;
                     break; 
                 end
                 if(ttc_fn(i) < minTTCEntire)
                     minTTCEntire = ttc_fn(i); 
                 end
                 if(accel_fn(i) < minAccelEntire)
                     minAccelEntire = accel_fn(i); 
                 end
             end 
         end
         
    
    end
    
    movementDurFrames = startBrakeIndex - startAccelReleaseIndex; 
    accelReleaseDurFrames = startAccelReleaseIndex - startIndex; 
    brakeRespDurFrames = movementDurFrames + accelReleaseDurFrames;
     movementDurTimeMS = (movementDurFrames / 60) * 1000; 
     accelReleaseTimeMs = (accelReleaseDurFrames / 60) * 1000; 
     brakeRespTimeMS = (brakeRespDurFrames / 60) * 1000; 
    eventMetrics(1, 1:17) = [startIndex, endIndex, startAccelReleaseIndex, accelReleaseDurFrames,accelReleaseTimeMs, startBrakeIndex, movementDurFrames,movementDurTimeMS,brakeRespDurFrames,brakeRespTimeMS, minTTCEntire,minTTCBrakeSection, minAccelEntire,minAccelBrakeSection, brakeStartInRegion, brakeEndInRegion, endBrakeIndex];

%     plot(frames, brakeResp_fn, frames, regionsLevel3, frames, log_Braking); 
%     size(eventMetrics); 
%     accelReleaseInfo = eventMetrics; 


