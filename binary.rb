# Ruby implementation of Binary Trees
class BinaryTree

  attr_reader :left, :right, :data, :height
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def add_left(data)
    @left = data.class == BinaryTree ? data : BinaryTree.new(data)
    self
  end

  def add_right(data)
    @right = data.class == BinaryTree ? data : BinaryTree.new(data)
    self
  end

  def post_order
    output = @data.nil? ? "" : @data
    left = @left.nil? ? "" : @left.post_order

    right = @right.nil? ? "" : @right.post_order

    left + right + output
  end

  def in_order
    output = @data.nil? ? "" : @data
    left = @left.nil? ? "" : @left.in_order
    right = @right.nil? ? "" : @right.in_order
    left + output + right
  end

  def pre_order
    output = @data.nil? ? "" : @data
    left = @left.nil? ? "" : @left.pre_order
    right = @right.nil? ? "" : @right.pre_order
    output + left + right
  end

  def breadth_first
    self.bfs(self)
  end

  def bfs(node, queue = [node])
    return "" if node.nil?
    shifted = queue.shift
    output = shifted.data.nil? ? "" : shifted.data
    queue.push(node.left) if !node.left.nil?
    queue.push(node.right) if !node.right.nil?
    output + self.bfs(queue[0], queue)
  end

  def height
    left_height = @left.nil? ? 0 : @left.height
    right_height = @left.nil? ? 0 : @right.height
    1 + [left_height,right_height].max
  end

end

values = "FDJBEGKACIH".split("")
tree = values.map {|value| BinaryTree.new(value)}

f, d, j, b, e, g, k, a, c, i, h = tree

f.add_left(d).add_right(j);
d.add_left(b).add_right(e);
b.add_left(a).add_right(c);
j.add_left(g).add_right(k);
g.add_right(i);
i.add_left(h);

tree1 = f

puts "Breadth-first: #{tree1.breadth_first}"
puts "Pre-Order: #{tree1.pre_order}"
puts "In-Order: #{tree1.in_order}"
puts "Post-OrderL #{tree1.post_order}"
puts tree1.height
