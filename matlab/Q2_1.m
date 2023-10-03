clear;

dir = '../data/';
load('../data/traintest.mat','all_imagenames','mapping');

for i = [1:3 602:604]
    load([dir, strrep(all_imagenames{i},'.jpg','_harris.mat')],'wordMap');
    figure;
    hold on
    imshow(label2rgb(wordMap));
    
    load([dir, strrep(all_imagenames{i},'.jpg','_random.mat')],'wordMap');
    figure;
    hold on
    imshow(label2rgb(wordMap));
end