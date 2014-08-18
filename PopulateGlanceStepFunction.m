function event_fn = PopulateGlanceStepFunction(frames, glanceStartArray, partLabel, participantArray, glanceDurArray)
%Make a step function denoting regions where rural = 1, transtion = 2,
%urban = 3
%Create the correct size array populated with zeros
fNum = size(frames);
fNum = fNum(1);
event_fn = zeros(fNum, 1);  
glanceNum = 1;
findPartIndex = 1; 
firstFrame = frames(1); 
participant = str2num(partLabel); 
for k = 1:size(glanceStartArray)
    if(participantArray(k) == participant)
        findPartIndex = k;
        glanceNum = findPartIndex;
        break; 
    end
end

for i = 1:fNum
  if(participantArray(glanceNum) == participant && i == (glanceStartArray(glanceNum) - firstFrame))
        for j = 1:glanceDurArray(glanceNum)
            event_fn(i+j - 1) = 1;
        end
        glanceNum = glanceNum + 1; 
        if(glanceNum > size(glanceStartArray))
            break;
        end 
  end 
end
