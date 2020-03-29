data_file = '.\data\mnist.mat';

data = load(data_file);
images = zeros(size(data.trainX, 1), 28, 28);
labels =  zeros(size(data.trainY, 1),1);

for i = 1:size(data.trainX, 1)
    img = data.trainX(i, :);
    images(i, :, :) = reshape(img, 28, 28)';
    labels(i) = data.trainY(i);
end
test = images (72,:,:)
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

% Use the findBin function to get the counts for the histogram

% Prior Probabilities
%PC1 = ...
%PC2 = ...

% Likelihoods
%PgivenC1 = ...
%PgivenC2 = ...

% Evidence 

% Posterior Probabilities
%PC1givenL = ...
%PC2givenL = ...