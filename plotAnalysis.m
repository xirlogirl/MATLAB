% simple use of containers.Map
% color coded histogram

function plotAnalysis(data, channel)
    % only get valid entries for the channel of interest
    validData = data(:,channel)>0;      
    [yyyy, mm] = datevec(data(validData,1));
    alldata_valid = [yyyy, mm, data(validData,:)];

    % Create a lookup table to properly organize the data
    keys = unique(yyyy);
    values = (1:length(keys))';
    yearmonth = containers.Map(keys,values);
  
    % preallocate array
    multiyr_ordered = zeros(length(unique(yyyy)), length(unique(mm)));

        % iterate over elements with proper posiitoning
        for i=1:length(alldata_valid)
           multiyr_ordered(yearmonth(alldata_valid(i,1)),alldata_valid(i,2)) = alldata_valid(i,channel + 2);  
        end
    imagesc(log(multiyr_ordered)); colorbar;
    set(gca, 'YTickLabel', keys')
    set(gca, 'XTick', 1:12)
    set(gca, 'XTickLabel', {'Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec'})
    
end
