clear
clc

x=-pi:0.01:pi;

y=@(x)abs(2.*sin(x.^4)./x);
y1=abs(2.*sin(x.^4)./x);
w=[1e-3 1e-5 1e-7];
for i=1:3
[Q(i),FCNT]=quad(y,-pi,2*pi,w(i), 1);
Q1(i) = integral(y,-pi,2*pi,'AbsTol',w(i));
end

plot(x,y1)
axis([-pi pi -inf inf])
grid on
title('Wykres funkcji podcalkowej')
xlabel('x')
ylabel('y')


