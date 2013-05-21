classdef ALG_COMPET < handle
    properties
        xi % matriz de amostras de treinamento
        xin % vetor de entrada do k-ésimo padrão
        %xnk % vetro normalizado de entrada do k-ésimo padrão
        w % matriz do pesos 
        wn % vetro normalizado de pesos
        eta % taxa de aprendizagem
        lx % nº de linhas das matizes de pesos e de treinamento (nº entrdadas) 
    end
    methods
        function obj = ALG_COMPET(n_ent,n_amost, n_class)
            % inicialização da matriz de pesos e de amostaras
            obj.xi = ones(n_ent+1, n_amost);% O +1 é para o bias
            obj.w = rand(n_ent+1,n_class);        
        end
        function nor(obj,entrada,txap)
            obj.eta = txap; %Taxa de aprendizagem
            obj.lx = size(obj.xi,1);% nº de entradas
            cx = size(obj.xi,2);% º de amostras
            obj.xi(2:obj.lx,:) = entrada;
            % Normalização dos vetores de pesos e de treinamento
            for xc = 1:cx
                obj.xin(:,xc) = obj.xi(:,xc)/norm(obj.xi(:,xc));
            end
            cw=size(obj.w,2);% nº de neurônios
            for wc = 1:cw
                obj.wn(:,wc) = obj.w(:,wc)/norm(obj.w(:,wc));
            end
        end
        function trei(obj,)
            a=0;
            while a==0
                a=1;
                for s = 1:lx
                
                if cond
                a=1;
                end
                if epoca ==100
                    a=0;
                end
                epoca=epoca+1;
            end
            
        end
    end
    
end