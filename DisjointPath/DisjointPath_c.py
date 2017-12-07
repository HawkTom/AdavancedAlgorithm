import networkx as nx

def greedy_disjoints_with_capacity(G, source, target, cap):
    source, target = list(source), list(target)
    Iset = []
    beta = len(G.nodes())**(1 / 3)
    while True:
        no_path = 0
        lmin, pmin = float('inf'), []
        for (s, t) in zip(source, target):
            if nx.has_path(G, s, t):
                path = nx.shortest_path(G, s, t, 'weight')
                length = len(path)
                if length < lmin:
                    lmin, pmin = length, path
            else:
                no_path += 1
        if no_path == len(source):
            return len(Iset), Iset
        Iset.append(pmin)
        edge_remove = []
        for i in range(len(pmin) - 1):
            G.edges[pmin[i], pmin[i + 1]]['weight'] *= beta
            if G.edges[pmin[i], pmin[i + 1]]['weight'] >= beta**cap:
                edge_remove.append([pmin[i], pmin[i + 1]])
        G.remove_edges_from(edge_remove)
        source.remove(pmin[0])
        target.remove(pmin[-1])


G = nx.DiGraph()
# example 1
# source = ('s1', 's2', 's3', 's4')
# target = ('t1', 't2', 't3', 't4')

# nodes = source + target
# free_nodes = list(range(1,21))
# edges = [('s1', 1, 1), (1, 2, 1), (2, 3, 1), (3, 4, 1), (4, 5, 1),
#         (5, 6, 1), (6, 7, 1), (7, 8, 1), (8, 9, 1), ('s2', 2, 1), ('s3', 3, 1),
#         ('s4', 4, 1), (5, 't1', 1), (6, 't2', 1), (9, 't4', 1),
#          (3, 10, 1), (10, 11, 1), (11, 12, 1), (12, 13, 1), (13, 14, 1), (14, 15, 1),
#          (15, 't2', 1), (4, 16, 1), (16, 17, 1), (17, 18, 1), (18, 19, 1), (19, 20, 1),
#          (20, 't3', 1), (8, 't3', 1)]

# example 2
source = ('s1', 's2', 's3', 's4', 's5', 's6', 's7', 's8')
target = ('t1', 't2', 't3', 't4', 't5', 't6', 't7', 't8')

nodes = source + target
free_nodes = list(range(1, 21))
edges = [('s7', 3, 1), ('s8', 3, 1), (3, 2, 1), (2, 't5', 1), (2, 't6', 1), ('s5', 1, 1),
         ('s6', 1, 1), (1, 's1', 1), ('s1', 2, 1), (2, 4, 1), (4, 5, 1),
         (5, 't2', 1), ('t2', 't1', 1), ('s2','s1', 1), ('s3', 6, 1), ('s4', 6, 1),
         (6, 5, 1), (5, 't7', 1), (5, 't8', 1), ('t2', 't3', 1), ('t2', 't4', 1)]

# example 3
# source = ('s1', 's2', 's3', 's4', 's5', 's6', 's7', 's8')
# target = ('t1', 't2', 't3', 't4', 't5', 't6', 't7', 't8')
#
# nodes = source + target
# free_nodes = list(range(1, 21))
# edges = [('s7', 3, 1), ('s8', 3, 1), (3, 11, 1), (11, 12, 1), (12, 13, 1), (13, 14, 1),
#          (14, 15, 1), (15, 2, 1), (2, 't5', 1), (2, 't6', 1), (2, 5, 1), ('s5', 1, 1), ('s6', 1, 1),
#          (5, 't2', 1), ('t2', 't1', 1), ('s2', 's1', 1), ('s3', 6, 1), ('s4', 6, 1), (6, 16, 1),
#          (16, 17, 1), (17, 18, 1), (18, 19, 1), (19, 20, 1), (20, 5, 1), (5, 't7', 1), (5, 't8', 1),
#          ('t2', 't3', 1), ('t2', 't4', 1), (1, 4, 1), (4, 7, 1), (7, 8, 1), (8, 9, 1), (9, 10, 1),
#          (10, 's1', 1), ('s1', 2, 1)]


G.add_nodes_from(free_nodes)
G.add_nodes_from(nodes)
G.add_weighted_edges_from(edges)
# print(G.edges())
I_len, I = greedy_disjoints_with_capacity(G, source, target, 2)
print(I, '\n', I_len)

