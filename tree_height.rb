# RyanV solution

# node height = 1 + max(left height, right height)

def do_stuff(arr)
  # H0 : Declare heights array and iterate from last element of input array down to first element
  heights = []
  (arr.size - 1).downto(0).each do |i|
    # H1; if element is a zero then height is automatically zero, if not then it's 1
    height = arr[i] == 0 ? 0 : 1
    #H2 Find left child height of element inside heights (if already in it)  by finding the element equivalent to el's indexx
    left_height = heights[i] || 0
    # H3 Right height is the element at i + 1 index of heights
    right_height = heights[i + 1] || 0
    # H4 Add the maximum of left or right to height to come up with the total height of node
    height += [left_height,right_height].max
    # H5 Unshift heights array with the height in order to put the parent height before the children's heights
    heights.unshift(height)
  end
  # H6 print out the height of the root as output
  puts heights[0]
end

inputs = [
  [2, 7, 5, 2, 6, 0, 9],
  [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0],
  [5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0],
  [1, 2, 3, 4, 0, 5, 6, 7, 8, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0]
]

do_stuff(inputs[0])
do_stuff(inputs[1])
do_stuff(inputs[2])
do_stuff(inputs[3])