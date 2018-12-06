def backtrack_sum_purse(target, arr, purse = [])
  sum = purse.sum
    # Terminal states:
  # 1. Check if left == target if yes return the purse
  return purse if sum == target
  # 2. Check if left > target if yes return that none of the numbers can add up to the target
  return "None of the numbers combine to add up to #{target}" if sum > target
  # 3. Run method on a yes branch, meaning possibility of arr[0] included
  if arr.empty?
    return purse if sum == target
    return "None of the numbers combine to add up to #{target}"
  end
  left = backtrack_sum_purse(target, arr.slice(1..-1),purse + [arr[0]])
  right = backtrack_sum_purse(target, arr.slice(1..-1),purse)
  return left if left.class == Array
  return right
end

inputs = [
  [12, [1,2,3,4,5]],
  [11, [1, 5, 9, 13]],
  [50, [1, 3, 5, 37, 18, 5]],
  [42, [3, 16, 11, 5, 11, 5]],
  [51, [8, 12, 15, 7, 11, 14]],
  [201, [37, 42, 10, 23, 15, 25, 11, 6, 19, 25, 51]]
]

inputs.each {|input| print "#{backtrack_sum_purse(input.first, input.last)} \n"}