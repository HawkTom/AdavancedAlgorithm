clear;clc
mu1=[0 0];  %均值
S1=[.1 0 ;0 .1];  %协方差
data1=mvnrnd(mu1,S1,200)';   %产生高斯分布数据
plot(data1(1,:), data1(2,:),'.','Color','r'); hold on
%第二组数据
mu2=[0.25 0.25 ];
S2=[.1 0 ;0 .1];
data2=mvnrnd(mu2,S2,200)';
plot(data2(1,:), data2(2,:),'.','Color','g'); hold on
% 第三组数据
mu3=[0.75 0.75 ];
S3=[.1 0 ;0 .1];
data3=mvnrnd(mu3,S3,200)';
plot(data3(1,:), data3(2,:),'.','Color','b'); hold on

data = [data1 data2 data3];

center = mean(data,2);
dis = pdist2(data',center');
[~, index] = sort(dis);
data = data(:,index);
x(:,1) = mean(data(:,1:3:end), 2);
temp = data(:,1:3:end);
x(:,2) = mean(data(:,2:3:end), 2);
x(:,3) = mean(data(:,3:3:end), 2);

type = 3;
iter = 1;
dSum=Inf;
stop = 1;
for i = 1:iter
%     center_point_old = data(:,randi(length(data),[1,type]));
    center_point_old = x;
    while stop >= 0.001
        cluster = cell([1,type]);
        dis = pdist2(data', center_point_old');
        [~,index] = min(dis, [], 2);
        for j=1:length(data)
            cluster{index(j)} = [cluster{index(j)}, data(:,j)];
        end
        for j=1:type
            if ~isempty(cluster{j})
                center_point_new(:,j) = mean(cluster{j},2);
            else
                center_point_new(:,j) = center_point_old(:,j);
            end
        end
        stop = sum(sqrt(sum((center_point_new-center_point_old).^2)));
        center_point_old = center_point_new;
    end
    t = sum(min(pdist2(data', center_point_old'), [], 2));
    if dSum > t
        center = center_point_old;
        dSum = t;
    end
end

plot(center_point_old(1,:),center_point_old(2,:), '.', 'MarkerSize',20, 'Color', 'k');

hold off