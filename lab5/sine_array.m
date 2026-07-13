% Basic Setup
N = 256;                % num samples
max_val = 1023;         % max value we can represent in dac

% generate timestamps
t = 0:(N-1);            % array of reference values
theta = 2 * pi * t / N; % array of 256 angles fom 0 to 2*Pi, excluding 2pi
sine_vals = round((sin(theta) + 1) * (max_val / 2));
                        % conv to radians
                        % add 1 so we have no negatives
                        % scale to use up thing

% plot for sanity
plot(t, sine_vals, '.-'); % plot w connecting lines and dots
title('10-bit Sine Wave Lookup Table (0 to 1023)');
xlabel('Sample Index');
ylabel('DAC Digital Value');
grid on;

% generate values we can copy paste into C
formatted_text = sprintf('%d, ', sine_vals)