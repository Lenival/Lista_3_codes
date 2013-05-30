% Questao 8

clear
clc

N = 200;

% Geracao dos dados

r = 1;
k = 0.01;

x = -1:k:1;
y = -1:k:1;

x0 = -1;
y0 = 0;

yhe = sqrt(r^2 - (x - x0).^2) + y0;

x0 = 1;
y0 = 0;

yhd = sqrt(r^2 - (x - x0).^2) + y0;

y0 = -1;
x0 = 0;

xvb = sqrt(r^2 - (y - y0).^2) + x0;

y0 = 1;
x0 = 0;

xvc = sqrt(r^2 - (y - y0).^2) + x0;

x0 = 0;
y0 = 0;
r = 0.25;

ang = 0:k:2*pi; 
xc = r*cos(ang);
yc = r*sin(ang);
plot(x0+xc,y0+yc,'k');
hold on

plot(x,real(yhe),'b')
plot(x,real(-yhe),'b')
plot(x,real(yhd),'r')
plot(x,real(-yhd),'r')
plot(real(xvb),y,'c')
plot(real(-xvb),y,'c')
plot(real(xvc),y,'g')
plot(real(-xvc),y,'g')

pontos = 2*rand(2,N) - 1;
%plot(pontos(1,:),pontos(2,:),'ok');

% Classificacao
% [QX QY H V]
classe = zeros(N,4);
H = [];
V = [];
QX = [];
QY = [];

for i=1:size(pontos,2)
    H = [H; (norm([pontos(1,i)-1 pontos(2,i)])<1)||(norm([pontos(1,i)+1 pontos(2,i)])<1)];
end
for i=1:size(pontos,2)
    V = [V; (norm([pontos(1,i) pontos(2,i)-1])<1)||(norm([pontos(1,i) pontos(2,i)+1])<1)];
end
QX = [QX; (pontos(1,:)>0)];
QY = [QY; (pontos(2,:)>0)];

classe = [QX; QY; H'; V'];

R = H&V;
plot(pontos(1,R),pontos(2,R),'ok');