function [ center ] = K_means( data, type, iter )
% c  ---> data sample
% type ---> time of clusters
% iter --> time of iteration 
dSum=Inf;
stop = 1;
for i = 1:iter
    center_point_old = data(:,randi(length(data),[1,type]));
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
end

