clc; clear; close all;

x = [1; 2; 4; 3; 5];
y = [1; 3; 3; 2; 5];

n = length(x);

X = [ones(n,1),x];

theta = (X' * X) \ (X' * y);

b0 = theta(1);
b1 = theta(2);

fprintf("Model : y = %.2f + %.2f * x\n",b0,b1);

x_test = linspace(min(x),max(x),100)';
X_test = [ones(length(x_test),1),x_test];
y_pred = X_test * theta;

figure;
scatter(x,y,'ro','filled'); hold on;
plot(x_test,y_pred,'b-','LineWidth',2);
xlabel('x (hours studied)');
ylabel('y (exam score)');
title('Simple Linear Regression');
legend('Data points','Fitted line');
grid on;