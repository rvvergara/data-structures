def insertion_sort_1(ar)
  ar_copy = ar.slice(0..-2)+[nil]
  val = ar.last
  
  ar_copy.each_with_index do |num, i|
    if num > val
      last_ind = ar_copy.size - 1
      (i..last_ind).reverse_each do |index|
        ar_copy[index] = ar_copy[index - 1]
      end
      ar_copy[i] = val
      return ar_copy
    end
  end
end

str_inputs = [
  "1 3 2",
  "1 4 6 9 3",
  "1 3 5 9 13 22 27 35 46 51 55 83 87 23",
  "2 3 4 5 6 7 8 9 10 1"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|num| num.to_i}}
print insertion_sort_1(num_inputs[0])
puts "\n"