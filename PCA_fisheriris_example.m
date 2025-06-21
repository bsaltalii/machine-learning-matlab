load fisheriris.mat

X = meas;
Xstd = (X - mean(X)) ./ std(X);

%------ Manual PCA ------
covMat = cov(Xstd);
[Ve,De] = eig(covMat);
[De_sort, order] = sort(diag(De),'descend');
Ve = Ve(:,order);
score_manual = Xstd * Ve;
explainedVar_manual = 100 * De_sort / sum(De_sort);

%------ Built-in PCA ------
[coeff, score, latent, tsquared, explained] = pca(X);

% Scree plot (variance explained) ------------------------------------------
figure;
pareto(explained);
xlabel('Principal Component'); ylabel('Variance Explained (%)');
title('Scree Plot – fisheriris');

% Scatter plot of first two PCs -------------------------------------------
figure;
gscatter(score(:,1), score(:,2), species);
xlabel('PC-1'); ylabel('PC-2');
title('Iris Data Projected onto First Two PCs');
grid on;