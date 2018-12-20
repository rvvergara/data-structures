# RyanV solution
require 'benchmark'
# node height = 1 + max(left height, right height)

def do_stuff1(arr)
  # d0 Heights array to store heights
  heights = []
  # d1 Iterate from last element of input array down to first element
  (arr.size - 1).downto(0).each do |i|
    # d2 push each height by running find_height with arr and current i as arguments
    heights.push(find_height(arr,i))
  end
  # puts heights[-1]
  print heights[-1]
  puts "\n"
end

def find_height(arr, index = 0)
  # S1 - Check if zero: If arr[index] is zero or nil then simply return 0
  return 0 if arr[index].nil? or arr[index] == 0
  # S2 - Left child height: Run find_height with arr and 2*index + 1 as agruments
  left_child_height = find_height(arr,2*index + 1)
  # S3 - Right child height: Run find_height with arr and 2*index + 2 as agruments
  right_child_height = find_height(arr,2*index + 2)
  # S4 Total height is 1 plus the bigger between left child height and right_child height
  total_height = 1 + [left_child_height,right_child_height].max
end

def do_stuff(ar)
  puts find_height(ar)
end


inputs = [
  [2, 7, 5, 2, 6, 0, 9],
  [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0],
  [5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0],
  # [1, 2, 3, 4, 0, 5, 6, 7, 8, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0],
  # [2,7,5,2,6,0,9,0,0,5,11,0,0,4,0]
]

inputs.each {|input| do_stuff(input)}

# puts Benchmark.measure { find_height(inputs[1])}.total * 1000