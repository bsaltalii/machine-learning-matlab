clc; clear; close all;

Xsmall = [1 2;
          2 4;
          3 6;
          4 8];

mu = mean(Xsmall);
sig = std(Xsmall);
Xs = (Xsmall - mu) ./ sig;

Sigma = cov(Xs);

[V, D] = eig(Sigma);
[eigsSorted, idx] = sort(diag(D), 'descend');
V = V(:,idx);
D = diag(eigsSorted);

Zsmall = Xs * V(:,1);

disp("Toy data projected to 1-D : ");
disp(Zsmall');