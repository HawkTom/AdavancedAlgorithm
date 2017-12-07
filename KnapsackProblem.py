from scipy.optimize import linprog
import numpy as np


OUTPUT = []

class node(object):
    """docstring for node"""

    def __init__(self, item, x, y, z, t):
        self.item_value = x
        self.value = item
        self.decision = y
        self.remain = z + self.decision * self.item_value[1]
        self.allvalue = t + self.decision * self.item_value[0]
        self.leftnode = None
        self.rightnode = None

    def upbound(self):
        if self.remain > WEIGHT:
            self.ub = float('Inf')
        else:
            if len(self.value):
                c = self.value[:, 0]
                a = self.value[:, 1]
                b = WEIGHT - self.remain
                res = linprog(-c, a, b, bounds=tuple([(0, 1)
                                                      for i in range(self.value.shape[0])]))
                self.ub = -res['fun'] + self.allvalue
            else:
                self.ub = self.allvalue
        OUTPUT.append(self.ub)


def branch_bound(items, root):
    if items.shape[0] == 0:
        return "finished"
    item = items[0, :]
    items = np.delete(items, 0, axis=0)
    node1 = node(items, item, 1, root.remain, root.allvalue)
    node1.upbound()
    node0 = node(items, item, 0, root.remain, root.allvalue)
    node0.upbound()
    root.leftnode = node1
    root.rightnode = node0
    branch_bound(items, node1)
    branch_bound(items, node0)

WEIGHT = 9
# items = [[5, 3], [4, 2], [12, 5], [14, 6]]
# items = [ [4, 5],[3, 2],[3.9, 3]]
# items = [[4,3],[8,4],[10,5],[15,8]]
# items = [[8,4],[10,5],[15,8],[4,3]]

items = [[8, 6], [4, 2], [9, 5], [5, 3] ]
for item in items:
    item.append(item[0] / item[1])
print(items)
# items = sorted(items, key=lambda x: x[2], reverse=True)
print(items)
items = np.array(items)
root = node(items, [0, 0], 0, 0, 0)
branch_bound(items, root)
for i in range(0, len(OUTPUT), 2):
    print(OUTPUT[i], OUTPUT[i+1])
# print(OUTPUT)
# print(len(OUTPUT))
# print(items[:, :])
# print(items[1, 1])
