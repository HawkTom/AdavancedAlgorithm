clear;clc
file = 1;
if file == 0
    mu1=[0 0 ];  %均值
    S1=[.1 0 ;0 .1];  %协方差
    data1=mvnrnd(mu1,S1,100);   %产生高斯分布数据
    %第二组数据
    mu2=[1.25 1.25 ];
    S2=[.1 0 ;0 .1];
    data2=mvnrnd(mu2,S2,100);
    % 第三组数据
    mu3=[-1.25 1.25 ];
    S3=[.1 0 ;0 .1];
    data3=mvnrnd(mu3,S3,100);
    
    data = [data1;data2;data3]';
    plot(data(1,:), data(2,:),'.','Color','b')
    hold on
else
    load('iris.mat')
end




type = 3;  % number of clusters
iter = 1 ;  % iterations 
result = [];
for i=1:100
    [center, dis, c1] = K_means(data, type, iter,'self');
    % error = zeros(1,2);
    % for i=1:3
    %     temp = c1{i}(5,:);
    %     table = tabulate(temp);
    %     error(1) = length(c1{i}) - max(table(:,2)) + error(1);
    % end
    result(1,i) = dis;
    [center1, dis, c2] = K_means(data, type, iter,'rand');
    % for i=1:3
    %     temp = c2{i}(5,:);
    %     table = tabulate(temp);
    %     error(2) = length(c1{i}) - max(table(:,2)) + error(2);
    % end
    result(2,i) = dis;
    % error
end
 x = sort(result(2,:));
if file == 0
    plot(center(1,:),center(2,:),'.', 'MarkerSize',20, 'Color', 'r')
    plot(center1(1,:),center1(2,:),'.', 'MarkerSize',20, 'Color', 'k')
    hold off
end