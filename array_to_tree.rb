class Node
  attr_accessor :data, :left, :right
  def initialize data = nil
    @data = data
    @left = nil
    @right = nil
  end
end

node = Node.new(10)

def array_to_tree arr, i = 0
  node = Node.new(arr[i])
  left_index = 2 * i + 1
  right_index = 2 * i + 2
  
  return node if arr[left_index].nil? && arr[right_index].nil?
  
  node.left = array_to_tree(arr, left_index) if !arr[left_index].nil?
  
  node.right = array_to_tree(arr, right_index) if !arr[right_index].nil?
  node
end

def pre_order_array(tree)
  output = tree.nil? || tree.data == 0 ? "" : tree.data.to_s + " "
  
  left = tree.left.nil? ? "" : pre_order_array(tree.left)

  right = tree.right.nil? ? "" : pre_order_array(tree.right)

  output + left + right
end

def post_order_array(tree)
  output = tree.nil? || tree.data == 0 ? "" : tree.data.to_s + " "
  
  left = tree.left.nil? ? "" : post_order_array(tree.left)

  right = tree.right.nil? ? "" : post_order_array(tree.right)

  left + right + output
end

def in_order_array(tree)
  output = tree.nil? || tree.data == 0 ? "" : tree.data.to_s + " "
  
  left = tree.left.nil? ? "" : in_order_array(tree.left)

  right = tree.right.nil? ? "" : in_order_array(tree.right)

  left + output + right 
end

def breadth_first(subtree, queue = [subtree])
  return " " if subtree.nil?
  shifted = queue.shift
  output = shifted.data.to_s + " "
  
  queue.push(subtree.left) if !subtree.left.nil?
  
  queue.push(subtree.right) if !subtree.right.nil?

  output + breadth_first(queue[0], queue)
end

inputs = [
  [10, 1, 2, 3, 4, 5, 6],
  [2, 7, 5, 2, 6, 0, 9],
  [1, 2, 3, 4, 5, 6, 7, 8, 9],
  [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0],
  [2, 10, 20, 30, 4, 5, 60]
]


def do_stuff(ar)
  puts post_order_array(array_to_tree(ar))
end

# inputs.each {|input| do_stuff(input)}

# puts breadth_first(array_to_tree(inputs[0]))

puts pre_order_array(array_to_tree([5, 3, 7, 1, 2, 6, 8]))