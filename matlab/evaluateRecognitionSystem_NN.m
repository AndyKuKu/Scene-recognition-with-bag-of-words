% evaluateRecognitionSystem.m
% This script evaluates nearest neighbour recognition system on test images
% load traintest.mat and classify each of the test_imagenames files.
% Report both accuracy and confusion matrix

dir = '../data/';
load('../data/traintest.mat', 'test_imagenames', 'test_labels');

load('visionHarris.mat');
h_dict = dictionary;
h_trainFeatures = trainFeatures;
h_trainLabels = trainLabels;
h_dictLen = length(h_dict);

load('visionRandom.mat');
r_dict = dictionary;
r_trainFeatures = trainFeatures;
r_trainLabels = trainLabels;
r_dictLen = length(r_dict);

l = length(test_imagenames);


harC = zeros(8,8);
ranC = zeros(8,8);

for i = 1:l
    load([dir, strrep(test_imagenames{i},'.jpg','_harris.mat')],'wordMap');
    [hHist] = getImageFeatures(wordMap, h_dictLen);
    [hDist] = getImageDistance(hHist, h_trainFeatures, 'chisq');
    [~, hidx] = min(hDist);
    harC(h_trainLabels(hidx), test_labels(i)) = harC(h_trainLabels(hidx), test_labels(i)) + 1;
    
    load([dir, strrep(test_imagenames{i},'.jpg','_random.mat')],'wordMap');
    [rHist] = getImageFeatures(wordMap, r_dictLen);
    [rDist] = getImageDistance(rHist, r_trainFeatures, 'chisq');
    [~, ridx] = min(rDist);
    ranC(r_trainLabels(ridx), test_labels(i)) = ranC(r_trainLabels(ridx), test_labels(i)) + 1;
end

harAcc = sum( diag(harC) ) / sum( sum(harC) );
ranAcc = sum( diag(ranC) ) / sum( sum(ranC) );

disp("Harris results: ");
disp(harC);
disp(harAcc);

disp("Random results: ");
disp(ranC);
disp(ranAcc);
