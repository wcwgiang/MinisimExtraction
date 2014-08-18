function brakeResp_fn = PopulateBrakingStepFunction(frames, accPedalPos, brakeForce)
%Make a step function denoting regions where foot on accelerator pedal  = 1, foot off
%brake and accPedal = 2, foot on brake = 3
%Create the correct size array populated with zeros
fNum = size(frames);
fNum = fNum(1);
brakeResp_fn = zeros(fNum, 1); 
stepValue=0;  
brakeWasOn = 0; 
backTrackCount_between = 0;
startFound_between = 0; 
%createBasicStepFunction
for i = 1:fNum
    
    if (accPedalPos(i) > 0)
        stepValue = 2;
        brakeWasOn = 0; 
       % isAccPedalOn = 1; 
    end
    %backtracking occurs because there is  in the brake force metrics
    if (brakeForce(i) > 2)
        stepValue = 3;
        brakeWasOn = 1; 
    end
    %between section
    if(accPedalPos(i) == 0 && brakeForce(i) <=2 && brakeWasOn == 0)
      stepValue = 1; 
    end 
            brakeResp_fn(i) = stepValue;
end
%remove instances where accelerator is off, but no braking occurs
%afterwards
for i = 1:fNum
    %find beginning of Between section
    if(brakeResp_fn(i) == 1 && startFound_between == 0)
        startFound_between = 1; 
        backTrackCount_between = 1; 
    end 
    if(brakeResp_fn(i) == 1 && startFound_between == 1)
        backTrackCount_between = backTrackCount_between + 1; 
    end 
    if(brakeResp_fn(i) == 2 && startFound_between == 1)
       %fill in unnessiary between section
        for j = 1:backTrackCount_between
            if((i-j) >0)
            brakeResp_fn(i-j) = 2; 
            end
        end
        
        startFound_between = 0; 
        backTrackCount_between = 0; 
    end
    if(brakeResp_fn(i) == 3 && startFound_between == 1)
        %finetune beginning of braking events
        startBrakeIndex = i;
        backTrackCount_brake = 0; 
        while(startBrakeIndex > 0)
        backTrackCount_brake = backTrackCount_brake + 1; 
        startBrakeIndex = i - backTrackCount_brake;
            if(brakeForce(startBrakeIndex) == 0)
                break;
            end
        end
        for j = 1:backTrackCount_brake
            if((i-j) >0)
            brakeResp_fn(i-j) = 3; 
            end
        end
        startFound_between = 0; 
    end 
    
end
startFound_between = 0; 
for i = 1:fNum
    %fine tune the between sections so they start when the accelerator
    %pedal is released (instead of when it's zero)
    
    if(brakeResp_fn(i) == 1 && startFound_between == 0)
        j = i; 
        startFound_between = 1; 
        while(j > 1)
            if((accPedalPos(j-1) - accPedalPos(j)) >= 0)
                j = j-1; 
            else 
               break; 
            end
        end
        for k = j:i
            brakeResp_fn(k) = 1;
        end
    end 
    if(brakeResp_fn(i) > 1 && startFound_between == 1)
        startFound_between = 0;
    end
end


