%Author : Omkar Damle
%Date : 1st April 2017

%Plotting null clines for spruce budworm problem

clear all;
close all;
clc;

constant = 16e6;
B = 1.6e6;            %Budworm population
x = 0:1e-3:1;
y1 = B./(constant*x.*(1-x));
y2 = x;

figure;
plot(x,y1,x,y2);
xlabel('Energy(E'') of forest');
ylabel('Size(S'') of forest');
ylim([0,1]);
str = sprintf('Value of B = %0.5g larvae/acre',B);
title({'Null clines for the energy(E'') and size(S'')';str});
legend('energy nullcline','size nullcline','Location','BestOutside');
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('nc1','-dpng')

B = 2.37e6;            %Budworm population
y1 = B./(constant*x.*(1-x));

figure;
plot(x,y1,x,y2);
xlabel('Energy(E'') of forest');
ylabel('Size(S'') of forest');
ylim([0,1]);
str = sprintf('Value of B = %0.5g larvae/acre',B);
title({'Null clines for the energy(E'') and size(S'')';str});
legend('energy nullcline','size nullcline','Location','BestOutside');
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('nc2','-dpng')

B = 3e6;            %Budworm population
y1 = B./(constant*x.*(1-x));

figure;
plot(x,y1,x,y2);
xlabel('Energy(E'') of forest');
ylabel('Size(S'') of forest');
ylim([0,1]);
str = sprintf('Value of B = %0.5g larvae/acre',B);
title({'Null clines for the energy(E'') and size(S'')';str});
legend('energy nullcline','size nullcline','Location','BestOutside');
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('nc3','-dpng')

