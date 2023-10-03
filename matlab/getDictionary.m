function [dictionary] = getDictionary(imgPaths, alpha, K, method)
% Generate the filter bank and the dictionary of visual words
% Inputs:
%   imgPaths:       array of strings that repesent paths to the images
%   alpha:          num of points
%   K:              K means parameters
%   method:         string 'random' or 'harris'
% Outputs:
%   dictionary:         a length(imgPaths) * K matrix where each column
%                       represents a single visual word
    % -----fill in your implementation here --------
    
    
    filterBank = createFilterBank;
    numImg = numel(imgPaths.train_imagenames);
    pixelResponses = zeros(alpha*numImg, ...
                         3*numel(filterBank));
    pa_row_idx = 0;
    for i = 1:numImg
        path = strcat('../data/', imgPaths.train_imagenames{i});
        img = imread(path);
        filterResponse = extractFilterResponses(img, filterBank);
        
        if strcmp(method, 'harris')
            points = getHarrisPoints(img, alpha, 0.04);
        else
            points = getRandomPoints(img, alpha);
        end
        
        for j = 1:alpha
            pa_row_idx = pa_row_idx + 1;
            row = points(j,1);
            col = points(j,2);
            for filter = 1:size(filterResponse,3)
                pixelResponses(pa_row_idx, filter) = filterResponse(row, ...
                                                                    col, ...
                                                                    filter);
            end
            %filter = 1;
        end
            
    end
    
    [~, dictionary] = kmeans(pixelResponses, K, 'EmptyAction', 'drop');

    % ------------------------------------------
    
end
