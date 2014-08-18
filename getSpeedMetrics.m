function drivingMetrics = getSpeedMetrics( regionVector, speedVector, startDrive, endDrive)

numRegions = max(regionVector); 
%Create the correct size array populated with zeros
drivingMetrics = zeros(numRegions, 3);

for i = 1:numRegions
   
   thisRegion = find(regionVector == i);
   regionSize = size(thisRegion);
   regionSize = regionSize(1);
   if(regionSize == 0)
       drivingMetrics(i, 1) = i;
       drivingMetrics(i, 2) = 0; 
       drivingMetrics(i, 3) = 0; 
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
       meanSpeed = mean(speedVector(firstIndex:lastIndex));
       stdSpeed = std(speedVector(firstIndex:lastIndex));
       drivingMetrics(i, 1) = i; 
       drivingMetrics(i, 2) = meanSpeed; 
       drivingMetrics(i, 3) = stdSpeed; 
    end
end 

end

