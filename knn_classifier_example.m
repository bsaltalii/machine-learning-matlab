clc; clear;

X_train = [1 2; 2 3; 3 3; 6 5; 7 8; 8 8];
Y_train = ["A"; "A"; "A"; "B"; "B"; "B"];

x_test = [4 4];

K = 3;

distances = sqrt(sum((X_train - x_test).^2, 2));

[~,idx] = sort(distances);
k_nearest_labels = Y_train(idx(1 : K));

predicted_class = mode(categorical(k_nearest_labels));

fprintf("Test point : (%.1f , %.1f)\n",x_test(1),x_test(2));
fprintf("Predicted class : %s",predicted_class);