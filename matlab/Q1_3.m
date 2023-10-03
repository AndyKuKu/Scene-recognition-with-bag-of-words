clear;

datadir     = '../data/';    %the directory containing the images

images_train = load('../data/traintest.mat', 'train_imagenames');

imglist = dir(sprintf('%s/**/*.jpg', datadir));

filterBank = createFilterBank;

for i = [1 602 1200]
    [~, imgname, ~] = fileparts(imglist(i).name);
    path = imglist(i).folder;
    img = imread(sprintf('%s/%s', path, imglist(i).name));
    filterResponse = extractFilterResponses(img, filterBank);
    %Hpoints = detectHarrisFeatures(img);
    rpoints = getRandomPoints(img, 500);
    hpoints = getHarrisPoints(img, 500, 0.04);
    figure;
    imshow(img);
    hold on
    plot(hpoints(:,2),hpoints(:,1), 'green.');
    
    figure;
    imshow(img);
    hold on
    plot(rpoints(:,2),rpoints(:,1), 'green.');
    

end


