%% Teste do algoritmo competitivo
% clear
% close all
% c1 = (rand(2,10)*.2)+repmat([-1;0.5],1,10);
% c2 = (rand(2,10)*.2)+repmat([0.5;1],1,10);
% a1 = [c1 c2];
% c3 = (rand(2,10)*.8)+repmat([-1;0.5],1,10);
% c4 = (rand(2,10)*.8)+repmat([0.5;1],1,10);
% a2 = [c4 c3];

clear
close all
theta = linspace(0,20,51);
% """"Construçao das esppirais a partir do parâmetro theta"""
% """Eequaçao 1"""
x1 = (theta/4).*cos(theta);
y1 = (theta/4).*sin(theta);
%"""Equacao 2"""
x2 = (0.8+theta/4).*cos(theta);
y2 = (0.8+theta/4).*sin(theta);
%"""Gerando um conjuto de respostas desejadas para cada espiral"""
a = [x1 ; y1]; % Espiral 1 [1,-1]
b = [x2 ; y2]; % Espiral 2 [-1,1]
ab = [a' ; b']';

redet = ALG_COMPET(2,102,100);
redet.nor(ab)
figure
[md w] = redet.trei(0.1,5000);
figure
redet.valid(ab, w);

%% Teste do algoritmo SOM
clear
close all
theta = linspace(0,20,51);
% """"Construçao das esppirais a partir do parâmetro theta"""
% """Eequaçao 1"""
x1 = (theta/4).*cos(theta);
y1 = (theta/4).*sin(theta);
%"""Equacao 2"""
x2 = (0.8+theta/4).*cos(theta);
y2 = (0.8+theta/4).*sin(theta);
%"""Gerando um conjuto de respostas desejadas para cada espiral"""
a = [x1 ; y1]; % Espiral 1 [1,-1]
b = [x2 ; y2]; % Espiral 2 [-1,1]
ab = [a' ; b']';
%  scatter(ab(1:51,1),ab(1:51,2),[],'r')
%  hold on
%  scatter(ab(52:102,1),ab(52:102,2),[],'g')

redet = ALG_SOM(2,102,1000);
figure
whitebg('k')
redet.nors(ab,'aleat')
figure
whitebg('k')
redet.treis(0.1,1000,0.1);