# Ryan's Solution
class Node
  attr_reader :data, :connections
  def initialize data = nil
    @data = data
    @connections = []
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

# Minimum spanning tree using Prim's algorithm
def min_spanning_tree(node, visited = [])
  # Push current node into the visited array -> we will visit this node's unvisited connections -> as an unvisited_conns array
  visited.push(node)
  unvisited_conns = []
  # Set the output to an empty array
  output = []
  # Push to unvisited_conns all connections of current node that haven't been visited
  visited.each do |cell|
    cell.connections.each do |connection|
      if !visited.include?(connection.keys[0])
        unvisited_conns.push(connection)
      end
    end
  end
  # If there aren't any more unvisited nodes, it means we have the minimum spanning tree so just return current output
  return output if unvisited_conns.empty?
  # Map all distances in the unvisited connections
  distances = unvisited_conns.map {|conn| conn.values[0]}
  # Select minimum distance from the above
  min_dis = distances.min
  # Find its index
  index = distances.index(min_dis)
  # Push this minimum distance into the output
  output.push(min_dis)
  # Use the node of this minimum distance as the next node to run this method recursively
  nxt_node = unvisited_conns[index].keys[0]
  # Final output will be the sum of the current node's output plus recursively running the method on the next node
  output + min_spanning_tree(nxt_node, visited)
end

def do_stuff(grid)
  graph = create_graph(grid)
  puts min_spanning_tree(graph[0]).join(" ")
end

inputs = [
  "
  0 4 1 4 0 0 0 0 0 0
  4 0 5 0 9 9 0 7 0 0
  1 5 0 3 0 0 0 9 0 0
  4 0 3 0 0 0 0 10 0 18
  0 9 0 0 0 2 4 0 6 0
  0 9 0 0 2 0 2 8 0 0
  0 0 0 0 4 2 0 9 3 9
  0 7 9 10 0 8 9 0 0 8
  0 0 0 0 6 0 3 0 0 9
  0 0 0 18 0 0 9 8 9 0",
  "0 0 1 3 0 0
  0 0 0 5 0 0
  1 0 0 2 1 4
  3 5 2 0 7 0
  0 0 1 7 0 2
  0 0 4 0 2 0",
  "0 3 5
  3 0 1
  5 1 0",
  "0 3 6 0 0 9 4
  3 0 4 1 0 0 0
  6 4 0 3 5 4 1
  0 1 3 0 2 0 0
  0 0 5 2 0 3 0
  9 0 4 0 3 0 3
  4 0 1 0 0 3 0",
  "0 4 1 4 0 0 0 0 0
  4 0 5 0 9 5 0 7 0
  1 5 0 3 0 0 0 9 0
  4 0 3 0 0 0 0 7 0
  0 9 0 0 0 2 4 0 6
  0 5 0 0 2 0 2 8 0
  0 0 0 0 4 2 0 9 3
  0 7 9 7 0 8 9 0 0
  0 0 0 0 6 0 3 0 0"
].map do |input|
  input.strip.split("\n").map {|str| str.split.map {|str| str.to_i}}
end

inputs.each {|input| do_stuff(input)}