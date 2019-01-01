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

def has_cycle?(node, stack = [node], visited = [])
  shifted = stack.shift
  return true if visited.include?(shifted)
  visited.push(shifted)
  
  node.connections.each {|connection| stack.push(connection) if !visited.include?(connection)} if !node.nil?

  return false if stack.empty?

  has_cycle?(stack[0], stack, visited)

end

def do_stuff(graph)
  puts has_cycle?(create_graph(graph)[0])
end

inputs = [
  "2
  4
  0 5 3
  5 2
  5 1
  4 2 3",
  "2
  2
  0 1 3 4
  5
  2
  2
  2",
  "1 2
  0 2
  0 1 3 4
  5
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
  "2
  4 3
  0 5
  5 1
  1
  2 3"
]

processed_inputs = inputs.map {|input| input_processing(input)}

processed_inputs.each {|input| do_stuff(input)}