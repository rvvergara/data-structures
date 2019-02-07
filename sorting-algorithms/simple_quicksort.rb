# Ryan's
def partition(ar)
  pivot = ar[0]

  left = ar.slice(1..-1).map {|num| num if num < pivot}.compact
  right = ar.slice(1..-1).map {|num| num if num > pivot}.compact

  output = left + [pivot] + right
  index = output.index(pivot)
  output
end

def simple_quicksort(ar)
  return partition(ar) if ar.size < 2
  partitioned = partition(ar)
  pivot = ar[0]
  j = partitioned.index(pivot)
  left = j < 1 ? [] : simple_quicksort(partitioned.slice(0..j-1))
  right = ar.size - 1 <= j ? [] : simple_quicksort(partitioned.slice(j+1..-1))
  output = left + [pivot] + right
  puts output.join(" ")
  output
end

def do_stuff(ar)
  simple_quicksort(ar)
end

str_inputs = [
  "5 8 1 3 7 10 2",
  "9 8 6 7 3 5 4 1 2",
  "406 157 415 318 472 46 252 187 364 481 450 90 390 35 452 74 196 312 142 160 143 220 483 392 443 488 79 234 68 150 356 496 69 88 177 12 288 120 222 270 441 422 103 321 65 316 448 331 117 183 184 128 323 141 467 31 172 48 95 359 239 209 398 99 440 171 86 233 293 162 121 61 317 52 54 273 30 226 421 64 204 444 418 275 263 108 10 149 497 20 97 136 139 200 266 238 493 22 17 39 "
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|str| str.to_i}}

num_inputs.each {|input| do_stuff(input)}