clc; clear;

x = [1; 2; 3; 4; 5];
y = [2.2; 4.8; 9.1; 16.5; 25.3];

degree = 2;

X = ones(length(x),1);

for d = 1:degree
    X = [X x.^d];
end

w = inv(X'* X) * X' * y;

y_pred = X * w;

error = y - y_pred;
MSE = mean(error.^2);

disp("Weigths : ");
disp(w);

disp("Predicted y :");
disp(y_pred);

fprintf("MSE: %.3f",MSE);