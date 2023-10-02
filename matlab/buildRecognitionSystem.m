% buildRecognitionSystem.m
% This script loads the visual word dictionary (in dictionaryRandom.mat or dictionaryHarris.mat) and processes
% the training images so as to build the recognition system. The result is
% stored in visionRandom.mat and visionHarris.mat.
clear;

dir = '../data/';

load('../data/traintest.mat', 'train_imagenames', 'train_labels');
load('dictionaryHarris.mat');
load('dictionaryRandom.mat');

filterBank = createFilterBank();

batchToVisualWords(4);

l = length(train_imagenames);
harDictLen = length(dictionaryHarris);
ranDictLen = length(dictionaryRandom);

trainFeaturesHarris = zeros(l, harDictLen);
trainFeaturesRandom = zeros(l, ranDictLen);

for i = 1:l
    load([dir, strrep(train_imagenames{i},'.jpg','_harris.mat')],'wordMap');
    trainFeaturesHarris(i, :) = getImageFeatures(wordMap, harDictLen);
    load([dir, strrep(train_imagenames{i},'.jpg','_random.mat')],'wordMap');
    trainFeaturesRandom(i, :) = getImageFeatures(wordMap, ranDictLen);
end


trainLabels = train_labels';
trainFeatures = trainFeaturesHarris;
dictionary = dictionaryHarris;
save('visionHarris.mat', 'dictionary', 'filterBank', 'trainFeatures', 'trainLabels');

trainFeatures = trainFeaturesRandom;
dictionary = dictionaryRandom;
save('visionRandom.mat', 'dictionary', 'filterBank', 'trainFeatures', 'trainLabels');