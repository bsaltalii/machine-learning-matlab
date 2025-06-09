clc; clear;

X = [1, 1, 2;
     1, 2, 3;
     1, 3, 5;
     1, 4, 7;
     1, 5, 11];

y = [5; 9; 13; 17; 25];

w = inv(X' * X) * X' * y;

y_pred = X * w;

error = y_pred - y;
MSE = mean(error.^2);

disp("X = ");
disp(X);

disp('y_pred = ');
disp(y_pred);

disp('MSE = ');
disp(MSE);

fprintf('y_hat = %.2f + %.2f*x1 + %.2f*x2\n',w(1),w(2),w(3));