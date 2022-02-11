%Speed of Sound measurement

% Load Data
T = readtable('BE17B009.csv');
time = table2array(T(:,4));
V = table2array(T(:,5));

%%

%Plot data 
plot(time/ (10^-6), V, 'LineWidth', 1)
xlabel('Time ({\mu}s)')
ylabel('Amplitude (V)')

%%