# Ryan's
# 1. Group array into array of pairs -> lets do it simply first
def group_intervals(ar)
  intervals = []
  interval = []
  until ar.empty?
    if interval.size == 2
      intervals.push(interval)
      interval = []
    else
      interval.push(ar.shift)
    end
  end
  intervals.push(interval)
  intervals
end
# 2. Sort the start times (using any of the sorting algos)
def merge(left, right)
  sorted = []
  while !left.empty? && !right.empty?
    if left.first[0] < right.first[0] || right.empty?
      sorted.push(left.shift)
    elsif right.first[0] <= left.first[0] || left.empty?
      sorted.push(right.shift)
    end
  end
  right.each {|el| sorted.push(el)} if !right.empty?
  left.each {|el| sorted.push(el)} if !left.empty?
  sorted
end

def merge_sort(ar)
  return ar if ar.size < 2
  mid = (ar.size-1)/2
  left = merge_sort(ar.slice(0..mid))
  right = merge_sort(ar.slice(mid+1..-1))
  merge(left, right)
end

# Now the secret sauce
def max_time_range(ar)
  prev = ar.first
  res = []
  ar.slice(1..-1).each do |el|
    cur = el
    if cur[0] < prev[1]
      prev = [prev[0], [prev[1], cur[1]].max]
    else
      res.push(prev)
      prev = cur
    end
  end
  res.push(prev)
  res
end

def do_stuff(ar)
  str = ""
  max_time_range(merge_sort(group_intervals(ar))).each {|el| str += " " + el.to_s}
  puts str
end

inputs = [
  "10 18 4 6 14 16 5 8",
  "5 14 1 4 13 19 3 6 9 8",
  "11 12 4 7 14 16 0 2 13 15 8 10",
  "0 1 14 16 4 8 10 12 7 9 8 15 3 5"
].map {|str| str.split(" ").map {|str| str.to_i}}

inputs.each {|input| do_stuff(input)}