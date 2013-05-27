%% Questao 2
%% a)
clear

% Gerando dados
x1 = [0 1 0 1 0 1 0 1];
x2 = [0 0 1 1 0 0 1 1];
x3 = [0 0 0 0 1 1 1 1];
x = [x1; x2; x3];

f = xor(xor(x1,x2),x3);
padroes = [x; f]';
padroes = repmat(padroes,5,1);
ni = size(padroes,1);
padroes = padroes(randperm(ni),:);

% Treinando rede
net = newrbe(padroes(:,1:3)',padroes(:,4)');
%view(net)
% Simulando rede
y = sim(net,padroes(:,1:3)')';

%% b)
clear

x1 = -10:0.1:10;
x2 = -10:0.1:10;
x = zeros(1,length(x1));
for i=1:201
    x(i) = norm([x1(:,i) x2(:,i)]);
end

f = sin(x.*pi)./(x.*pi);

padroes = [x; f]';

net = newrbe(padroes(:,1)',padroes(:,2)');
y = sim(net,padroes(:,1)')';

%% c)
clear

x1 = -10:0.1:10;
x2 = -10:0.1:10;
x = [x1; x2];

f = x1.^2 + x2.^2 - 2.*x1.*x2 + x1 + x2 - 1;

padroes = [x; f]';

net = newrbe(padroes(:,1:2)',padroes(:,3)');

y = sim(net,padroes(:,1:2)')';