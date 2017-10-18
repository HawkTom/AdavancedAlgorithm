clear;clc
data = [mvnrnd([2 -2], [2 1.5; 1.5, 2], 500); mvnrnd([-2 2], [2 1.5; 1.5, 2], 500)];
plot(data(:, 1), data(:, 2), '.'); hold on;
C = center_select(data,6);
plot(C(:,1),C(:,2), '.','Color','r','MarkerSize',20)
hold off
