clear
clc

x=[-1.1:1.1];
y=[-1:1];
f=@(x) exp((x(1).^2)+2*(x(2).^2))-10*x(1)*x(2);
[wsp1, val1] = fmincon(f,[0.1,0],[],[],[],[],[min(x) min(y)],[max(x) max(y)]);

x=[0:2];
y=[-1.1:1.1];
f=@(x) (((x(2).^2)-0.5).^2)/(0.132-exp(-((x(1)-1).^2)));
[wsp2, val2] = fmincon(f,[0.1,0],[],[],[],[],[min(x) min(y)],[max(x) max(y)]);

x=[4:13];
y=[0:10];
f=@(x) 2*x(1).^3+x(2).^2+(x(1)^.2)*(x(2).^2)+4*x(2)+3;
[wsp3, val3] = fmincon(f,[4.0,0.0],[],[],[],[],[min(x) min(y)],[max(x) max(y)]);


val1
wsp1
val2 
wsp2
val3
wsp3
