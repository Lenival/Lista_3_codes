%% Teste do algoritmo competitivo
clear
close
c1 = (rand(2,10)*.2)+repmat([-1;0.5],1,10);
c2 = (rand(2,10)*.2)+repmat([0.5;1],1,10);
a1 = [c1 c2];
c3 = (rand(2,10)*.8)+repmat([-1;0.5],1,10);
c4 = (rand(2,10)*.8)+repmat([0.5;1],1,10);
a2 = [c4 c3];
%plot (a(1,:),a(2,:),'*')
%grid on

redet = ALG_COMPET(2,20,2);
redet.nor(a1)
figure
[md w] = redet.trei(0.1,100);
figure
redet.valid(a2, w);

%% Teste do algoritmo SOM
