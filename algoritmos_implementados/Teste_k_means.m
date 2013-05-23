clear;
pontos = 500;                         % Número de pontos por classe
n_classes = 4;
X = 2*rand(pontos,2)+ ones(pontos,2);                       % Classe 1
X = [2*rand(pontos,2)+3*ones(pontos,2);X];                  % Classe 2
X = [2*rand(pontos,2)+[zeros(pontos,1) 3*ones(pontos,1)] ; X];      % Classe 3
X = [2*rand(pontos,2)+[3*ones(pontos,1) zeros(pontos,1)] ; X];      % Classe 4

figure;
scatter(X(:,1),X(:,2));
% Pegando pontos com o mouse
[x0,y0] = ginput(n_classes);
%points = [3 3; 3 4; 4 3; 4 4];
[classe,centro] = kmeans(X,n_classes,'start',[x0 y0]);
close;

figure;

scatter(X(classe==1,1),X(classe==1,2),'r');
hold on;
scatter(X(classe==2,1),X(classe==2,2),'g');
hold on;
scatter(X(classe==3,1),X(classe==3,2),'y');
hold on;
scatter(X(classe==4,1),X(classe==4,2),'p');
hold on;
scatter(centro(:,1),centro(:,2),'b');
