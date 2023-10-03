function [points] = getRandomPoints(I, alpha)
% Generates random points in the image
% Input:
%   I:                      grayscale image
%   alpha:                  random points
% Output:
%   points:                    point locations
%
	% -----fill in your implementation here --------
    if (ndims(I) == 3)
        I = rgb2gray(I);
    end
    points = zeros(alpha, 2);
    h = size(I, 1);
    w = size(I, 2);
    points(:,1) = randi([1, h], alpha, 1);
    points(:,2) = randi([1, w], alpha, 1);

    % ------------------------------------------

end

