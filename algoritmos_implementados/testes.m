% Teste do BP_MLP
clear
clear
rede = BP_MLP(2,[4 1],'tgh')

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

treinar(rede,entradas,500,0.2,0.5)