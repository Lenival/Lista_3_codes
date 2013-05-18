function saida = testar(entradas, w)
    
    xi = [entradas 1];
    nh = [4 1];
    
    v = ((xi)*w{1})';
    a{1} = ones(1,5)';
    a{2} = 1;

    % Ativação das camadas ocultas
    for i=1:1:(2-1)
        a{i}(1:nh(i)) = tanh(v);
        v = (a{i}'*w{i+1})';
    end

    % Ativa da camada de saída
    a{2} = tanh(v);

    saida = a{2};
end