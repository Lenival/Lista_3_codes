classdef ALG_COMPET < handle
    properties
        xi % matriz de amostras de treinamento
        xin % vetor de entrada do k-�simo padr�o
        %xnk % vetro normalizado de entrada do k-�simo padr�o
        w % matriz do pesos 
        wn % vetro normalizado de pesos
        eta % taxa de aprendizagem
        lx % n� de linhas das matizes de pesos e de treinamento (n� de entrdadas)
        cx % n� de colunas da matriz de amostras de treinamneto (n� de amostras)
        cw % n� de colunas da matriz de pesos (n� de neur�nios)
    end
    methods
        function obj = ALG_COMPET(n_ent,n_amost, n_class)
            % inicializa��o da matriz de pesos e de amostaras
            obj.xi = ones(n_ent+1, n_amost);% O +1 � para o bias
            obj.w = rand(n_ent+1,n_class);   
            obj.lx = size(obj.xi,1);% n� de entradas
            obj.cx = size(obj.xi,2);% n� de amostras
            obj.cw = size(obj.w,2);% n� de neur�nios
        end
        function nor(obj,entrada)
            obj.xi(2:obj.lx,:) = entrada;
            % Normaliza��o dos vetores de pesos e de treinamento
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