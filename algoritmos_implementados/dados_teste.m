c1 = (rand(2,10)*.2)+repmat([-1;0.5],1,10);
c2 = (rand(2,10)*.2)+repmat([0.5;1],1,10);
a = [c1 c2];
plot (a(1,:),a(2,:),'*')
grid on