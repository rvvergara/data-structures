function leftData(tree, i = 0) {
  leftChildIndex = 2 * i + 1;
  return tree[leftChildIndex] === undefined
    ? tree[i]
    : tree[i] + leftHeight(tree, leftChildIndex);
}

const inputs = [
  [2, 7, 5, 2, 6, 0, 9],
  [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0],
  [5, 3, 4, 11, 13, 15, 21, 10, 4, 7, 2, 8, 0, 9, 0],
  [1, 2, 3, 4, 5, 6, 7]
];
