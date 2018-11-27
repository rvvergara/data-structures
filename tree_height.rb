# RyanV solution

# node height = 1 + max(left height, right height)

def do_stuff(arr)
  # 0 -> Declare a heights array to store the heights of each node
  heights = []
  # 1 Traverse arr for each element starting from last element down to first
  (arr.length - 1).downto(0).each do |i|
    # 2. If element (arr[i]) is zero, set its initial height to 0, else set it to 1
    height = arr[i] == 0 ? 0 : 1
    # 3. Index inside heights array of the height of the left child of the element is nil if arr[i] has no left child else it is equal to heights.length - i - 1
    left_height_index = arr[2*i + 1].nil? ? nil : heights.length - i - 1
    left_height = left_height_index.nil? ? 0 : heights[left_height_index]
    # 4. Right height index (inside heights) is nil if arr[i] has no right child else it is equal to left_height_index - 1:
    right_height_index = arr[2*i + 2].nil? ? nil : left_height_index - 1
    right_height = right_height_index.nil? ? 0 : heights[right_height_index]
    # 5. Add maximum of left height and right height to initial height to get arr[i]'s total height
    height += [left_height,right_height].max
    # 6. Push height into heights
    heights.push(height)
  end
  print heights
  puts "\n"
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