def insertion_sort_1(ar)
  val = ar.pop
  ar.push(nil)
  ar.each_with_index do |num, i|
    if num > val
      last_ind = ar.size - 1
      (i..last_ind).reverse_each do |index|
        ar[index] = ar[index - 1]
      end
      ar[i] = val
      return ar
    end
  end
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