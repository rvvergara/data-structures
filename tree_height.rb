# RyanV solution

# node height = 1 + max(left height, right height)

def do_stuff(arr)
  #0 Declare heights array that will store the heights of individual subtree (node)
  heights = []
  #1 Iterate through the input array starting from last element down to first
 (arr.size - 1).downto(0) do |i|
  #2 Test initial height - if element is 0 then initial height is 0, otherwise it's 1
  initial_height = arr[i] == 0 ? 0 : 1
  # 3 Find index in heights array of the height of element's left child -> If left child exists then it's equal to heights.length - i - 1, otherwise it's nil
  left_heights_index = arr[2*i + 1].nil? ? nil : heights.length - i - 1
  # 4 Same logic for index in heights of element's right child
  right_heights_index = arr[2*i + 2].nil? ? nil : left_heights_index - 1
  # 5 Height of element's left child is 0 if left child doesn't exist, otherwise it's heights[left_height_index]
  left_height = left_heights_index.nil? ? 0 : heights[left_heights_index]
  # 6 Same logic for right_height
  right_height = right_heights_index.nil? ? 0 : heights[right_heights_index]
  # 7 Total height is equal to initial height plus the maximum between left and right heights
  total_height = initial_height + [left_height,right_height].max
  # 8 Push total height to heights array
  heights.push(total_height)
 end
 puts heights[-1]
end

inputs = [
  [2, 7, 5, 2, 6, 0, 9],
  [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0],
  [5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0],
  [1, 2, 3, 4, 0, 5, 6, 7, 8, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0],[2,7,5,2,6,0,9,0,0,5,11,0,0,4,0]
]

do_stuff(inputs[0])
do_stuff(inputs[1])
do_stuff(inputs[2])
do_stuff(inputs[3])
do_stuff(inputs[4])