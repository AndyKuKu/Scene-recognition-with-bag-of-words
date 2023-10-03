    function [points] = getHarrisPoints(I, alpha, k)
% Finds the corner points in an image using the Harris Corner detection algorithm
% Input:
%   I:                      grayscale image
%   alpha:                  number of points
%   k:                      Harris parameter
% Output:
%   points:                    point locations
%
    % -----fill in your implementation here --------
    I = im2double(I);
    if (ndims(I) == 3)
        I = rgb2gray(I);
    end
    
   
    
    [Gx, Gy] = imgradientxy(I);
    
 
    meanx = Gx - mean(Gx, 2);
    meany = Gy - mean(Gy);
    
    sum = ones(5,5);
    Sxx = imfilter(meanx .* meanx, sum, 'conv');
    Sxy = imfilter(meanx .* meany, sum, 'conv');
    Syy = imfilter(meany .* meany, sum, 'conv');
    
    R = zeros(size(Sxx));
    parfor i=1:numel(Sxx)
        M = [Sxx(i) Sxy(i); Sxy(i) Syy(i)];
        R(i) = det(M) - k*trace(M)^2;
    end
    
    R_pad = padarray(R, [1,1],0,'both');
    R_col = im2col(R_pad, [3 3]);
    R_test = R;
    
    for i = 1:size(R_col, 2)
        vector = R_col(:,i);
        if vector(5) ~= max(vector)
            R(i) = 0;
        end
    end
    
    R = reshape(R, [], 1);
    [~, index] = sort(R, 'descend');
    points = zeros(alpha, 2);
    for i = 1:alpha
        [points(i,1), points(i,2)] = ind2sub(size(Gx), index(i));
    end
    % ------------------------------------------

end
