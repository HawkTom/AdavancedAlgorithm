function [ center,distance, cluster_end ] = K_means( data, type, iter, initial_type )
% c  ---> data sample
% type ---> time of clusters
% iter --> time of iteration 

rng(sum(100*clock));
distance = [];cluster_end = {};
if strcmp(initial_type, 'rand')
    disp('Initial Way is random')
elseif strcmp(initial_type, 'self')
    disp('Initial Way is self_define')
end

for i = 1:iter
    if strcmp(initial_type, 'rand')
        center_point_old = data(:,randi(length(data),[1,type]));        
    elseif strcmp(initial_type, 'self')
        center1 = mean(data(1:end-1,:),2);
        dis = pdist2(data(1:end-1,:)',center1');
        [~, index] = sort(dis);
        data = data(:,index);
        center_point_old(:,1) = mean(data(:,1:3:end), 2);
        center_point_old(:,2) = mean(data(:,2:3:end), 2);
        center_point_old(:,3) = mean(data(:,3:3:end), 2);        
    end
    dSum=Inf;
    
    stop = 1;
    while stop >= 0.001
        cluster = cell([1,type]);
        dis = pdist2(data(1:end-1,:)', center_point_old(1:end-1,:)');
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
        stop = sum(sqrt(sum((center_point_new(1:end-1,:)-center_point_old(1:end-1,:)).^2)));
        center_point_old = center_point_new;
    end
    t = sum(min(pdist2(data(1:end-1,:)', center_point_old(1:end-1,:)'), [], 2));
    if dSum > t
        center = center_point_old;
        dSum = t;
        cluster_end = cluster;
    end
    distance = [distance dSum];
end
end

