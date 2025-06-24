clc; clear;

X_train = [1 1; 2 2; 3 3; 6 6];
Y_train = ["A"; "A"; "B"; "B"];

x_test = [2.5 , 2.5];

distances = sqrt(sum((X_train - x_test).^2, 2));

K = 3;

[~,idx] = sort(distances);
k_nearest_labels = Y_train(idx(1 : K));

predicted_class = mode(categorical(k_nearest_labels));

fprintf("Test point : (%.1f , %.1f)\n",x_test(1),x_test(2));
fprintf("Predicted class : %s \n", predicted_class);