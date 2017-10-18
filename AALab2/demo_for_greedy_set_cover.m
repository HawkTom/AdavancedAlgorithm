clc;clear
% %% demo one
% disp('demo one')
% elems = 1 : 8;
% sets = {{1, 1, 1}, {2, 1, 2}, {3, 1, [3 4]}, {4, 1, 5 : 8}, ...
%     {5, 1.01, 1 : 2 : 7}, {6, 1.01, 2 : 2 : 8}};
% [cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets);
% disp(cover_set_indices)
% disp(cover_set_costs)
% 
% %% demo two
% disp('demo two')
% elems = 1 : 16;
% sets = {{1, 1, 1}, {2, 1, 2}, {3, 1, [3 4]}, {4, 1, 5 : 8}, ...
%     {5, 1, 9 : 16}, {6, 1.01, 1 : 2 : 15}, {7, 1.01, 2 : 2 : 16}};
% [cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets);
% disp(cover_set_indices)
% disp(cover_set_costs)

%% demo three (optional)
% create a large-scale instance to show the performance of the greedy_set_cover() method
disp('demo three')
elems = 1:100;
sets = {{1, 1, 1:3:50},{2, 1.1, 1:40},{3, 1.2, 5:5:100},{4, 2, 40:60}, {5, 3, 50:80}, {6, 1, 6:2:100},...
    {7,0.9, 1:10:100}, {8, 1, 3:2:68},{9, 1.3, 6:4:90},{10, 1.06, 5:3:50},{11, 2, 81:2:100},{12,1.6, 90:100}};
[cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets);
disp(cover_set_indices)
disp(cover_set_costs)