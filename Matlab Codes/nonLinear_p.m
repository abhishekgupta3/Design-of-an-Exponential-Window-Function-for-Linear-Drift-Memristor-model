% Non Linear Model with varying 'p'
clc;
clear ;
close all;

t = 0 : 0.0001 : 2;

freq = 0.5;
v =  1 * sin(2 * pi * t * freq);

w = zeros(size((t)));
i = zeros(size((t)));
w(1) = 0.5; 

beta = 0.9e-6;
a = 1;
x = 1e-10;
n = 2;
m = 5;
gamma = 4;
alpha = 2;

p = 10;
q = 1;
f_p = a * ( exp(-(w(1) - heaviside(-v(1))) .^ (2 * p)) - 1 / exp(1)) .^ q;

for index = 2 : length(t)
    w(index) = w(index - 1) + (a * v(index) ^ m) * (t(index) - t(index - 1)) * a * ( exp(-(w(index-1) - heaviside(-v(index-1))) .^ (2 * p)) - 1 / exp(1)) .^ q;
    i(index) = w(index) ^ n * beta * sinh(alpha * v(index)) + x * (exp(gamma * v(index)) - 1);

    if w(index) < 0
        w(index) = 0;
    elseif w(index) > 1
        w(index) = 1;
    end
end

plot(v, i,'LineWidth',2.0);
xlabel('Voltage (V)');
ylabel('Current (A)');

hold on;
clc;
clear ;

t = 0 : 0.0001 : 2;

freq = 0.5;
v =  1 * sin(2 * pi * t * freq);

w = zeros(size((t)));
i = zeros(size((t)));
w(1) = 0.5; % width of the doped region

beta = 0.9e-6;
a = 1;
x = 1e-10;
n = 2;
m = 5;
gamma = 4;
alpha = 2;

p = 3;
q = 1;
f_p = a * ( exp(-(w(1) - heaviside(-v(1))) .^ (2 * p)) - 1 / exp(1)) .^ q;

for index = 2 : length(t)
    w(index) = w(index - 1) + (a * v(index) ^ m) * (t(index) - t(index - 1)) * a * ( exp(-(w(index-1) - heaviside(-v(index-1))) .^ (2 * p)) - 1 / exp(1)) .^ q;
    i(index) = w(index) ^ n * beta * sinh(alpha * v(index)) + x * (exp(gamma * v(index)) - 1);

    if w(index) < 0
        w(index) = 0;
    elseif w(index) > 1
        w(index) = 1;
    end
end

plot(v, i,'LineWidth',2.0);
hold off;

ax = gca;
ax.YAxis.LineWidth = 2;
ax.XAxis.LineWidth = 2;
legend('p=10', 'p=3');
