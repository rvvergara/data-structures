def binary_search(ar, lo, hi)
  return -1 if lo > hi
  mid = (lo + hi)/2
  element = ar[mid]
  return element if element == mid
  return binary_search(ar, lo, mid-1) if element > mid
  return binary_search(ar, mid+1, hi) if element < mid
end

def do_stuff(ar)
  lo = 0
  hi = ar.size-1
  puts binary_search(ar, lo, hi)
end

inputs = [
  "0 2 3 7 9 11",
  "3 5 7 9 11 13 17",
  "-4 -2 0 2 4 6 8 10",
  "1 2 3 4 5 6 7 8 9 10",
  "-20 -15 -11 2 5 7 10 11 12 13 14 14",
  "-25 -20 -15 -10 -5 5 7 8 9 10 11 12"
].map {|str| str.split(" ").map {|str| str.to_i}}

inputs.each {|input| do_stuff(input)}
# input = inputs[2]
# hi = input.size
# puts binary_search(input)