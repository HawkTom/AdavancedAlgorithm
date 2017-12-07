import networkx as nx


def greedy_disjoint_path(G, source, target):
    Iset = []
    while True:
        no_path = 0
        lmin, pmin = float('inf'), []
        for (s, t) in zip(source, target):
            if nx.has_path(G, s, t):
                path = nx.shortest_path(G, s, t)
                length = len(path)
                if length < lmin:
                    lmin, pmin = length, path
            else:
                no_path += 1
        # Iset is the all selected satisfy path
        # len(Iset) is the number of satisfy path
        if no_path == len(source):
            return len(Iset), Iset
        Iset.append(pmin)
        edge_remove = []
        for i in range(len(pmin) - 1):
            edge_remove.append([pmin[i], pmin[i + 1]])
        G.remove_edges_from(edge_remove)


G = nx.DiGraph()
# example 1
# source = ('s1', 's2', 's3')
# target = ('t1', 't2', 't3')

# nodes = source + target
# free_nodes = (1,)
# edges = [['s3', 's1'], ['s1', 1], ['s2', 1],
#          [1, 't3'], [1, 't1'], ['t1', 't2']]

# example 2
source = ('s1', 's2', 's3', 's4')
target = ('t1', 't2', 't3', 't4')
nodes = source + target
free_nodes = (1, 2, 3, 4, 5)
edges = [['s1', 1], [1, 2, ], ['s2', 2], [2, 3], [4, 5], ['s3', 3],
         ['s4', 4], [3, 4], [3, 't2'], [4, 't3'], [5, 't4'], [5, 't1']]


G.add_nodes_from(free_nodes)
G.add_nodes_from(nodes)
G.add_edges_from(edges)

I_len, I = greedy_disjoint_path(G, source, target)
print(I, '\n', I_len)
