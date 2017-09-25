function [ center_point_old ] = K_means( data, type, iter )
% c  ---> data sample
% type ---> time of clusters
% iter --> time of iteration
center_point_old = data(:,randi(length(data),[1,type]));
for i = 1:iter
    cluster = cell([1,type]);    
    dis = pdist2(data', center_point_old');
    [~,index] = min(dis, [], 2);
    for j=1:length(data)
        cluster{index(j)} = [cluster{index(j)}, data(:,j)];
    end
    for j=1:type
        if isempty(cluster{j}) == 0
            center_point_new(:,j) = mean(cluster{j},2);
        else
            center_point_new(:,j) = center_point_old(:,j);
        end
    end
    if sum(sqrt(sum((center_point_new-center_point_old).^2))) < 0.001
        break
    else
        center_point_old = center_point_new;
    end
    
end

end

