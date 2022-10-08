x = linspace(0, 1, 100);
f = 1 - (2 * x - 1) .^ (2 * p);
plot(x , f);

title('Joglekar Window Function')
xlabel('x')
ylabel('f(x)')

hold on;

f = 1 - (2 * x - 1) .^ 4;
plot( x, f);

f = 1 - (2 * x - 1) .^ 8;
plot(x, f);
hold off;

legend('p = 1', 'p = 2', 'p = 4');

saveas(gcf,'joglekar.png')