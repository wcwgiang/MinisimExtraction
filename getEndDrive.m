function endDrive = getEndDrive(speedVector)
endDriveVector = find(speedVector >= 5); 
endDriveResults = endDriveVector(size(endDriveVector)); 
endDrive = endDriveResults(1); 
end


