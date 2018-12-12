class Node
  attr_accessor :data, :left, :right
  def initialize data = nil
    @data = data
    @left = nil
    @right = nil
  end
end

# Method to insert elements into a binary tree
def insert_into_tree(tree,num)
  if num < tree.data
    tree.left.nil? ? tree.left = Node.new(num) : insert_into_tree(tree.left, num)
  end
  if num > tree.data
    tree.right.nil? ? tree.right = Node.new(num) : insert_into_tree(tree.right, num)
  end
end

# Method to convert an array into a binary search tree
def array_to_binary(arr)
  node = Node.new(arr[0])
  arr.slice(1..-1).each  {|el| insert_into_tree(node, el) }
  node
end

# Method to print out a binary tree
def pre_order_array(tree)
  output = tree.nil? || tree.data == 0 ? "" : tree.data.to_s + " "
  left = tree.left.nil? ? "" : pre_order_array(tree.left)
  right = tree.right.nil? ? "" : pre_order_array(tree.right)
  output + left + right
end

def do_stuff(ar)
  puts pre_order_array(array_to_binary(ar)).to_s
end

inputs = [
  [8, 3, 10, 1, 6, 14, 4, 7, 13],
  [5, 3, 7, 1, 2, 6, 8],
  [10, 12, 15, 7, 2, 23, 9, 14, 21],
  [50, 25, 75, 15, 21, 62, 91]
]

inputs.each {|input| do_stuff(input)}
