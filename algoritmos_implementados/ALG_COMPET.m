classdef ALG_COMPET < handle
    properties
        xi % matriz de amostras de treinamento
        %xk % vetor de entrada do k-ésimo padrão
        %xnk % vetro normalizado de entrada do k-ésimo padrão
        w % matriz do pesos 
        %wn % vetro normalizado de pesos
        %eta % taxa de aprendizagem
    end
    methods
        function obj = ALG_COMPET(n_ent,n_amost, n_class)
            % inicialização da matriz e entrada
            obj.xi = ones(n_ent+1, n_amost);% O +1 é para o bias
            obj.w = rand(n_ent+1,n_class);        
        end
        function nor(obj,entrada)
            lx=size(obj.xi,1);
            cx=size(obj.xi,2);
            obj.xi(2:lx,:) = entrada;
            for xc = 1:cx
                obj.xi(xc) = obj.xi(xc)/norm(obj.xi(xc));
            end
            cw=size(obj.xi,2);
            for wc = 1:cw
                obj.xi(wc) = obj.xi(wc)/norm(obj.xi(wc));
            end
        end
    end
    
end