
%Author : Omkar Damle
%Date : 1st April 2017

%Plotting phase potrait for spruce budworm problem

clear;
close all;
clc;


B = 1.6e6;            %Budworm population
re = 0.92;                 %growth rate of energy
Ks = 25440;             %maximum branch density
Ke = 1;                 %maximum energy level
P = 0.00195  ;           %consumption rate of energy/larvae    
rs = 0.095;              %intrinsic branch growth rate
re_prime = re*Ks*Ke/P;  
rs_prime = rs*Ks*Ke/P;

constant = Ks*Ke/P;

[x,y] = meshgrid(0.1:0.05:1,0.1:0.05:1);
u = re_prime*x.*(1-x) - B./y;
v = rs_prime.*y.*(1-(y./x));
quiver(x,y,u,v,'AutoScale','on','AutoScaleFactor',1);

vector = 0.1:0.02:1;
startx = vector;
startx = [startx,ones(size(vector))];
starty = ones(size(vector));
starty = [starty,vector];

streamline(x,y,u,v,startx,starty)
xlabel('Energy(E'') of forest');
ylabel('Size(S'') of forest');
ylim([0,1.1]);
str = sprintf('Value of B = %0.5g larvae/acre',B);
title({'Phase potrait for the energy(E'') and size(S'')';str});
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('p1','-dpng')


B = 2.37e6;            %Budworm population
u = re_prime*x.*(1-x) - B./y;
v = rs_prime.*y.*(1-(y./x));
figure;
quiver(x,y,u,v,'AutoScale','on','AutoScaleFactor',1);
streamline(x,y,u,v,startx,starty)
xlabel('Energy(E'') of forest');
ylabel('Size(S'') of forest');
ylim([0,1.1]);
str = sprintf('Value of B = %0.5g larvae/acre',B);
title({'Phase potrait for the energy(E'') and size(S'')';str});
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('p2','-dpng')



B = 3e6;            %Budworm population
u = re_prime*x.*(1-x) - B./y;
v = rs_prime.*y.*(1-(y./x));
figure;
quiver(x,y,u,v,'AutoScale','on','AutoScaleFactor',1);
streamline(x,y,u,v,startx,starty)
xlabel('Energy(E'') of forest');
ylabel('Size(S'') of forest');
ylim([0,1.1]);
str = sprintf('Value of B = %0.5g larvae/acre',B);
title({'Phase potrait for the energy(E'') and size(S'')';str});
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('p3','-dpng')