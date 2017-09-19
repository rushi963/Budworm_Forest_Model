% Author: Rajdeep Pinge
% Date: 1st April, 2017

% code to find fixed points and their nature for the forest behaviour in budworm forest
% model

clear;
close all;

B = 2.2e6;            %Budworm population
re = 0.92;                 %growth rate of energy
Ks = 25440;             %maximum branch density
Ke = 1;                 %maximum energy level
P = 0.00195  ;           %consumption rate of energy/larvae    


y = -1:0.01:1;          % range of y values

fp_graph = y.^3 - y.^2 + B*P/(re*Ke*Ks);    

% plot 
plot(y, fp_graph, y, zeros(length(y),1), 'LineWidth', 2)
title('To find Fixed points of the system')
xlabel('y values')
ylabel('y'' values')
legend('graph of y''', 'y'' = 0')
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('nc1','-dpng')

%fp_graph(abs(fp_graph) <= 3e-3) = 0;

% fixed points for from graph
fp1 = [y(73) y(73)];        % neglect as it is negative
fp2 = [0.67 0.67];
fp3 = [y(188) y(188)];

% define some more constants
rs = 0.15;              %intrinsic branch growth rate
re_prime = re*Ks*Ke/P;  
rs_prime = rs*Ks*Ke/P;

% plot tau and delta as got from jacobian for above fixed points to find
% their nature

tau2 = - rs_prime + re_prime - 2 * re_prime * fp2(2)
delta2 = re_prime * rs_prime * (-1-2*fp2(2)+4*fp2(1)) - B*rs_prime/(fp2(2)*fp2(2))
% delta2 < 0 means fp2 is saddle node

disp(['delta2 = ' num2str(delta2) ' < 0 means (' num2str(fp2(1)) ',' num2str(fp2(2)) ') is a saddle node']) 



tau3 = - rs_prime + re_prime - 2 * re_prime * fp3(2)
delta3 = re_prime * rs_prime * (-1-2*fp3(2)+4*fp3(1)) - B*rs_prime/(fp3(2)*fp3(2))

tau3 * tau3 - 4 * delta3
% The above value is > 0 while tau3 < 0. This means that the point is a
% stable node

disp(['tau3^2 - 4*delta3 = ' num2str(tau3 * tau3 - 4 * delta3) ' > 0 and tau3 = ' num2str(tau3) ' < 0 means (' num2str(fp3(1)) ',' num2str(fp3(2)) ') is a stable node']) 
