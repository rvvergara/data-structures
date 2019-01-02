def find_height(arr, index = 0)
  # S1 - Check if zero: If arr[index] is zero or nil then simply return 0
  return 0 if arr[index].nil? or arr[index] == 0
  # S2 - Left child height: Run find_height with arr and 2*index + 1 as agruments
  left_child_height = find_height(arr,2*index + 1)
  # S3 - Right child height: Run find_height with arr and 2*index + 2 as agruments
  right_child_height = find_height(arr,2*index + 2)
  # S4 Total height is 1 plus the bigger between left child height and right_child height
  total_height = 1 + [left_child_height,right_child_height].max
end

# Binary tree is balanced if difference in left_ht and right_ht is at most 1, and both left and right are balanced
def is_balanced(tree, index = 0)
  return true if tree[index].nil? || tree[index] == 0
  (find_height(tree, 2*index + 1) - find_height(tree, 2*index + 2)).abs <= 1 && is_balanced(tree, 2*index + 1) && is_balanced(tree, 2*index +2)
end

inputs = [
  [1, 2, 0, 3, 4, 0, 0],
  [1, 2, 3, 4, 5, 6, 7],
  [1, 2, 3, 4, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 7],
  [1, 2, 3, 0, 0, 4, 5, 0, 0, 0, 0, 6, 0, 7, 8],
  [1, 2, 3, 4, 5, 0, 0],
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0, 10, 0, 0],
  [1, 2, 3],
  [1, 0, 2],
  [1, 2, 0, 3, 0, 0, 0]
]

def do_stuff(ar)
  puts is_balanced(ar)
end

inputs.each {|input| do_stuff(input)}