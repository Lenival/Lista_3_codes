%% Teste do BP_MLP.m
clear

rede = BP_MLP(2,[4 1],'tgh')

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

rede.treinar(entradas,100,0.4,0.01)

%% Teste do BP.m
clear

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

[w e] = BP(2, [4 1], 'tgh', entradas, 100, 0.2, 0.5);

%% Teste do backpropagation.m
clear

x = [1 1; -1 -1; -1 1; 1 -1];
d = [-1; -1; 1; 1];
arq = [4 1];
eta = 0.4;
alpha = 0.01;

[w e] = backpropagation(x, d, arq, eta, alpha);