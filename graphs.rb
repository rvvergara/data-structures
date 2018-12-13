# Node class with pointer to several nodes
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
  graph = []
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

# Traversing the node to find the path to the target
def visit(node, target, visited = [], path = [node.data])
  # Terminal states:
  if node.data == target
    # 1. If node.data is equal to target return the path
    return path
  else
    # If the node hasn't been visited then
    if !visited.include? node
      # Push the node in visited (so it wont be visited again)
      visited.push(node)
      # Traverse through each node in the node's connections
      node.connections.each do |connection|
        # Push to path the corresponding data
        path.push(connection.data)
        # Return a recursive call to the method with this particular connection as 1st argument
        # target as 2nd and then current versions of visited and path as 3rd an fourth args
        return visit(connection, target, visited, path)
      end
    end
  end
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
# puts visit(create_graph(input_processing(inputs[4]))[0],4).join(" ")
# print create_graph(input_processing(input))[0].connections.map {|connection| connection.data}
# print create_graph(input_processing(input))
# puts "\n"

# node = Node.new(4)
# node.connections.push(Node.new(3))
# puts node

def do_stuff(arr)
  print visit(create_graph(arr)[0],4).join(" ") + "\n"
end

sanitized_inputs.each {|input| do_stuff(input)}