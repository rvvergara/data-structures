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
# 2. Sort the finishing times (using any of the sorting algos)
def merge(left, right)
  sorted = []
  while !left.empty? && !right.empty?
    if left.first[1] < right.first[1] || right.empty?
      if sorted.empty?
        sorted.push(left.shift)
      else
        left.first[0] > sorted.last[1] ? sorted.push(left.shift) : left.shift
      end 
    elsif right.first[1] <= left.first[1] || left.empty?
      if sorted.empty?
        sorted.push(right.shift)
      else
        right.first[0] > sorted.last[1]? sorted.push(right.shift) : right.shift
      end
    end
  end
  right.each {|el| sorted.push(el) if el[0] > sorted.last[0]} if !right.empty?
  left.each {|el| sorted.push(el) if el[0] > sorted.last[0]} if !left.empty?
  sorted
end

def merge_sort(ar)
  return ar if ar.size < 2
  mid = (ar.size-1)/2
  left = merge_sort(ar.slice(0..mid))
  right = merge_sort(ar.slice(mid+1..-1))
  merge(left, right)
end

def do_stuff(ar)
  str = ""
  merge_sort(group_intervals(ar)).each {|el| str += " " + el.to_s}
  puts str
end


inputs = [
  "4 8 1 3 7 9 5 6",
  "3 8 1 2 3 9 1 5 4 5 8 14",
  "0 1 14 16 4 8 10 12 7 9 8 15 3 5",
  "2 6 5 10 7 12 0 9 4 8"
].map {|str| str.split(" ").map {|str| str.to_i}}

inputs.each {|input| do_stuff(input)}
