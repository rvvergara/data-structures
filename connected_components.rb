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

# Extract unique numbers from multiline input and return a sorted array of those 
def convert_to_sorted(arr_of_arr)
  sorted = []
  arr_of_arr.each {|arr| arr.each {|num| sorted.push(num) if !sorted.include?(num)}}
  sorted.sort
end

# Returns string of unique numbers
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

def is_connected?(graph)
  depth_first_graph(create_graph(graph)[0]).split.map{|s| s.to_i}.sort == convert_to_sorted(graph)
end

def do_stuff(graph)
  puts is_connected?(graph)
end


inputs = [
  "2
  4
  0 5 3
  5 2
  5 1
  4 2 3",
  "1 2
  0 2
  0 1 3 4 5
  2 4
  3 2
  2",
  "1
  0 3 4
  5 6
  1
  1
  2
  2",
  "1 2
  0 3 4
  0 5 6
  1
  1
  2
  2",
  "2
  4
  0
  5
  5 1
  4 3",
  "1 2
  0 4
  0 4
  5 6
  1 2 7
  3
  3
  4"
]

sanitized_inputs = inputs.map {|input| input_processing(input)}

sanitized_inputs.each {|input| do_stuff(input)}

# puts is_connected?(inputs[0])
# puts is_connected?(inputs[1])
# puts is_connected?(inputs[2])
# puts is_connected?(inputs[3])
# puts is_connected?(inputs[4])
# puts is_connected?(inputs[5])
