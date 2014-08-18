function event_fn = PopulateRegion1StepFunction(frames, log_Braking, log_Unexpected, log_Gap, log_Location)
%Make a step function denoting regions where rural = 1, transtion = 2,
%urban = 3
%Create the correct size array populated with zeros
fNum = size(frames);
fNum = fNum(1);
event_fn = zeros(fNum, 1); 
stepValue=1; 
TransFlag = 0; 
UrbanFlag = 0;
for i = 1:fNum
    %Find transition region
    if (log_Location(i)== 9 && TransFlag == 0)
        TransFlag = 1; 
        stepValue = 2; 
    end
    %Find urban region 
    if(log_Gap(i) == 1 && UrbanFlag == 0)
        UrbanFlag = 1; 
        stepValue = 3; 
    end 
            event_fn(i) = stepValue;
end