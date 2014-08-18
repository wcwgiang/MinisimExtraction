function drivingMetrics = getLaneDevMetrics(regionVector, laneDevVector, startDrive, endDrive)


numRegions = max(regionVector); 
%Create the correct size array populated with zeros
drivingMetrics = zeros(numRegions, 2);

    for i = 1:numRegions
       thisRegion = find(regionVector == i); 
       regionSize = size(thisRegion);
       regionSize = regionSize(1);
       if(regionSize == 0)
           drivingMetrics(i,1) = i; 
           drivingMetrics(i,2) = 0; 
       else
             if(i == 1)
               firstIndex = startDrive; 
                lastIndex = thisRegion(size(thisRegion)); 
               elseif(i == numRegions)
                   firstIndex = thisRegion(1); 
                   lastIndex = endDrive; 
               else
                   firstIndex = thisRegion(1); 
                    lastIndex = thisRegion(size(thisRegion)); 
             end 
       stdLaneDev = std(laneDevVector(firstIndex:lastIndex));
       drivingMetrics(i, 1) = i; 
       drivingMetrics(i, 2) = stdLaneDev; 
       end
    end
end

