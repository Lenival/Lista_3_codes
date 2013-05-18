function [w] = backpropagation(x, d, arq)

nC = length(arq); % Numero de camadas
n = length(x); % Quantidade de amostras da entrada
nin = size(x,2) + 1; % Numero de neuronios da camada de entrada (incluindo o bias de entrada)
nout = size(d,2); % Numero de neuronios da camada de saida
maxEpoca = 500;
w = {};
a = {};

w{1} = rand(nin,arq(1));
for i=2:nC
    w{i} = rand(arq(i-1)+1,arq(i));
end

for i=1:(nC-1)
    a{i} = ones(arq(i),1);
end

for nEpocas=1:maxEpoca
    padroes = x(randperm(n),:);
    erro = 0;
    for p=1:n
        xn = [x(p,:) 1];
        dn = d(p,:);
        
        v = (xn*w{1})';
        
        for i=1:(nC-1)
            a{i}(1:arq(i)) = tanh(v);
        end
        
        
    end
    
end



end