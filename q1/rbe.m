clear

% Projetando a rede para inputs P e targets T
P = [1 2 3];
T = [2.0 4.1 5.9];
net = newrbe(P,T);

% Testando a rede
P = 1.5;
Y = sim(net,P)