classdef BP_MLP
    properties
        
        ni
        nh
        f_saida
        E = 0
        final
        % Vetores de entrada e ativação
        xi
        a
        
        % Vetores de erro e gradientes locais
        delta
        erro
        
        % Matrizes de pesos, ajustes e momento
        w
        ajuste
        c
        
    end
    
    methods (Access = private)
        function dy = dtanh(obj,y)
            dy = (1-(y.^2));
        end
    end
    
    methods
        function self = BP_MLP(entradas, arquitetura, saida)
            % Inicialização dos parâmetros da rede
            self.ni = entradas + 1;
            self.nh = arquitetura;
            self.f_saida = saida;
            self.final = length(self.nh);
            
            % Inicialização dos principais sinais
            self.xi = ones(self.ni,1);
            self.a = {};
            self.delta = {};
            
            for i = 1:1:self.final-1
                %Os +1 estão sendo colocados para usar como bias
                self.a{i} = ones(self.nh(i)+1,1);
                self.delta{i} = ones(self.nh(i)+1,1);
            end
            
            self.a{self.final} = ones(self.nh(self.final),1);
            self.delta{self.final} = zeros(self.nh(self.final),1);
            
            % Vetor que conterá o erro da última camada
            self.erro = zeros(self.nh(self.final),1);
            
            % Inicialização de pesos sinápticos e mudança anterior
            % nos pesos para o momento
        
            self.w = {};
            self.c = {};
            self.ajuste = {};
        
            self.w{1} = rand(self.ni, self.nh(1));
            self.c{1} = zeros(self.ni, self.nh(1));
            self.ajuste{1} = zeros(self.ni, self.nh(1));

            for i = 1:1:self.final-1
                self.w{i+1} = rand(self.nh(i)+1,self.nh(i+1));
                self.c{i+1} = zeros(self.nh(i)+1,self.nh(i+1));
                self.ajuste{i+1} = zeros(self.nh(i)+1,self.nh(i+1));
            end
        end
        
            function saida = atualizar(obj,entradas)
                % Verificando a quantidade de entradas
                try
                    obj.xi(1:obj.ni-1) = entradas;
                catch e
                    throw(e);
                end
                % Ativação da primeira camada
                v = ((obj.xi')*obj.w{1})';
                
                % Ativação das camadas ocultas
                for i=1:1:(obj.final-1)
                    obj.a{i}(1:obj.nh(i)) = tanh(v);
                    v = ((obj.a{i}')*obj.w{i+1})';
                end
                
                % Ativa da camada de saída
                obj.a{obj.final} = tanh(v);
                
                saida = obj.a{obj.final};
            end
            
            function erro_quad = backpropagation(obj, desejado, eta, alpha)
                % Verificando a quantidade de saidas
                try
                    obj.erro = desejado - obj.a{obj.final};
                catch e
                    throw(e);
                end
                
                obj.delta{obj.final} = obj.dtanh(obj.a{obj.final}).*obj.erro;
                
                for i = obj.final:-1:2
                    obj.ajuste{i} = eta*((obj.delta{i}*obj.a{i-1}')') + alpha*obj.c{i};
                    obj.w{i} = obj.w{i} + obj.ajuste{i};
                    obj.c{i} = obj.ajuste{i};
                    somatorio = (obj.delta{i}'*(obj.w{i}(1:obj.nh(i)))')';
                    obj.delta{i-1} = obj.dtanh(obj.a{i-1}(1:obj.nh(i-1))).*somatorio;
                end
                
                % Fazendo correções nas sinapses da camada de entrada
                obj.ajuste{1} = eta*((obj.delta{1}*obj.xi')') + alpha*obj.c{1};
                obj.w{1} = obj.w{1} + obj.ajuste{1};
                obj.c{1} = obj.ajuste{1};
                
                obj.E = 0.5*(obj.erro'*obj.erro);
                
                erro_quad = obj.E;
            end
        end
    
    
end
