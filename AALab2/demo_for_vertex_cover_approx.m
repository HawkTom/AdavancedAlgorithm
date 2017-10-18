clc;clear
%% demo one
disp('demo one')
graph_mat = [1 2; ...
             2 3; ...
             3 4; ...
             4 1; ...
             2 4];
weights = [3 4 3 5];
[vertex_set_indices, prices] = vertex_cover_approx(graph_mat, weights);
disp(['edge: ', num2str(vertex_set_indices)])
disp(['price: ',num2str(prices)])

%% demo two
disp([char(10),'demo two'])
graph_mat = [1 2; ...
             1 3; ...
             1 6; ...
             2 4; ...
             2 5; ...
             3 4; ...
             3 5; ...
             4 6; ...
             5 6];
weights = 11 : -2 : 1;
[vertex_set_indices, prices] = vertex_cover_approx(graph_mat, weights);
disp(['edge: ', num2str(vertex_set_indices)])
disp(['price: ',num2str(prices)])

%% demo three (optional)
% create a large-scale graph instance to show the performance of the pricing method
disp([char(10),'demo three'])
graph_mat = [1 2;2 3;3 4;4 5;5 1; ...
             1 6;2 7;3 8;4 9;5 10; ...
             6 7;7 8;8 9;9 10;10 6;...
             6 11;7 12;8 13;9 14;10 15;...
             11 12;12 13;13 14;14 15;15 11;...
             11 16;12 17;13 18;14 19;15 20;...
             16 18;17 19;18 20;16 19;17 20];
weights = 1000 : -2 : 962;
[vertex_set_indices, prices] = vertex_cover_approx(graph_mat, weights);
disp(['edge: ', num2str(vertex_set_indices)])
disp(['price: ',num2str(prices)])
