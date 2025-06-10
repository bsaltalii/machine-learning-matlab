clc; clear;

load fisheriris.mat;

X = meas;
Y = species;

Y = categorical(Y);

X = (X - mean(X)) ./ std(X);

cv = cvpartition(Y,'HoldOut',0.3);

XTrain = X(training(cv), :);
YTrain = Y(training(cv), :);
XTest = X(test(cv), :);
YTest = Y(test(cv), :);

k = 5;
mdl = fitcknn(XTrain,YTrain,'NumNeighbors',k,'Standardize',false);

YPred = predict(mdl,XTest);

accuracy = sum(YPred == YTest) / numel(YTest);
fprintf('Accuracy: %.2f%%\n', accuracy * 100);
