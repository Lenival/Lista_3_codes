classdef RBF < handle
    properties
        x % Entradas
        w % Pesos sinapticos
        nh % Numero de neuronios na camada oculta
        ni % Numero de entradas
        no % Numero de saidas
        
    end
    
    methods 
        function self = RBF(numEntradas, numNeuronios, numSaidas)
            self.ni = numEntradas;
            self.no = numSaidas;
            self.nh = numNeuronios;
            
            self.w = rand(senf.ni+1,self.nh);
        end
        
        % x - padroes, c - centros, numEpocas - numero maximo de epocas,
        % eta - eta
        function treinar(obj, x, c, numEpocas, eta)
            np = size(x,1);
            nc = size(c,1);
            
            
        end
        
        
    end
end