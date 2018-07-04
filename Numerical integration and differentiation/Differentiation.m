clear
clc

[t,Y]=ode23('Function',[0 pi],[0]'); %Y - rozwi¹zanie numeryczne

y=(sin(t)-(0.5.*(cos(t).^4)))+0.5; %y - rozwi¹zanie dok³adne
bl=y-Y %bl - b³¹d ró¿niczkowania
subplot(2,1,1)
plot(t,Y,t,y)
axis([0 pi -inf inf])
grid on
title('Rozniczkowanie')
text(-2.9,1.1,'rozwiazanie numeryczne i dokladne')
xlabel('t')
ylabel('y')
subplot(2,1,2)
plot(t,bl)
axis([0 pi -inf inf])
grid on
title('Wykres bledu')
xlabel('t')
ylabel('y')