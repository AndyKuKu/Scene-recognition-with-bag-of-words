clear;

datadir     = '../data';    %the directory containing the images
resultsdir  = '../results'; %the directory for dumping results

images_train = load('../data/traintest.mat', 'train_imagenames');

%getDictionary(image_set, num_points, Kmeans, method)
dictionaryHarris = getDictionary(images_train, 300, 300, 'harris');
dictionaryRandom = getDictionary(images_train, 500, 300, 'random');


save('dictionaryRandom.mat', 'dictionaryRandom');
save('dictionaryHarris.mat', 'dictionaryHarris');