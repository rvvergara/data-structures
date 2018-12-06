def backtrack_sum(target, arr, sum = 0)
  # Terminal states:
  # 1. Check if left == target if yes return true
  return true if sum == target
  # 2. Check if left > target if yes return false
  return false if sum > target
  # 3. Run method on a yes branch, meaning possibility of arr[0] included
  return false if arr.empty?
  if backtrack_sum(target, arr.slice(1..-1), sum + arr[0])
    return true
  else
    backtrack_sum(target, arr.slice(1..-1),sum)
  end
end

puts backtrack_sum(12, [1,2,3,4,5])
puts backtrack_sum(11, [1, 5, 9, 13])
puts backtrack_sum(50, [1, 3, 5, 37, 18, 5])
puts backtrack_sum(42, [3, 16, 11, 5, 11, 5])
puts backtrack_sum(51, [8, 12, 15, 7, 11, 14])
puts backtrack_sum(201, [37, 42, 10, 23, 15, 25, 11, 6, 19, 25, 51])