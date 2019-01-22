def insertion_sort_1(ar)
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
    print ar.join(" ")
    puts "\n"
  end
  ar[index] = val
  print ar.join(" ")
  puts "\n"
end

def do_stuff(ar)
  print insertion_sort_1(ar)
  puts "\n"
end

str_inputs = [
  "1 3 2",
  "1 4 6 9 3",
  "1 3 5 9 13 22 27 35 46 51 55 83 87 23",
  "2 3 4 5 6 7 8 9 10 1"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|num| num.to_i}}

num_inputs.each {|input| do_stuff(input)}

# insertion_sort_1(num_inputs[1])