function numHardBrakes = getHardBrakes(brakeThreshold, brakingSummary_table, region_fn)
%get average RT above a certian braking threshold (if no brakeThreshold,
%set brakeThreshold to zero)
brakeInfo_RT = brakingSummary_table(:,6);
brakeInfo_StartIndex = brakingSummary_table(:,3);
brakeInfo_minAcc = brakingSummary_table(:,8);
sizeArray = size(brakeInfo_RT);
totalBrakes = sizeArray(1);
brakeThreshold = brakeThreshold * 9.82; 
brakesCounted = 0;
lastRegion = 1; 
if(region_fn == 0)
    for i = 1:totalBrakes
        if(brakeInfo_minAcc(i) < brakeThreshold)
          brakesCounted = brakesCounted + 1; 
        end 
    end  
    numHardBrakes =  brakesCounted;
    brakesCounted = 0;

else
    numRegions = max(region_fn); 
    numHardBrakes = zeros(numRegions,2);
    for i = 1:totalBrakes
        if(brakeInfo_minAcc(i) < brakeThreshold)
            %get current brake region
            currentRegion = region_fn(brakeInfo_StartIndex(i));
            %check if we are in the same region as the previous
            %if we are, then add the metrics
            if(currentRegion == lastRegion)
                brakesCounted = brakesCounted + 1;
                lastRegion = currentRegion;
            %if not, save the values for the previous region, reset the metrics and restart the
            %record
            else 
                if(brakesCounted > 0)
                     numHardBrakes(lastRegion,2) = brakesCounted;
                     numHardBrakes(currentRegion,1) = currentRegion; 
                end 
                brakesCounted = 1;
                lastRegion = currentRegion;
            end
        end 
        %record values for last region
        if(i == totalBrakes)
                if(brakesCounted > 0)
                     numHardBrakes(currentRegion,2) = brakesCounted;
                     numHardBrakes(currentRegion,1) = currentRegion; 
                end 
        end
    end
    
    
end




