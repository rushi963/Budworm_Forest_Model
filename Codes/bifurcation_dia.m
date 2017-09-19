% Author - Rajdeep Pinge
% Date - 5th April, 2017

clear;
close all;


B = 1e6:1e2:4e6;              %Budworm population
re = 1;                 %growth rate of energy
Ks = 24000;             %maximum branch density
Ke = 1;                 %maximum energy level
P = 0.0015  ;           %consumption rate of energy/larvae 

y = -1:0.01:1;          % range of y values

fp_graph = zeros(numel(B), numel(y));

fp_loc = -100*ones(numel(B), numel(y));

for i = 1:numel(B)
    fp_graph(i,:) = y.^3 - y.^2 + B(i)*P/(re*Ke*Ks);  
    
    count = 1;
    
    for j = 1:numel(y)
       
       if abs(fp_graph(i, j)) < 5e-3
            fp_loc(i, count) = j;
            count = count + 1;
       end
    end
end

fp1 = -100*ones(numel(B), 1);
fp2 = -100*ones(numel(B), 1);
fp3 = -100*ones(numel(B), 1);

for i = 1:numel(B)
    j = 1;
    while fp_loc(i, j) ~= -100
        % there will always be at least 1 fixed point
        
        if j==1
            fp1(i) = y(fp_loc(i, j));
        elseif abs(fp_loc(i, j) - fp_loc(i, j-1)) > 4
            if fp2(i) == -100
                fp2(i) = y(fp_loc(i, j));
            else
                fp3(i) = y(fp_loc(i, j));
            end
        end
        
        j = j + 1; 
    end
end

fp2 = fp2((fp2~=-100));
fp3 = fp3((fp3~=-100));

delete_pts = randi(numel(fp2), numel(fp2) - numel(fp3) +99, 1);

for pos = 1:numel(delete_pts)
    fp2(delete_pts(pos)) = -100;
end

fp2 = fp2((fp2~=-100));

steps = zeros(1, numel(fp2));

for i = 1:numel(fp2)
    steps(i) = B(i);
end

plot(steps, fp2, 'b')
hold on
plot(steps, fp3, 'b')
title('Bifurcation Diagram')
xlabel('Budworm Population (B larvae/acre)')
ylabel('S* = E*, value of 1 dimension of fixed point')
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
