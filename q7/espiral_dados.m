
clear;
theta = linspace(0,20,51);

% """"Construçao das esppirais a partir do parâmetro theta"""
% """Eequaçao 1"""
x1 = (theta/4).*cos(theta);
y1 = (theta/4).*sin(theta);

%"""Equacao 2"""
x2 = (0.8+theta/4).*cos(theta);
y2 = (0.8+theta/4).*sin(theta);


%"""Gerando um conjuto de respostas desejadas para cada espiral"""
a = [x1 ; y1 ; ones(1,51)]; % Espiral 1 [1,-1]
b = [x2 ; y2 ; -ones(1,51)]; % Espiral 2 [-1,1]
ab = [a' ; b'];

%"""Plotando os dados para observar as entradas"""
%plot(ab(1:51,1),ab(1:51,2),'r')
%hold on
%plot(ab(51:102,1),ab(51:102,2),'g')

% % """Instanciando a rede"""
n = BP_MLP(2, [10,10,1],'tgh');
% 
% % """Executando os treinos"""
n.treinar(ab,30000,0.09,0.2);
% 
% """Gerando um quadrado de lado 10 centrado em (0,0)"""
[M,N] = meshgrid(-5:0.1:5,-5:0.1:5);
M_L = reshape(M,size(M,1)*size(M,2),1);
N_L = reshape(N,size(N,1)*size(N,2),1);

mn = [M_L N_L];
% """Plotando as respostas da rede treinada"""
saida = testar(n,mn);
figure;
for r = 1:1:length(mn)
     if(saida(r,1)>0)
%         """Pontos da espiral 1 serão plotados azuis"""
        plot(mn(r,1),mn(r,2),'y')
     else
%         """Pontos da espiral 2 serão plotados amarelos"""
        plot(mn(r,1),mn(r,2),'b')
     end
     hold on
end


