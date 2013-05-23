%% Teste do BP_MLP.m
clear

rede = BP_MLP(2,[4 1],'tgh')

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

rede.treinar(entradas,100,0.2,0.5)

%% Teste do BP.m
clear

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1; 1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1; 1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1; 1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

[w e] = BP(2, [4 1], 'tgh', entradas, 100, 0.2, 0.5);

%% Teste do backpropagation.m
clear

x = [1 1; -1 -1; -1 1; 1 -1];
d = [-1; -1; 1; 1];
arq = [4 1];
eta = 0.4;
alpha = 0.01;

[w e] = backpropagation(x, d, arq, eta, alpha);

%% Teste do algoritmo competitivo
clear
close
c1 = (rand(2,10)*.2)+repmat([-1;0.5],1,10);
c2 = (rand(2,10)*.2)+repmat([0.5;1],1,10);
a1 = [c1 c2];
c3 = (rand(2,10)*.8)+repmat([-1;0.5],1,10);
c4 = (rand(2,10)*.8)+repmat([0.5;1],1,10);
a2 = [c4 c3];
%plot (a(1,:),a(2,:),'*')
%grid on

redet = ALG_COMPET(2,20,2);
redet.nor(a1)
figure
[md w] = redet.trei(0.1,100);
figure
redet.valid(a2, w);

