% Teste do BP_MLP
clear

rede = BP_MLP(2,[4 1],'tgh')

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

rede.treinar(entradas,100,0.4,0.01)

%[w e] = BP(2, [4 1], 'tgh', entradas, 100, 0.4, 0.01);