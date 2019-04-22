# Ryan's Solution
def find_equilibrium_indices(arr)
  equilibrium_indices = []
  arr.each_with_index do |_num, i|
    left = i == 0 ? [] : arr.slice(0...i)
    right = arr.slice((i + 1)..-1)
    sum_left = left.reduce { |a, b| a + b }.to_i
    sum_right = right.reduce { |a, b| a + b }.to_i
    equilibrium_indices.push(i) if sum_left == sum_right
  end
  equilibrium_indices.join(" ")
end

def do_stuff(ar)
  puts find_equilibrium_indices(ar)
end

inputs = [
  "-7 1 5 2 -4 3 0",
  "1 2 3 4 5 4 2 3 1",
  "-1 1 -2 3 -2 0 1 3 -2 3 -1",
  "2 6 -3 11 0 4 -8 0 13 4 3",
  "1 5 25 3 2 5 6 7 3 2 5 13 12 9 14 11"
].map { |str| str.split(" ").map(&:to_i) }

inputs.each { |input| do_stuff(input) }
