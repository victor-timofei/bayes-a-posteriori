clear ; close all; clc
data_file = '.\data\mnist.mat';

data = load(data_file);
images = zeros(size(data.trainX, 1), 28, 28);
labels =  zeros(size(data.trainY, 1),1);

for i = 1:size(data.trainX, 1)
    img = data.trainX(i, :);
    images(i, :, :) = reshape(img, 28, 28)';
    labels(i) = data.trainY(i);
end
digit_C1_indices = find(labels == 1); % digit 1
digit_C2_indices = find(labels == 2); % digit 2

digit_C1_images = images(digit_C1_indices, :, :);
digit_C2_images = images(digit_C2_indices, :, :);
aRatios=zeros(size(data.trainY, 1),1);
for i = 1:size(data.trainX, 1)
    aRatios(i) = computeAspectRatio(images (i,:,:));
end
%aRatios = zeros(8,2); % 
% Compute the aspect ratios of all images and store the value of the i-th image in aRatios(i)

minAspectRatio = min(aRatios)
maxAspectRatio = max(aRatios)

numBins = 3;

binEnds = linspace(minAspectRatio, maxAspectRatio, numBins+1);
C1_bins = zeros(numBins, 1);
C2_bins = zeros(numBins, 1);
all_bins = zeros(numBins, 1);
for i = 1:size(data.trainX, 1)
    bin = findBin(aRatios(i),binEnds);
    if bin == 1
        all_bins(1) = all_bins(1) + 1;
    elseif bin == 2
        all_bins(2) = all_bins(2) + 1;
    elseif bin ==3
        all_bins(3) = all_bins(3) + 1;
    end
    bins(i) = bin;
    if labels(i) == 1
        if bin == 1
            C1_bins(1) = C1_bins(1) + 1;
        elseif bin == 2
            C1_bins(2) = C1_bins(2) + 1;
        elseif bin ==3
            C1_bins(3) = C1_bins(3) + 1;
        end
        bins_C1(i) = bin;
    end
    if labels(i) == 2
        if bin == 1
            C2_bins(1) = C2_bins(1) + 1;
        elseif bin == 2
            C2_bins(2) = C2_bins(2) + 1;
        elseif bin ==3
            C2_bins(3) = C2_bins(3) + 1;
        end
        bins_C2(i) = bin;
    end
end
figure
hist(bins_C1,3)
figure
hist(bins_C2,3)
figure
hist(bins,3)
% Use the findBin function to get the counts for the histogram

% Prior Probabilities
PC1 = length(bins_C1)/length(labels);
PC2 = length(bins_C2)/length(labels);

% Likelihoods
PgivenC1 = C1_bins/length(bins_C1);
PgivenC2 = C2_bins/length(bins_C2);

% Evidence 

% Posterior Probabilities
%PC1givenL = ...
%PC2givenL = ...