function [vertex_set_indices, prices] = vertex_cover_approx(graph_mat, w)
% *********************************************************************** %
% Vertex Cover Approximation Algorithm (Pricing Method).
% -------
% INPUT :
% -------
%   graph_mat : matrix(edge_num, 2), Integer :: each row denotes an edge
%       e.g., [1 2; 2 3; 3 4; 4 1; 2 4]
%             [1,2,3,4,5]
%   w : matrix(1, node_num), Double :: node w
%       e.g., [3 4 3 5]
% -------
% OUTPUT:
% -------
%   vertex_set_indices : matrix(1, ?), Integer :: vertex set indices generated sequentially
%       e.g., [1 2 3]
%   prices : matrix(1, ?), Double :: prices generated sequentially
%       e.g., [3 1 2]
% *********************************************************************** %
vertex_set_indices = [];
prices = [];
% index = randperm(length(graph_mat))   % change the order of edge 
% graph_mat = graph_mat(index,:);
temp_w = w;
for i=1:length(graph_mat)
    edge = graph_mat(i,:);
    left = edge(1);
    right = edge(2);
    if temp_w(left) > 0 && temp_w(right) > 0 
        vertex_set_indices = [vertex_set_indices, i]; 
        price = min(temp_w(left), temp_w(right));
        prices = [prices, price];
        temp_w(left) = temp_w(left) -  price;
        temp_w(right) = temp_w(right) - price;
    end
end
sum_of_weight = sum(w(temp_w == 0));
disp(['sum of weight: ', num2str(sum_of_weight)])
end
