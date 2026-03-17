clc;
clear;

// Number of samples
N = 100000;

// Variables
inside = 0;
pi_vals = zeros(1, N);
steps = 1:N;

// True value of pi
pi_true = %pi;

// Main loop
for i = 1:N
    x = rand();
    y = rand();
    
    if (x^2 + y^2 <= 1) then
        inside = inside + 1;
    end
    
    pi_vals(i) = 4 * inside / i;
end

// Error calculation
error = abs(pi_vals - pi_true);

// ----------------------
// Plot 1: Convergence
// ----------------------
scf(1);
plot(steps, pi_vals);
xlabel("Number of Samples");
ylabel("Estimated Pi");
title("Pi Convergence");
xgrid();

// Save image
xs2png(1, "pi_plot.png");

// ----------------------
// Plot 2: Error vs Samples
// ----------------------
scf(2);
plot(steps, error);
xlabel("Number of Samples");
ylabel("Error");
title("Error vs Samples");
xgrid();

// Save image
xs2png(2, "error_plot.png");

// ----------------------
// Plot 3: Log-Log Plot
// ----------------------
scf(3);
loglog(steps, error);
xlabel("log(N)");
ylabel("log(Error)");
title("Log-Log Error Plot");
xgrid();

// Save image
xs2png(3, "log_plot.png");

// Display final value
disp("Estimated value of pi:");
disp(pi_vals($));
