%function [sys,x0,str,ts]=borb(x,y)
clear
clc
r = 0.5;
a1 = 0.5;
b1 = 0;
a2 = 0;
b2 = 0.5;
a3 = 0.5;
b3 = 1;
a4 = 1;
b4 = 0.5;
x = 0;
s = 1001;
for n = 1:s
    %###### SEMI-CIRCUNFERÊNCIAS ######
    yhe(n) = sqrt(r^2 - (x-a1)^2)+b1;
    xvb(n) = sqrt(r^2 - (x-b2)^2)+a2;
    yhd(n) = -sqrt(r^2 - (x-a3)^2)+b3;
    xvc(n) = -sqrt(r^2 - (x-b4)^2)+a4;
    w(n)=x;                          
    x = x + 1/s; 
    %###### QUADRADO ########
    qlc(n) = 1;
    qlb(n) = 0;
    qle(n) = 0;
    qld(n) = 1;
    %###### CRUZ #########
    c(n) = 0.5;
    %###### DADOS ALEATÓRIOS #####
    xa(n) = rand(1);
    ya(n) = rand(1);
    %###### DISTÂNCIA DOS PONTOS AOS CENTROS #####
    distvb = sqrt((a1-xa(n))^2+(b1-ya(n))^2);
    disthe = sqrt((a2-xa(n))^2+(b2-ya(n))^2);
    distvc = sqrt((a3-xa(n))^2+(b3-ya(n))^2);
    disthd = sqrt((a4-xa(n))^2+(b4-ya(n))^2);
    %###### definição de classe #####
    
    
end    
    
plot(w,yhe,'r')
hold on
plot(xvb,w,'g')
plot(w,yhd,'b')
plot(xvc,w,'y')
plot(w,qlc,'k')
plot(w,qlb,'k')
plot(qle,w,'k')
plot(qld,w,'k')
plot(w,c,'k')
plot(c,w,'k')
plot(xa,ya,'.')
%end
