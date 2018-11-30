# 1. Initial start pt = arr[0], initial end = arr.length - 1
def binary_search(arr, target, min = 0,max=arr.length - 1)
  # 2. Check if min > max ? if yes then return
  return "#{target} cannot be found" if min > max
  # 3. Else find midpt = ((start + end)/2).to)i
  midpt = ((min + max)/2).to_i
  element = arr[midpt]
  # 4. If arr[midpt] == target then return midpt
  return "#{target} is found at index #{midpt}" if element == target 
  # 5. Else if arr[midpt] > target then call method again this time with  min and max = midpt - 1
  return binary_search(arr,target,min,midpt -1) if element > target
  # 6 Else if arr[midpt] < target then call method again this time with start = start + 1 and end = end until a terminal point is reached
  return binary_search(arr, target, midpt + 1, max) if element < target
end

# 1. Initial start pt = arr[0], initial end = arr.length - 1
# 2. Check if start > end ? if yes then return nil
# 3. Else find midpt = ((start + end)/2).to)i
# 4. If arr[midpt] == target then return midpt
# 5. Else if arr[midpt] > target then call method again this time with start = start amd end = end - 1
# 6 Else if arr[midpt] < target then call method again this time with start = start + 1 and end = end until a terminal point is reached

letters =	["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"]

numbers = [6,7,8,9,10,11,14,15,17,19,22,23,25,28,30]

# puts binary_search(letters,"l")
# puts binary_search(letters,"z")
# puts binary_search(numbers, 19)
# puts binary_search(numbers, 200)

def do_stuff(a)
  # create an array given only a
  arr = 1.upto(a).to_a
  # call another method that will return the square root of a
  puts square_root(arr, a)
end

def square_root(numbers_arr, square, min = 0,max = numbers_arr.length - 1)

  # 2. Check if min > max ? if yes then return
  return "#{square} is not a square" if min > max
  # 3. Else find midpt = ((start + end)/2).to)i
  midpt = ((min + max)/2).to_i
  product = numbers_arr[midpt]
  # 4. If numbers_arr[midpt] == square then return midpt
  return product if product * product == square
  # 5. Else if arr[midpt] > target then call method again this time with  min and max = midpt - 1
  return square_root(numbers_arr,square,min,midpt -1) if product * product > square
  # 6 Else if arr[midpt] < target then call method again this time with start = start + 1 and end = end until a terminal point is reached
  return square_root(numbers_arr, square, midpt + 1, max) if product * product < square
end

do_stuff(25)
do_stuff(81)
do_stuff(225)
do_stuff(841)
do_stuff(1024)
do_stuff(7056)