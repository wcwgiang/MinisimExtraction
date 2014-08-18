function regionGlanceCount  = CountTapInRegionFunction(firstFrame, region_fn, tapStartArray, partLabel, participantArray)
participant = str2num(partLabel); 
%Create the correct size array populated with zeros
totalRegions = max(region_fn);
regionGlanceCount = zeros(totalRegions, 2);
tapRegion = 0; 
for i = 1:size(tapStartArray)
    if (participantArray(i)== participant)
        tapRegion = region_fn(tapStartArray(i)-firstFrame);
        regionGlanceCount(tapRegion,2) = regionGlanceCount(tapRegion,2) + 1;    
    end
end

for i = 1:totalRegions
    regionGlanceCount(i, 1) = i; 
end 