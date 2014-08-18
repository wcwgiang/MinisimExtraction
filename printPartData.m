function printPartData(partLabel, condition, data, dataLabels, sheetLabel)
fileName = ['1BToyota_', partLabel,'_', condition];
dataLabels = [{'Part'},{'Condition'}, dataLabels]; 
driveLabelVector = getPartConditionVector(partLabel, condition, size(data,1));
xlswrite(fileName, dataLabels, sheetLabel,'A1'); 
xlswrite(fileName, driveLabelVector, sheetLabel, 'A2'), 
xlswrite(fileName, data,sheetLabel,'C2');
end

