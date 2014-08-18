function drivingMetrics = getRegionDurations( regionVector, startDrive, endDrive)

numRegions = max(regionVector); 
%Create the correct size array populated with zeros
drivingMetrics = zeros(numRegions, 3);

for i = 1:numRegions
   thisRegion = find(regionVector == i); 
   regionSize = size(thisRegion);
   regionSize = regionSize(1);%because original value is a 2x1 array and we just want the size value
   if(regionSize == 0)
       drivingMetrics(i,1) = i; 
       drivingMetrics(i,2) = 0;
       drivingMetrics(i,3) = 0; 
   else
    if(i == 1)
    firstIndex = startDrive; 
    lastInfo = thisRegion(size(thisRegion)); 
    lastIndex = lastInfo(1);
  
   elseif(i == numRegions)
       firstIndex = thisRegion(1); 
       lastIndex = endDrive; 
   else
       firstIndex = thisRegion(1); 
        lastInfo = thisRegion(size(thisRegion)); 
        lastIndex = lastInfo(1);
   end 
       drivingMetrics(i, 1) = i; 
       RegionDur = lastIndex - firstIndex + 1; 
       drivingMetrics(i, 2) = RegionDur;
       drivingMetrics(i, 3) = ((lastIndex - firstIndex)/60)*1000; 
   end 
end
end

