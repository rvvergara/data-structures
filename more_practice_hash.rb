require 'set'

def do_stuff(ar, k)
  pairs = {}
  pair_arr = []
  output = ""
  ar.each {|num| pairs[num] = [num]}
  
  pairs.keys.each do |key|
    ar.each {|num| pairs[key].push(num) if num + key == k}
  end
  
  pairs.each do |key,val|
    if pairs[key].size == 2
      pair_arr.push(val)
    end
  end

  pair_sets = Set.new

  pair_arr.each {|pair| pair_sets.add(Set.new(pair))}

  pair_sets.to_a.map {|set| set.to_a}.each {|arr| output += "#{arr.join(" ")} "}
  puts output
end

str_inputs = [
  "14 1 3 5 11",
  "12 1 9 11 13 2 3 7",
  "21 8 17 5 11 9 6 3 2 15",
  "0 -8 7 11 8 5 9 3 6 2 -9 4",
  "40 17 -20 21 -3 33 10 6 -11 19 40 11 17 56 33 72 5 1 36 51"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|num| num.to_i}}

final_inputs = num_inputs.map {|input| [input[0]]+[input.slice(1..-1)]}

final_inputs.each {|input| do_stuff(input[1],input[0])}

# print final_inputs
# puts "\n"
