
% ---------------------- Q1_1 Start -----------------------------
img = imread('../data/campus/sun_abslhphpiejdjmpz.jpg');    
filtered_img = extractFilterResponses(img, createFilterBank());
% Apply all 4 filters on the L channel
imshow(filtered_img(:,:,1),[]);    % Gaussian
figure ;
%pause(5);
imshow(filtered_img(:,:,16),[]);% Log
figure;
%pause(5);
imshow(filtered_img(:,:,31),[]);        % dX
figure;
%pause(5);
imshow(filtered_img(:,:,46),[]);        % dY
figure;
%pause(5);
% ---------------------- Q1_1 End -------------------------------

