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

def depth_first_graph(node)
  output = node.nil? ? "" : node.data.to_s

  node.connections.each do |connection|
    output += depth_first_graph(connection)
  end

  output
end

inputs = ["2
  4
  5 0 3
  5 2
  1 5
  4 2 3",
  "1 2
  2 0
  3 0 1 4 5
  4 2
  3 2
  2",
  "1 6
  2 0 3 4
  3 1
  6 1 2
  1 5 6
  4
  4 3 0",
  "3
  2 3
  4 1
  1 0
  2",
  "1 6
  2 0 3 4
  7 3 1
  6 1 2
  1 5 7
  4 6
  3 0 5
  4 2"
  ]
  
  sanitized_inputs = inputs.map {|input| input_processing(input)}

  print sanitized_inputs
  # print create_graph(sanitized_inputs[0])[0].connections[0].data

  # print depth_first_graph(create_graph(sanitized_inputs[0])[0])
 puts "\n"