clc; clear;

x = [1 2 3]';
y = [6 11 18];

n = 2;
p = polyfit(x, y, n);

xFine = linspace(min(x), max(x), 100);
yHat = polyval(p, xFine);

figure; hold on; grid on;
scatter(x, y, 80, 'filled', 'MarkerFaceColor','r');
plot(xFine, yHat, '-b', 'LineWidth', 2);
title(sprintf('Polynomial Regression (degree %d)', n));
xlabel('x'); ylabel('y');
legend('Data', 'Fitted curve', 'Location', 'NorthWest');