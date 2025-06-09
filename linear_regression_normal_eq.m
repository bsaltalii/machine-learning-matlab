clc; clear;
X = [1, 1, 2, 4;
     1, 2, 5, 7;
     1, 3, 6, 8;
     1, 4, 7, 10;
     1, 5, 9, 12];

y = [10; 15; 20; 25; 30];

w = inv(X' * X) * X' * y;

y_pred = X * w;

error = y_pred - y;
MSE = mean(error.^2);

disp('w = ');
disp(w);

disp('y_pred = ');
disp(y_pred);

disp('MSE = ');
disp(MSE);