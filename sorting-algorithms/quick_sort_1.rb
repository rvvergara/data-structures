def do_stuff(ar)
  pivot = ar[0]

  left = ar.slice(1..-1).map {|num| num if num < pivot}.compact
  right = ar.slice(1..-1).map {|num| num if num > pivot}.compact

  output = left + [pivot] + right
  puts output.join(" ")
end

str_inputs = [
  "4 5 3 9 1",
  "2 10 3 7 9 4 6 12 8",
  "45 25 46 48 28 6 13 5 36 44 7 4 11 30 24 34 15 31 38 49"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|str| str.to_i}}

num_inputs.each {|input| do_stuff(input)}