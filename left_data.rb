def left_data(tree, i = 0)
  left_child_index = 2 * i + 1
  tree[left_child_index].nil? ? tree[i] : tree[i] + left_data(tree, left_child_index)
end

inputs = [
  [2, 7, 5, 2, 6, 0, 9],
  [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0],
  [5, 3, 4, 11, 13, 15, 21, 10, 4, 7, 2, 8, 0, 9, 0],
  [1, 2, 3, 4, 5, 6, 7]
];

inputs.each {|input| puts left_data(input)}