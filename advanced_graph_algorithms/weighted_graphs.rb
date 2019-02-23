# Ryan's Solution
class Node
  attr_accessor :data, :connections, :level
  def initialize data = nil
    @data = data
    @connections = []
    @level = 0
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
    ar[i].each_with_index {|num, j| node.connections.push(nodes[j]) if num != 0}
  end
  nodes
end
 
# Use BFS to change level for each node depending on their distance from start node and output an array of all nodes
def distance_between(node, visited = [], queue = [node])
  shifted = queue.shift
  output = [shifted]
  visited.push(node)

  node.connections.each do |connection|
    if !visited.include?(connection) && !queue.include?(connection)
      connection.level = node.level + 1
      queue.push(connection)
    end
  end
  queue.empty? ? output : output + distance_between(queue[0], visited, queue)
end

def do_stuff(ar)
  graph = create_graph(ar)
  puts distance_between(graph[0]).sort {|a,b| a.data - b.data}.map {|node| node.level}.join(" ")
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
  0 3 6 0 0 9 4
  3 0 4 1 0 0 0
  6 4 0 3 5 4 1
  0 1 3 0 2 0 0
  0 0 5 2 0 3 0
  9 0 4 0 3 0 3
  4 0 1 0 0 3 0
  ",
  "
  0 1 1 0 0 0 0 0 0 1
  1 0 0 0 0 0 0 0 0 0
  1 0 0 0 1 1 0 0 0 0
  0 0 0 0 1 0 0 0 0 0
  0 0 1 1 0 0 1 0 0 0
  0 0 1 0 0 0 0 1 0 0
  0 0 0 0 1 0 0 1 1 0
  0 0 0 0 0 1 1 0 0 0
  0 0 0 0 0 0 1 0 0 0
  1 0 0 0 0 0 0 0 0 0
  "
].map do |input|
  input.strip.split("\n").map {|str| str.split.map {|str| str.to_i}}
end

inputs.each {|input| do_stuff(input)}
