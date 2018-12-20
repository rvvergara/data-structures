def is_binary_search?(tree, i = 0, min = -Float::INFINITY, max = Float::INFINITY)
  return false if  tree[i] < min || tree[i] > max

  left = tree[2*i+1].nil? || tree[2*i+1] == 0 ? true : is_binary_search?(tree, 2*i+1, min, tree[i])
  right = tree[2*i+2].nil? || tree[2*i+2] == 0 ? true : is_binary_search?(tree, 2*i+2, tree[i], max)
  left && right
end

def lesser?(tree, child, val)
  
end

def greater?(tree, child, val)
  
end

inputs = [
  [10, 4, 12],
  [10, 5, 7],
  [20, 10, 27, 12, 14, 23, 30],
  [19, 9, 26, 4, 13, 17, 29],
  [20, 10, 27, 5, 14, 23, 30],
  [20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0],
  [21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0]
]

def do_stuff ar
  puts is_binary_search?(ar)
end

inputs.each {|input| do_stuff(input)}
# puts is_binary_search? inputs[0]
# puts is_binary_search? inputs[1]
# puts is_binary_search? inputs[2]
# puts is_binary_search? inputs[3]
# puts is_binary_search? inputs[4]
# puts is_binary_search? inputs[5]
# puts is_binary_search? inputs[6]