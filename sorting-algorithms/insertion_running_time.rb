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

def do_stuff(ar)
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
  puts count
end

str_inputs = [
  "2 1 3 1 2",
  "1 1 2 2 3 3 5 5 7",
  "10 9 8 7 6 5 4 3 2 1",
  "406 157 415 318 472 46 252 187 364 481 450 90 390 35 452 74 196 312 142 160 143 220 483 392 443 488 79 234 68 150 356 496 69 88 177 12 288 120 222 270 441 422 103 321 65 316 448 331 117 183 184 128 323 141 467 31 172 48 95 359 239 209 398 99 440 171 86 233 293 162 121 61 317 52 54 273 30 226 421 64 204 444 418 275 263 108 10 149 497 20 97 136 139 200 266 238 493 22 17 39"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|num| num.to_i}}

num_inputs.each {|input| do_stuff(input)}