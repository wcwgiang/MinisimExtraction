function event_fn = PopulateTapStepFunction(frames, tapStartArray, partLabel, participantArray)
%Create the correct size array populated with zeros
fNum = size(frames);
fNum = fNum(1);
event_fn = zeros(fNum, 1);  
tapNum = 1;
findPartIndex = 1; 
firstFrame = frames(1); 
participant = str2num(partLabel); 
for k = 1:size(tapStartArray)
    if(participantArray(k) == participant)
        findPartIndex = k;
        tapNum = findPartIndex;
        break; 
    end
end

for i = 1:fNum
    
    
    if (i == (tapStartArray(tapNum) - firstFrame) && participantArray(tapNum) == participant)
            event_fn(i) = 1;
          %  event_fn(i+1) = 1; 
        tapNum = tapNum + 1; 
        if(tapNum > size(tapStartArray))
            break;
        end 
    end          
end