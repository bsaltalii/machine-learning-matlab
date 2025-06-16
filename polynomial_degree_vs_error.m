clear; close all; clc;

x = linspace(0, 10, 10)';                    
y = sin(x) + 0.15*randn(size(x));            

degrees     = 1:10;                          
errors_raw  = zeros(size(degrees));          
errors_scal = zeros(size(degrees));          

for n = degrees
    p_raw      = polyfit(x, y, n);           
    y_hat_raw  = polyval(p_raw, x);          
    errors_raw(n) = mean((y - y_hat_raw).^2);
    
    [p_sc, S, mu] = polyfit(x, y, n);        
    y_hat_sc  = polyval(p_sc, x, S, mu);     
    errors_scal(n) = mean((y - y_hat_sc).^2);
end

figure; hold on; grid on;
plot(degrees, errors_raw,  '-o', 'LineWidth', 1.5);
plot(degrees, errors_scal, '-s', 'LineWidth', 1.5);
xlabel('Polynomial Degree'); ylabel('Mean Squared Error (MSE)');
title('Model Complexity vs Error');
legend('Raw fit', 'Scaled fit', 'Location', 'NorthEast');
