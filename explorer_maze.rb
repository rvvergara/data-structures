# Class cell
class Cell
  attr_reader :data
  attr_accessor :right, :down, :coords
  def initialize data = nil
    @data = data
    @right = nil
    @down = nil
    @coords = []
  end
end

# Method to create arrays of cells:
def create_graph(num_grid)
  cell_grid = []
  
  num_grid.each_with_index do |row,y|
    cells = []
    # Create each cell and include coords
    row.each_with_index do |num,x|
      cell = Cell.new(num)
      cell.coords.push(x)
      cell.coords.push(y)
      cells.push(cell)
    end
    cell_grid.push(cells)
  end

  # Put each cell's right and down neighbors
  cell_grid.each_with_index do |cell_row, y|
    cell_row.each_with_index do |cell, x|
      x != cell_row.length - 1 ? cell.right = cell_grid[x+1][y] : nil
      y != cell_row.length - 1 ? cell.down =  cell_grid[x][y+1] : nil
    end
  end
  # return the cell_grid
  cell_grid
end

# 1. Determine right/left neighbors and coordinates of each cell
# 2. Have a method for going to the right
def go_right(maze, cell, queue=[cell], path=[])
  # should 1 be the cell's right data then run go_down on cell's down
  shifted = queue.shift
  if shifted.right.data == 1
    queue.push(cell.down)
    path.push(cell.coords)
    return go_down(maze, cell.down, queue, path)
  end
  # should 9 be the cell's data then simply return path after pushing the cell's coords into the path
  if cell.data == 9
    path.push(cell.coords)
    return path
  end
  # should cell be the last element in the row, then:
  if cell.coords[0] == maze.square_size - 1
    queue.push(cell.down)
    path.push(cell.coords)
    return go_down(maze, cell.down, queue, path)  
  end
  queue.push(cell.right)
  path.push(cell.coords)
  go_right(maze, cell.right, queue, path)
end
# 3. Have a method for going down


inputs = [
  "0 0 0 0 0
  0 1 0 1 0
  0 1 0 1 1
  0 1 0 0 0
  0 0 0 1 9"
]

# method to parse multiline string into array of arrays
def input_processing(multi_line)
  multi_line.split("\n").map {|nums| nums.split.map {|str| str.to_i}}
end

mazes = inputs.map {|input| input_processing(input)}

puts "\n"