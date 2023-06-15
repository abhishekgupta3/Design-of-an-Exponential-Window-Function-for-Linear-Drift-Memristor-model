% Linear Model with varying 'q'
clc;
clear ;
close all;

t = 0 : 0.0001 : 2;

d = 10 * 10 ^ -9; % distance between the electrodes
u_v = 10 ^ -14; % mobility of oxygen vacancy (unit m2 s−1 V−1)
r_on = 100; % on state resistance 
r_off = 16 * 10 ^ 3; % off state resistance
r_i = 10000; % equivalent instantaneous resistance

freq = 0.75;
v =  2 * sin(2 * pi * t * freq); % input applied voltage
w(1) = ((r_off - r_i) / (r_off - r_on)) * d; % width of the doped region
x(1) = w(1) / d; % internal state variable
m(1) = r_on * x(1) + r_off * (1 - x(1)); % memristance

f_x = []; % window function
i = v / m;
a = 1;
p = 10;
q = 3;
f_x = a * ( exp(-(x - heaviside(-i(1))) .^ (2 * p)) - 1 / exp(1)) .^ q;

for index = 2 : length(t)

    i(index) = v(index) / m(index - 1);
    w(index) = ((u_v * r_on * i(index) * f_x(index - 1)) / d) * (t(index) - t(index - 1)) + w(index - 1);
    x(index) = w(index) / d;
    f_x(index) = a * ( exp(-(x(index) - heaviside(-i(index))) .^ (2 * p)) - 1 / exp(1)) .^ q;
    m(index) = r_on * x(index) + r_off * (1 - x(index));

    if m(index) < r_on
        m(index) = r_on;
    end 

    if m(index) > r_off
        m(index) = r_off;
    end
end

plot(v,i,'LineWidth',2.0);
% title('Voltage-Current (V=1,a=1,q=1)');
ylabel('Current (A)');
xlabel('Voltage (V)');

hold on;
clc;
clear ;

t = 0 : 0.0001 : 2;

d = 10 * 10 ^ -9; % distance between the electrodes
u_v = 10 ^ -14; % mobility of oxygen vacancy (unit m2 s−1 V−1)
r_on = 100; % on state resistance 
r_off = 16 * 10 ^ 3; % off state resistance
r_i = 10000; % equivalent instantaneous resistance

freq = 0.75;
v =  2 * sin(2 * pi * t * freq); % input applied voltage
w(1) = ((r_off - r_i) / (r_off - r_on)) * d; % width of the doped region
x(1) = w(1) / d; % internal state variable
m(1) = r_on * x(1) + r_off * (1 - x(1)); % memristance

f_x = []; % window function
i = v / m;
a = 1;
p = 10;
q = 5;
f_x = a * ( exp(-(x - heaviside(-i(1))) .^ (2 * p)) - 1 / exp(1)) .^ q;

for index = 2 : length(t)

    i(index) = v(index) / m(index - 1);
    w(index) = ((u_v * r_on * i(index) * f_x(index - 1)) / d) * (t(index) - t(index - 1)) + w(index - 1);
    x(index) = w(index) / d;
    f_x(index) = a * ( exp(-(x(index) - heaviside(-i(index))) .^ (2 * p)) - 1 / exp(1)) .^ q;
    m(index) = r_on * x(index) + r_off * (1 - x(index));

    if m(index) < r_on
        m(index) = r_on;
    end 

    if m(index) > r_off
        m(index) = r_off;
    end
end

plot(v,i,'LineWidth',2.0);
hold off;

ax = gca;
ax.YAxis.LineWidth = 2;
ax.XAxis.LineWidth = 2;
legend('q=3','q=5');