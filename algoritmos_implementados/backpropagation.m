function [w e] = backpropagation(x, d, arq, eta, alpha)

nC = length(arq); % Numero de camadas
n = length(x); % Quantidade de amostras da entrada
nin = size(x,2) + 1; % Numero de neuronios da camada de entrada (incluindo o bias de entrada)
nout = size(d,2); % Numero de neuronios da camada de saida
maxEpoca = 500;
ajuste = {};
w = {};
v = {};
y = {};
delta = {};
e = zeros(arq(nC),1);
J = [];

w{1} = rand(nin,arq(1));
for i=2:nC
    w{i} = rand(arq(i-1)+1,arq(i));
end

ajuste{1} = zeros(nin,arq(1));
for i=2:nC
    ajuste{i} = zeros(arq(i-1)+1,arq(i));
end

y{1} = zeros(nin,1);
for i=2:nC
    y{i} = [zeros(arq(i-1),1); ones(1,1)];
end
y{nC+1} = zeros(arq(i),1);

for i=1:nC
    v{i} = zeros(arq(i),1);
end

for i=1:nC
    delta{i} = zeros(arq(i),1);
end

for nEpocas=1:maxEpoca
    padroes = x(randperm(n),:);
    erro = 0;
    E = 0;
    for p=1:n
        % Propagacao
        xn = [padroes(p,:) 1]';
        dn = d(p,:)';
        
        y{1} = xn;
        
        for i=1:nC
            v{i} = (y{i}'*w{i})';
        end
        
        for i=1:nC
            y{i+1}(1:arq(i)) = tanh(v{i});
        end
        
        erro = dn - y{nC+1};
        
        % Retropropagacao
        delta{nC} = e*dtanh(v{nC});
        
        for i=(nC-1):-1:1
            somatorio = delta{i}'*w{i+1}(1:arq(i));
            delta{i} = dtanh(v{i}).*somatorio;
        end
        
        for i=1:nC
            ajuste{i} = eta*(delta{i}*y{i}')' + alpha*ajuste{i};
            w{i} = w{i} + ajuste{i};
        end
        
        E = E + 0.5*(erro'*erro);
    end
    J = [J; E];
    
end
plot(1:length(J),J);

end