function accel_fn = GetSpeedAccelerationFn(frames, speed)
%Make a step function denoting regions where rural = 1, transtion = 2,
%urban = 3
%Create the correct size array populated with zeros
fNum = size(frames);
fNum = fNum(1);
speed_convertUnits = zeros(fNum, 1); 
speed_fn = zeros(fNum-1, 1); 
frames_fn = zeros(fNum-1,1); 
firstFrame = frames(1); 
time_fn = zeros(fNum-1,1); 
for i = 1:fNum
   %convert mph to meters per second
    speed_convertUnits(i) = speed(i) * 0.44704;
    %create time vector
    time_fn(i) = (frames(i) - firstFrame)/60;
end 


for i = 1:size(speed_fn)
   %transfer and 
   speed_fn(i) = speed_convertUnits(i); 
   frames_fn(i) = frames(i); 
    
end
accel_fn= (diff(speed_convertUnits)*60); 

% figNum = 5;
% figure(figNum);
%plot(frames_fn, speed_fn, frames_fn, accel_fn)