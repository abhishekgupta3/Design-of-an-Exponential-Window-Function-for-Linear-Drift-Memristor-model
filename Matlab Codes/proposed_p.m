clear;
close all;
ax = gca;

x = linspace(0, 1, 1000);
a = 1;
p = 1;
q = 1;

f1_x =  a * ( exp(-(x - 1) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x , f1_x, 'r','LineWidth',2.0);

hold on;
f2_x = a * ( exp(-(x) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x,f2_x,'r','LineWidth',2.0);

a = 1;
p = 2;
q = 1;
f1_x =  a * ( exp(-(x - 1) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x , f1_x, 'b','LineWidth',2.0);
f2_x = a * ( exp(-(x) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x,f2_x,'b','LineWidth',2.0);

a = 1;
p = 5;
q = 1;
f1_x =  a * ( exp(-(x - 1) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x , f1_x, 'g','LineWidth',2.0);
f2_x = a * ( exp(-(x) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x,f2_x,'g','LineWidth',2.0);

a = 1;
p = 10;
q = 1;
f1_x =  a * ( exp(-(x - 1) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x , f1_x, 'm','LineWidth',2.0);
f2_x = a * ( exp(-(x) .^ (2 * p)) - 1 / exp(1)) .^ q;
plot(x,f2_x,'m','LineWidth',2.0);

hold off;

% title('Proposed Window Function')
xlabel('x')
ylabel('f(x)')

ax.YAxis.LineWidth = 2;
ax.XAxis.LineWidth = 2;

legend('p=1','','p=2','','p=5','','p=10');