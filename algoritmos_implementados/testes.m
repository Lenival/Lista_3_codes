%% Teste do BP_MLP.m
clear

rede = BP_MLP(2,[4 1],'tgh')

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

rede.treinar(entradas,100,0.4,0.01)

%% Teste do BP.m
[w e] = BP(2, [4 1], 'tgh', entradas, 100, 0.4, 0.01);

%% Teste do backpropagation.m
x = [1 1; -1 -1; -1 1; 1 -1];
d = [-1; -1; 1; 1];
arq = [4 1];

[w e] = backpropagation(x, d, arq);