function [ C ] = center_select( data, k )
% data --> data sample
% k --> number of centers
C = data(randi(1000),:);
for i=2:k
    dist_s_C = min(pdist2(data, C), [], 2);
    [~, s_index] = max(dist_s_C);
    s = data(s_index, :);
    C = [C; s];
    data(s_index,:) = [];
end

end

