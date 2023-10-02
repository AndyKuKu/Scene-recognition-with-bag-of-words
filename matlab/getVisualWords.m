function [wordMap] = getVisualWords(I, dictionary, filterBank)
% Convert an RGB or grayscale image to a visual words representation, with each
% pixel converted to a single integer label.   
% Inputs:
%   I:              RGB or grayscale image of size H * W * C
%   filterBank:     cell array of matrix filters used to make the visual words.
%                   generated from getFilterBankAndDictionary.m
%   dictionary:     matrix of size 3*length(filterBank) * K representing the
%                   visual words computed by getFilterBankAndDictionary.m
% Outputs:
%   wordMap:        a matrix of size H * W with integer entries between
%                   1 and K

    % -----fill in your implementation here --------

    filterResponse = extractFilterResponses(I, filterBank);
    features = size(filterResponse, 3);
    
    %permute to turn each pixels feature response (3rd dimension) into a
    %row
    %reshape to turn 3D matrix to 2D
    %[1 2 3       [1 (60 responses)
    % 4 5 6   -->  4 (60 responses)
    % 7 8 9]       ...
    %              9 (60 responses)]
    filterResponse = reshape( permute(filterResponse, [3 1 2]), features, [])';
    
    [~, closest] = min( pdist2(filterResponse, dictionary, 'sqeuclidean'), [], 2);
    
    %Reshape vector of closest dictionary elements to a wordMap of size
    %image.
    wordMap = reshape(closest, size(I, 1), size(I,2));
    % ------------------------------------------
end
