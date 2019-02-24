# Ryan's Solution
class Node
  attr_reader :data, :connections
  attr_accessor :distance
  def initialize data = nil
    @data = data
    @connections = []
    @distance = Float::INFINITY
  end
end

def create_graph(ar)
  nodes = []
  # Create nodes with data per input in mother ar
  ar.each_with_index do |num_ar, i|
    node = Node.new(i)
    nodes.push(node)
  end
  # Push each node's connections depending on value in mother ar
  nodes.each_with_index do |node, i|
    ar[i].each_with_index {|num, j| node.connections.push({nodes[j] => num}) if num != 0}
  end
  nodes
end

def shortest_path(node, visited = [], queue = [node])
  shifted = queue.shift
  node.distance = 0 if node.distance == Float::INFINITY
  output = [node]
  visited.push(node)

  node.connections.each do |connection|
    conn_node = connection.keys[0]
    conn_dist = connection.values[0]
    if conn_node.distance > node.distance + conn_dist
      conn_node.distance = node.distance + conn_dist
      queue.push(conn_node) if !queue.include?(conn_node) && !visited.include?(conn_node)
    end
  end
  queue.empty? ? output : output + shortest_path(queue[0], visited, queue)
end

def do_stuff(ar)
  graph = create_graph(ar)
  puts shortest_path(graph[0]).sort {|a,b| a.data - b.data}.map {|node| node.distance}.join(" ")
end


inputs = [
  "
  0 0 1 3 0 0
  0 0 0 5 0 0
  1 0 0 2 1 4
  3 5 2 0 7 0
  0 0 1 7 0 2
  0 0 4 0 2 0
  ",
  "
  0 3 5
  3 0 1
  5 1 0
  ",
  "
  0 3 6 0 0 10
  3 0 4 1 0 0
  6 4 0 3 5 4
  0 1 3 0 2 0
  0 0 5 2 0 3
  10 0 4 0 3 0
  ",
  "
  0 3 6 0 0 9 4
  3 0 4 1 0 0 0
  6 4 0 3 5 4 1
  0 1 3 0 2 0 0
  0 0 5 2 0 3 0
  9 0 4 0 3 0 3
  4 0 1 0 0 3 0
  "
].map do |input|
  input.strip.split("\n").map {|str| str.split.map {|str| str.to_i}}
end

inputs.each {|input| do_stuff(input)}
puts