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
        function nor(obj,entradat)
            obj.xi(2:obj.lx,:) = entradat;
            % Normaliza��o dos vetores de pesos e de treinamento
            for xc = 1:obj.cx
                obj.xin(:,xc) = obj.xi(:,xc)/norm(obj.xi(:,xc));
            end
            for wc = 1:obj.cw
                obj.wn(:,wc) = obj.w(:,wc)/norm(obj.w(:,wc));
            end
            plot3(obj.wn(1,:),obj.wn(2,:),obj.wn(3,:),'*r')
            hold on
            plot3(obj.xin(1,:),obj.xin(2,:),obj.xin(3,:),'*')
            grid
        end
        function mdist = trei(obj,txap,nep)
            obj.eta = txap; %Taxa de aprendizagem
            a=0;
            dist = [];
            mdist = [];
            ind = 0;
            epoca = 1;
            while a==0
                a=0;
                
                for k = 1:obj.cx
                    for j = 1:obj.cw
                        somatxw = 0;
                        for i = 1:obj.lx
                            somatxw = somatxw + (obj.xin(i,k)-obj.wn(i,j))^2;
                        end
                        dist(j) = sqrt(somatxw);
                    end
                    [mdist(k,epoca) ind] = min(dist);
                    obj.wn(:,ind) = obj.wn(:,ind)+ obj.eta*(obj.xin(:,k)-obj.wn(:,ind));
                end
                if epoca == nep
                    a=1;
                end
                epoca=epoca+1;
            end
            plot3(obj.wn(1,:),obj.wn(2,:),obj.wn(3,:),'*r')
            hold on
            plot3(obj.xin(1,:),obj.xin(2,:),obj.xin(3,:),'*')
            grid
        end
        function valid(obj,entradav, pesost)
            obj.xi(2:obj.lx,:) = entradav;
            % Normaliza��o dos vetores de pesos e de treinamento
            for xc = 1:obj.cx
                obj.xin(:,xc) = obj.xi(:,xc)/norm(obj.xi(:,xc));
            end
            obj.wn = pesost;
            plot3(obj.wn(1,:),obj.wn(2,:),obj.wn(3,:),'*r')
            hold on
            plot3(obj.xin(1,:),obj.xin(2,:),obj.xin(3,:),'*')
            grid
            for k = 1:obj.cx
                    for j = 1:obj.cw
                        somatxw = 0;
                        for i = 1:obj.lx
                            somatxw = somatxw + (obj.xin(i,k)-obj.wn(i,j))^2;
                        end
                        dist(j) = sqrt(somatxw);
                    end
                    [mdist ind] = min(dist);
                    obj.xin(:,k) = obj.wn(:,ind); 
            end
            figure
            plot3(obj.wn(1,:),obj.wn(2,:),obj.wn(3,:),'*r')
            hold on
            plot3(obj.xin(1,:),obj.xin(2,:),obj.xin(3,:),'*')
            grid
        end
    end
    
end