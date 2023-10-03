clear;

datadir     = '../data/';    %the directory containing the images
resultsdir  = '../results'; %the directory for dumping results

images_train = load('../data/traintest.mat', 'train_imagenames');

%imglist = dir(sprintf('%s/**/*.jpg', datadir));

filterBank = createFilterBank;
