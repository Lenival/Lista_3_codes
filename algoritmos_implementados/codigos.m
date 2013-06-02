%% Teste do BP_MLP.m
clear

rede = BP_MLP(2,[4 1],'tgh')

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

rede.treinar(entradas,100,0.2,0.5)

%% Teste do BP.m
clear

entradas = [1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1; 1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1; 1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1; 1 1 -1; -1 -1 -1; -1 1 1; 1 -1 1]

[w e] = BP(2, [4 1], 'tgh', entradas, 100, 0.2, 0.5);

%% Teste do backpropagation.m
clear

x = [1 1; -1 -1; -1 1; 1 -1];
d = [-1; -1; 1; 1];
arq = [4 1];
eta = 0.4;
alpha = 0.01;

[w e] = backpropagation(x, d, arq, eta, alpha);

%% Teste do EKF

n = 3;                  % Numero de estados
dp = 0.1;               % Desvio padrao do processo
r = 0.1;                % Desvio padrao da medida
Q = dp^2*eye(n);        % Covariancia do processo
R = r^2;                % Covariancia da medida
f = @(x)[x(2);x(3);0.05*x(1)*(x(2)+x(3))];  % Equacoes de estados nao lineares
h = @(x)x(1);                               % Equacoes de medidas
s = [0;0;1];                                % Estado inicial
x = s + dp*randn(3,1);                      % Estado inicial com ruido
P = eye(n);                                 % Estado inicial de covariancia
N = 20;                                     % Numero total de passos
xV = zeros(n,N);                            % Estado estimado
sV = zeros(n,N);                            % Estado atual
zV = zeros(1,N);
for k=1:N
  z = h(s) + r*randn;                       % Medidas
  sV(:,k)= s;                               % Estado atual armazenado
  zV(k)  = z;                               % Medida armazenada
  [x, P] = ekf(f,x,P,h,z,Q,R);              % EKF
  xV(:,k) = x;                              % Estimacao armazenada
  s = f(s) + dp*randn(3,1);                 % Processo atualizado
end
for k=1:3                                   % Plotando resultados
  subplot(3,1,k)
  plot(1:N, sV(k,:), '-', 1:N, xV(k,:), '--')
end

%% Teste do algoritmo competitivo
clear
close all
c1 = (rand(2,10)*.2)+repmat([-1;0.5],1,10);
c2 = (rand(2,10)*.2)+repmat([0.5;1],1,10);
a1 = [c1 c2];
c3 = (rand(2,10)*1)+repmat([-1;0.5],1,10);
c4 = (rand(2,10)*1)+repmat([0.5;1],1,10);
a2 = [c4 c3];
%plot (a(1,:),a(2,:),'*')
%grid on

redet = ALG_COMPET(2,20,2);
redet.nor(a1)
figure
[md w] = redet.trei(0.1,100);
figure
wv = redet.valid(a2, w);

