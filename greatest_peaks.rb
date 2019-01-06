# Node class connected to up down left right
class Node
  attr_reader :data
  attr_accessor :surroundings
  def initialize data = nil
    @data = data
    @surroundings = []
  end
end

# Method to create graph
def create_graph(grid)
  nodes = []
  
  grid.each_with_index do |row, i|
    row.each_with_index do |el, j|
      node = Node.new(el)
      i == 0 ? node.surroundings.push(0) : node.surroundings.push(grid[i-1][j])
      j == 0 ? node.surroundings.push(0) : node.surroundings.push(grid[i][j-1])
      i == grid.length - 1 ? node.surroundings.push(0) : node.surroundings.push(grid[i+1][j])
      j == row.length - 1 ? node.surroundings.push(0) : node.surroundings.push(grid[i][j+1])
      nodes.push(node)
    end
  end
  nodes
end

# 1. Method to find peaks
def find_peaks(grid)
  peaks = []
  grid.each do |node|
    peaks.push(node.data) if node.surroundings.all? {|neighbor| node.data >= neighbor}
  end
  peaks
end
# 2. Method to determine which peak a cell belongs to
  
# 3. Method to count cells controlled by each peak

inputs = [
  "9 8 5
  5 6 3
  8 4 1",
  "8 12
  9 3",
  "2 6 9 11
  7 8 9 8
  6 7 12 9
  10 7 6 4",
  "4 3 2 1
  2 1 0 5
  0 7 4 6
  10 8 4 7",
  "3 6 9 11 3
  5 8 12 4 6
  7 10 13 2 14
  0 1 5 9 3
  2 8 6 4 0"
]

# Method to process multiline string into a list of arrays of numbers
def input_processing(multi_line)
  multi_line.split("\n").map {|nums| nums.split.map {|str| str.to_i}}
end

grids = inputs.map {|input| input_processing(input)}


# print find_peaks(create_graph(grids[2]))
# print create_graph(grids[4])[3].surroundings
# grids.each {|grid| print "#{find_peaks(create_graph(grid))} \n"}
puts "\n"