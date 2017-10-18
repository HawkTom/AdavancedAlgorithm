data = [mvnrnd([2 -2], [2 1.5; 1.5, 2], 500); mvnrnd([-2 2], [2 1.5; 1.5, 2], 500)];
plot(data(:, 1), data(:, 2), '.'); hold on;
k = 6; % number of centers
C = center_select(data, k);
plot(C(:,1),C(:,2), '.','MarkerSize',20,'Color','r')
hold off
