classdef ALG_COMPET < handle
    properties
        xi % matriz de amostras de treinamento
        xin % vetor de entrada do k-ésimo padrão
        %xnk % vetro normalizado de entrada do k-ésimo padrão
        w % matriz do pesos 
        wn % vetro normalizado de pesos
        eta % taxa de aprendizagem
        lx % nº de linhas das matizes de pesos e de treinamento (nº de entrdadas)
        cx % nº de colunas da matriz de amostras de treinamneto (nº de amostras)
        cw % nº de colunas da matriz de pesos (nº de neurônios)
    end
    methods
        function obj = ALG_COMPET(n_ent,n_amost, n_class)
            % inicialização da matriz de pesos e de amostaras
            obj.xi = ones(n_ent+1, n_amost);% O +1 é para o bias
            obj.w = rand(n_ent+1,n_class);   
            obj.lx = size(obj.xi,1);% nº de entradas
            obj.cx = size(obj.xi,2);% nº de amostras
            obj.cw = size(obj.w,2);% nº de neurônios
        end
        function nor(obj,entrada)
            obj.xi(2:obj.lx,:) = entrada;
            % Normalização dos vetores de pesos e de treinamento
            for xc = 1:obj.cx
                obj.xin(:,xc) = obj.xi(:,xc)/norm(obj.xi(:,xc));
            end
            for wc = 1:obj.cw
                obj.wn(:,wc) = obj.w(:,wc)/norm(obj.w(:,wc));
            end
        end
        function trei(obj,txap)
            obj.eta = txap; %Taxa de aprendizagem
            a=0;
            dist = [];
            mdist = [];
            ind = 0;
            epoca = 1;
            while a==0
                a=1;
                
                for k = 1:obj.cx
                    
                    for j = 1:obj.cw
                        somatxw = 0;
                        for i = 1:obj.lx
                            somatxw = somatxw + (obj.xi(i,k)-obj.w(i,j))^2;
                        end
                        dist(j) = sqrt(somatxw);
                    end
                    [mdist(k,epoca) ind] = min(dist);
                    obj.w(:,ind) = obj.w(:,ind)+ obj.eta*(obj.xi(:,k)-obj.w(:,ind));
                end
                
%                 if cond
%                 a=0;
%                 end
                if epoca == 100
                    a=0;
                end
                epoca=epoca+1;
            end
            
        end
    end
    
end