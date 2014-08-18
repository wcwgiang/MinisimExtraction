function glanceDurByRegion = GlanceDurInRegion(region_Fn, glance_Fn)
totalRegions = max(region_Fn);
%Create the correct size array populated with zeros
glanceDurByRegion = zeros(totalRegions,3);

for i = 1:size(glance_Fn)
    if(glance_Fn(i) == 1)
        glanceDurByRegion(region_Fn(i),2) = glanceDurByRegion(region_Fn(i),2) + 1; 
    end
end
for i = 1:totalRegions
    glanceDurByRegion(i, 1) = i; 
    glanceDurByRegion(i, 3) = (glanceDurByRegion(i,2) / 60)*1000; 
end 