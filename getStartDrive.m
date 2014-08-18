function startDrive = getStartDrive(speedVector)
startDriveVector = find(speedVector >= 5); 
startDrive = startDriveVector(1); 
end

