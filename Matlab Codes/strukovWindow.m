x = linspace(0, 1, 100);
f = x - x .^ 2;
plot(x , f);
title('Strukov Window Function')
xlabel('x')
ylabel('f(x)')

saveas(gcf,'strukov.png')