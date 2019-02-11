# Ryan's version
def partition(ar, lo = 0, hi = (ar.size - 1))
  pivot = ar[hi]
  swap_count = 0
  i = lo
  j = lo
  ar.slice(lo..hi).each do |val|
    if val <= pivot
      ar[i],ar[j] = ar[j],ar[i]
      i+=1
      swap_count += 1
    end
    j+=1
  end
  swap_count
end

def quicksort(ar, lo = 0, hi = (ar.size - 1),count=0)
  return count if lo >= hi
  pivot = ar[hi]
  count = partition(ar, lo, hi) if lo < hi
  j = ar.index(pivot)
  count += quicksort(ar, lo, j-1)
  count += quicksort(ar, j+1, hi)
  count
end

def insertion_sort_1(ar, count)
  val = ar.pop
  ar.push(nil)
  index = 0
  ar.each_with_index do |num,i|
    if num > val
      index = i
      break
    end
  end

  ((index + 1)..(ar.size-1)).reverse_each do |i|
    ar[i] = ar[i - 1]
    count += 1
  end
  ar[index] = val
  count
end

def insertion_pass(ar)
  sorted = [ar[0]]
  count = 0
  ar.each_with_index do |num, i|
    if i > 0
      if num >= sorted.last.to_i
        sorted.push(num)
      else
        sorted.push(num)
        count = insertion_sort_1(sorted, count)
      end
    end
  end
  count
end

def do_stuff(ar)
  quickArr = ar.slice(0..-1)
  insertArr = ar.slice(0..-1)
  puts insertion_pass(insertArr) - quicksort(quickArr)
end

str_inputs = [
  "1 3 9 8 2 7 5",
  "10 9 8 7 6 5 4 3 2 1",
  "406 157 415 318 472 46 252 187 364 481 450 90 390 35 452 74 196 312 142 160 143 220 483 392 443 488 79 234 68 150 356 496 69 88 177 12 288 120 222 270 441 422 103 321 65 316 448 331 117 183 184 128 323 141 467 31 172 48 95 359 239 209 398 99 440 171 86 233 293 162 121 61 317 52 54 273 30 226 421 64 204 444 418 275 263 108 10 149 497 20 97 136 139 200 266 238 493 22 17 39"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|str| str.to_i}}

num_inputs.each {|input| do_stuff(input)}