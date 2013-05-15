% Teste do BP_MLP
rede = BP_MLP(2,[4 1],'tgh')

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

rede.treinar(entradas,1000,0.4,0.01)