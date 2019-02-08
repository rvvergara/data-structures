# Ryan's version
def partition(ar, lo = 0, hi = (ar.size - 1))
  pivot = ar[hi]
  ar.each_with_index do |num, i|
    # check each element -> less or equal to pivot?
    # yes
    if num <= pivot
      # check the left of num 4 the first number bigger then pivot,then swap num's position w/ that bigger val then break iteration
      ar.each_with_index do |val, j|
        if val > pivot || j == i
          ar[i], ar[j] = val, num
          break
        end
      end
    end
    break if i == hi
  end
  puts ar.join(" ")
  ar
end

def quicksort(ar, lo = 0, hi = (ar.size - 1))
  return ar if lo >= hi
  pivot = ar[hi]
  partition(ar, lo, hi)
  index = ar.index(pivot)
  # Quicksort on left side
  quicksort(ar, lo, index - 1)
  # Quicksort on right side
  quicksort(ar, index + 1, hi)
  ar
end

def do_stuff(ar)
  quicksort(ar)
end

str_inputs = [
  "1 3 9 8 2 7 5",
  "9 8 6 7 3 5 4 1 2",
  "406 157 415 318 472 46 252 187 364 481 450 90 390 35 452 74 196 312 142 160 143 220 483 392 443 488 79 234 68 150 356 496 69 88 177 12 288 120 222 270 441 422 103 321 65 316 448 331 117 183 184 128 323 141 467 31 172 48 95 359 239 209 398 99 440 171 86 233 293 162 121 61 317 52 54 273 30 226 421 64 204 444 418 275 263 108 10 149 497 20 97 136 139 200 266 238 493 22 17 39"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|str| str.to_i}}