clc;
clear ;
close all;

v_d(1) = 0;

t = 0 : 0.000001 : 1;

freq = 1;
d = 9 * 10 ^ -9;
u_v = 30 * 10 ^ -15;
r_on = 0.1 * 10 ^ 3;
r_off = 16 * 10 ^ 3;
r_i = 11000;

v = 1 * sin(2 * pi * t * freq);
w(1) = ((r_off - r_i) / (r_off - r_on)) * d;
x(1) = w(1) / d;
m(1) = r_on * x(1) + r_off * (1 - x(1));

f_p = [];
f_p(1) = x - x ^ 2;                              %Strukov window

% p = 1;
% f_p(1) = 1 - (2 * x - 1) ^ (2 * p);              %Joglekar window

% j = 5;
% f_p(1) = j * (1 - ((x - 0.5) ^ 2 + 0.75) ^ p);   %Prodromakis window

for index = 2 : length(t)

    i(index) = v(index) / m(index - 1);
    v_d(index) = (u_v * r_on * i(index) * f_p(index - 1)) / d;
    w(index) = v_d(index) * (t(index) - t(index - 1)) + w(index - 1);
    x(index) = w(index) / d;
    f_p(index) = x(index) - x(index) ^ 2;
%     f_p(index) = j * (1 - ((x(index) - 0.5) ^ 2 + 0.75) ^ p);
    m(index) = r_on * x(index) + r_off * (1 - x(index));

    if m(index) < r_on
        m(index) = r_on;
    end 

    if m(index) > r_off
        m(index) = r_off;
    end
end


% plot(v, i);
% title('Voltage vs Current (Strukov)');
% xlabel('Voltage(V)');
% ylabel('Current(A)');
% legend('V = 1V, f = 1Hz');
% saveas(gcf,'Strukov V-I.png')

figure;
plot(t,m,'color',[0,0.5,0]);
ylabel('Mesistance');
xlabel('Time');
title('Memristor Resistance vs. Time (Strukov)')
legend('V = 1V, f = 1Hz');
saveas(gcf,'Strukov R-t.png')