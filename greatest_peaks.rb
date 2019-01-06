# Node class connected to up down left right
class Cell
  attr_reader :data
  attr_accessor :surroundings, :belongs_to
  def initialize data = nil
    @data = data
    @surroundings = []
    @belongs_to = nil
  end
end

# Method to create graph
def create_graph(grid)
  cell_grid = []
  grid.each do |row|
    cells = []
    row.each do |element|
      cell = Cell.new(element)
      cells.push(cell)
    end
    cell_grid.push(cells)
  end

  cell_grid.each_with_index do |cell_row, i|
    
    cell_row.each_with_index do |cell, j|
      i == 0 ? nil : cell.surroundings.push(cell_grid[i-1][j])
      j == 0 ? nil : cell.surroundings.push(cell_grid[i][j-1])
      i == cell_grid.size - 1 ? nil : cell.surroundings.push(cell_grid[i+1][j])
      j == cell_row.size - 1 ? nil : cell.surroundings.push(cell_grid[i][j+1])
    end

  end
  cell_grid
end

# 1. Method to find peaks
def find_peaks(cell_grid)
  peaks = []
  cell_grid.each do |cell_row|
    cell_row.each do |cell|
      peaks.push(cell) if cell.surroundings.all? {|neighbor| cell.data >= neighbor.data}
    end
  end
  peaks
end
# 2. Method to determine which peak a cell belongs to
  def set_belongs_to(peaks_arr, cell)
    return cell if peaks_arr.include?(cell)
    
    max_neighbor_data = cell.surroundings.map {|neighbor| neighbor.data}.max

    max_neighbor = nil
    cell.surroundings.each do |adjacent|
      max_neighbor = adjacent if adjacent.data == max_neighbor_data
    end
    
    return cell if max_neighbor_data <= cell.data
    set_belongs_to(peaks_arr, max_neighbor)
  end

# 3. Method to count cells controlled by each peak

def map_area(cell_grid)
  peaks = find_peaks(create_graph(cell_grid))
  create_graph(cell_grid).map do |cell_row|
    cell_row.map do |cell|
      set_belongs_to(peaks, cell).data
    end
  end
end

# 4. Method to count cells for each area
def count_cells(grid_map)
  areas_hash = {}
  grid_map.each do |arr|
    arr.each {|peak| areas_hash[peak].nil? ? areas_hash[peak] = 1 : areas_hash[peak]+=1}
  end
  [areas_hash.values.min, areas_hash.values.max].join(" ")
end

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

# Multiline inputs converted into array of arrays
grids = inputs.map {|input| input_processing(input)}

def do_stuff(grid)
  print count_cells(map_area(grid))
  puts "\n"
end

grids.each {|grid| do_stuff(grid)}