class Node
  attr_reader :data
  attr_accessor :connections
  def initialize data = nil
    @data = data
    @connections = []
  end
end

# Class to create a graph
def create_graph(arr)
  nodes = []
  (0...arr.size).each do |i|
    node = Node.new(i)
    nodes.push(node)
  end
  nodes.each_with_index do |node,i|
    arr[i].each {|val| node.connections.push(nodes[val])} 
  end
  nodes
end

# Method to process multiline string into a list of arrays of numbers
def input_processing(multi_line)
  multi_line.split("\n").map {|nums| nums.split.map {|str| str.to_i}}
end

def depth_first_graph(node, visited = [])
  if !visited.include? node
    visited.push(node)
    output = node.data.to_s + " "
    output += node.connections.map do |connection|
      depth_first_graph(connection, visited)
    end.join("")
  end
  output
end

inputs = [
  "2
  4
  5 0 3
  2
  1 5
  4 2",
  "1 2
  0 2
  0 1 3 4 5
  2 4
  3 2
  2",
  "1 2
  0 3 4
  0 5 6
  1
  1
  2
  2",
  "3
  2 3
  4 1
  1 0
  2",
  "1 2
  0 3 4
  0 5 6
  1
  1 5
  2 4
  2"
  ]
  
sanitized_inputs = inputs.map {|input| input_processing(input)}

def do_stuff(arr)
  print depth_first_graph(create_graph(arr)[0])
  puts "\n"
end

sanitized_inputs.each {|input| do_stuff(input)}