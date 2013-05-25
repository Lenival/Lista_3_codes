% Rede BP (Levenberg-Marquardt backpropagation) para solucionar o problema do XOR
P = [-1 -1; -1 1; 1 -1; 1 1;-1 -1; -1 1; 1 -1; 1 1;-1 -1; -1 1; 1 -1; 1 1;-1 -1; -1 1; 1 -1; 1 1]; % Entradas
T = [-1 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1 1 1 -1]; % Saidas
net = feedforwardnet(2)
net = train(net,P',T);
view(net)
y = net(P'); % Testando a rede
%perf = perform(net,y,T) % Avalia a rede