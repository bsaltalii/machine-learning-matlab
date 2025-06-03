x = (1:20)';
y = 3*x + 7 + randn(20,1)*5;

figure;
scatter(x,y, 'filled');
xlabel('x');
ylabel('y');
title('Raw Data - Scatter Plot');
grid on;

X = [ones(length(x),1),x];
theta = (X' * X) \ (X' * y);

y_pred = X * theta;

hold on;
plot(x,y_pred,'r','LineWidth',2);
legend('Data','Linear Fit');

mae = mean(abs(y - y_pred));
rmse = sqrt(mean((y - y_pred).^2));

SS_res = sum((y - y_pred).^2);
SS_tot = sum((y - mean(y)).^2);
r2 = 1 - (SS_res / SS_tot);

fprintf("MAE : %.2f\n", mae);
fprintf("RMSE: %.2f\n", rmse);
fprintf("R²   : %.2f\n", r2);

model = fitlm(x, y);
disp(model);