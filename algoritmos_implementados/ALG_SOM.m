classdef ALG_SOM < handle
    properties
        xi % matriz de amostras de treinamento
        xin % vetor de entrada do k-�simo padr�o
        mn % Matriz do mapa de neur�nios
        w % matriz do pesos 
        wn % vetro normalizado de pesos
        eta % taxa de aprendizagem
        gau % Fun��o de vizinhan�a lateral dos neur�nios no espa�o de sa�da
        lx % n� de linhas das matizes de pesos e de treinamento (n� de entrdadas)
        cx % n� de colunas da matriz de amostras de treinamneto (n� de amostras)
        cw % n� de colunas da matriz de pesos (n� de neur�nios)
    end
    methods
        function obj = ALG_SOM(n_ent,n_amost, n_neu,l_mn,c_mn)
            % inicializa��o da matriz de pesos e de amostaras
            obj.xi = -1*ones(n_ent+1, n_amost);% O +1 � para o bias -1
            obj.w = rand(n_ent+1,n_neu); 
%             nw = ceil(0.2*n_amost);
%             sxi = 0;
%             for j = 1:n_neu
%                 for i = 1:n_ent
%                     for k = 1:nw
%                         sxi = sxi + obj.xi(i,k);
%                     end
%                     obj.w(i,j) = (sxi/nw)*5*j;
%                 end
%             end
            obj.lx = n_ent+1;% n� de entradas
            obj.cx = n_amost;% n� de amostras
            obj.cw = n_neu;% n� de neur�nios
            obj.mn = cell(l_mn,c_mn);
        end
        
        function nors(obj,entradat,r_mn)
            obj.xi(2:obj.lx,:) = entradat;
            % Normaliza��o dos vetores de pesos e de treinamento
             for xc = 1:obj.cx
                 obj.xin(:,xc) = obj.xi(:,xc)/norm(obj.xi(:,xc));
             end
             for wc = 1:obj.cw
                 obj.wn(:,wc) = obj.w(:,wc)/norm(obj.w(:,wc));
             end
             for h = 1:size(obj.mn,1)
                 for g = 1:size(obj.mn,2)
                     obj.mn{g,h}=[g*r_mn h*r_mn];
                 end
             end
            plot3(obj.wn(1,:),obj.wn(2,:),obj.wn(3,:),'*r')
            hold on
            plot3(obj.xin(1,:),obj.xin(2,:),obj.xin(3,:),'*')
            sphere            
            grid
        end
        function [mdist, W] = treis(obj,txap,nep,r_mn)
            obj.eta = txap; %Taxa de aprendizagem
            a=0;
%             dist = [];
%             mdist = [];
            ind = 0;
            epoca = 1;
            while a==0
                a=0;
                % C�lculo da dist�ncia entre a amostra atual e todos os vetores w
                for k = 1:obj.cx
                    for j = 1:obj.cw
                        somatxw = 0;
                        for i = 1:obj.lx
                            somatxw = somatxw + (obj.xin(i,k)-obj.wn(i,j))^2;
                        end
                        dist(j) = sqrt(somatxw);
                    end
                    [mdist(k,epoca), ind] = min(dist); %escolha do vetor w mais pr�ximo da amostra
                    % mapeando o w vencedor no espa�o de sa�da
                    d = ind/size(obj.mn,2);
                    pl = ceil(d);
                    pc = (d-fix(d))*size(obj.mn,2);
                    nv = obj.mn{pl,pc};
                    % C�lculo da dist�ncia da vizinhan�a e atualiza��o
                    for h = 1:size(obj.mn,1)
                        for g = 1:size(obj.mn,2)
                            distr = sqrt((nv(1,1)-obj.mn{g,h}(1,1))^2+(nv(1,2)-obj.mn{g,h}(1,2))^2);
                            obj.gau = exp(-(distr^2/2*(r_mn)^2));
                            obj.wn(:,:) = obj.wn(:,:)+ obj.eta*obj.gau*(obj.xin(:,k)-obj.wn(:,:));
                        end
                    end
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
            W = obj.wn;
        end
        function ind = valid(obj, entradav, pesost)
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
            figure
            for k = 1:obj.cx
                    for j = 1:obj.cw
                        somatxw = 0;
                        for i = 1:obj.lx
                            somatxw = somatxw + (obj.xin(i,k)-obj.wn(i,j))^2;
                        end
                        dist(j) = sqrt(somatxw);
                    end
                    [mdist ind(k)] = min(dist);
                    if ind == 1
                         plot3(obj.xin(1,k),obj.xin(2,k),obj.xin(3,k),'*k')
                    else
                        plot3(obj.xin(1,k),obj.xin(2,k),obj.xin(3,k),'*r')
                    end
                    hold on    
            end
            plot3(obj.wn(1,:),obj.wn(2,:),obj.wn(3,:),'*y')
            grid
         end
    end
    
end