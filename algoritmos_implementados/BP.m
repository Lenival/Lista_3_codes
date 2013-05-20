function [wOut J] = BP(entradas, arquitetura, saida, padroes, epocas, eta, alpha)
    % Inicialização dos parâmetros da rede
    ni = entradas + 1;
    nh = arquitetura;
    f_saida = saida;
    final = length(nh);

    % Inicialização dos principais sinais
    xi = ones(ni,1);
    a = {};
    delta = {};

    for i = 1:1:final-1
        %Os +1 estão sendo colocados para usar como bias
        a{i} = ones(nh(i)+1,1);
        delta{i} = ones(nh(i)+1,1);
    end

    a{final} = ones(nh(final),1);
    delta{final} = zeros(nh(final),1);

    % Vetor que conterá o erro da última camada
    erro = zeros(nh(final),1);

    % Inicialização de pesos sinápticos e mudança anterior
    % nos pesos para o momento

    w = {};
    c = {};
    ajuste = {};

    w{1} = [2*rand(ni-1, nh(1))-1; 2*rand(1)*ones(1,nh(1))-1];
    c{1} = zeros(ni, nh(1));
    ajuste{1} = zeros(ni, nh(1));

    for i = 1:1:final-1
        w{i+1} = [2*rand(nh(i),nh(i+1))-1; 2*rand(1)*ones(1,nh(i+1))-1];
        c{i+1} = zeros(nh(i)+1,nh(i+1));
        ajuste{i+1} = zeros(nh(i)+1,nh(i+1));
    end
    
    [n_pad, n_io] = size(padroes);
    J = [];
    for z = 1:1:epocas
        padroes = padroes(randperm(n_pad),:);
        erro_quad = 0;
        for p = 1:1:n_pad
            entrada = padroes(p,1:(ni-1));
            desejado = padroes(p,ni:n_io);
            
            xi(1:ni-1) = entrada(1:ni-1);
            
            v = ((xi')*w{1})';

            for i=1:1:(final-1)
                a{i}(1:nh(i)) = tanh(v);
                v = ((a{i}')*w{i+1})';
            end

            a{final} = tanh(v);
            
            erro = desejado - a{final};
            
            delta{final} = dtanh(a{final}).*erro;

            for i = final:-1:2
                ajuste{i} = w{i} + eta*((delta{i}*a{i-1}')') + alpha*c{i};
                c{i} = w{i};
                w{i} = ajuste{i};
                somatorio = (delta{i}'*(w{i}(1:nh(i)))')';
                delta{i-1} = dtanh(a{i-1}(1:nh(i-1))).*somatorio;
            end

            ajuste{1} = w{1} + eta*((delta{1}*xi')') + alpha*c{1};
            c{1} = w{1};
            w{1} = ajuste{1};

            E = 0.5*(erro'*erro);
            
            erro_quad = erro_quad + E;
        end
        J = [J; erro_quad];
    end
    wOut = w;
    plot(1:1:epocas,J);
end

function dy = dtanh(y)
    dy = (1-(y.^2));
end