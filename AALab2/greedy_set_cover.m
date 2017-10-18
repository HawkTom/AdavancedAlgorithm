function [cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets)
% *********************************************************************** %
% Greedy Algorithm for the Set Cover Problem.
% -------
% INPUT :
% -------
%   elems : matrix(1, ?), Integer :: each number denotes an element
%       e.g., 1 : 8
%   sets : cell(cell(1, 3)) :: all sets
%       {set_id : Integer, set_weight : Double, set_elements : Matrix(1, ?)}
%       e.g., {{1, 1, 1}, {2, 1, 2}, {3, 1, [3 4]}, {4, 1, 5 : 8}, ...
%              {5, 1.01, 1 : 2 : 7}, {6, 1.01, 2 : 2 : 8}};
% -------
% OUTPUT:
% -------
%   cover_set_indices : matrix(1, ?), Integer :: cover set indices generated sequentially
%       e.g., [4 3 1 2]
%   cover_set_costs : matrix(1, ?), Double :: cover set costs generated sequentially
%       e.g., [1/4 1/2 1 1]
% *********************************************************************** %

cover_set_indices = [];
cover_set_costs = [];
R = elems;
while ~isempty(R)
    temp_cost = Inf;
    for i=1:length(sets)
        x = sets{1, i};
        S_i = x{1, 3};
        tt = intersect(S_i, R);
        y = x{1, 2}/length(intersect(S_i, R));
        if y < temp_cost
            temp_cost = y;
            S = S_i;
            index = x{1, 1};
        end
    end
    R = setdiff(R, S);
    cover_set_indices = [cover_set_indices, index];
    cover_set_costs = [cover_set_costs, temp_cost];
end







