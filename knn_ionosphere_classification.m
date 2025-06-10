clc; clear;

load ionosphere.mat;

Y = categorical(Y);

X = (X - mean(X)) ./ std(X);

cv = cvpartition(Y,'HoldOut',0.3);

XTrain = X(training(cv), : );
YTrain = Y(training(cv), : );
XTest = X(test(cv), : );
YTest = Y(test(cv), : );

model = fitcknn(XTrain,YTrain,'NumNeighbors',5);

YPred = predict(model,XTest);

accuracy = sum(YPred == YTest) / numel(YTest);
fprintf('Accuracy: %.2f%%\n', accuracy * 100);

