function regionGlanceCount  = CountGlanceInRegionFunction(threshold, firstFrame, region_fn, glanceStartArray, partLabel, participantArray, glanceDurArray)
participant = str2num(partLabel); 
%Create the correct size array populated with zeros
totalRegions = max(region_fn);
regionGlanceCount = zeros(totalRegions, 2);
glanceRegion = 0; 
for i = 1:size(glanceStartArray)
    if (participantArray(i)== participant)
        glanceRegion = region_fn(glanceStartArray(i)-firstFrame);
        if(glanceDurArray(i) >= threshold)
        regionGlanceCount(glanceRegion,2) = regionGlanceCount(glanceRegion,2) + 1;    
        end
    end
end

for i = 1:totalRegions
    regionGlanceCount(i, 1) = i; 
end 