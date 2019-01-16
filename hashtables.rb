def hash_function(ar,mod)
  num_hash = {}
  keys_arr = ar.map { |num| num.abs % 11 }
  output = ""
  ar.each_with_index { |val, i| num_hash[keys_arr[i]].nil? ? num_hash[keys_arr[i]] = [val] : num_hash[keys_arr[i]].push(val) }
  num_hash
end

def do_stuff(ar)
  output = ""
  num_hash = hash_function(ar,11) 
  num_hash.keys.sort.map { |key| num_hash[key] }.each { |num_arr| num_arr.each { |num| output += "#{num} " } }
  print output
  puts "\n"
end

str_inputs = [
  "12 24 125 5 91 1106 2 1021 29 3536 10",
  "2 341 73 8265 234004 602 7400000 200000000",
  "2367 -65325 134 -185007 3291 7832 -65326 789 980 -3289 3",
  "4376 -345 -342 4376 -345 84945 4376 -347 -26509 4376 84945 84944 -26509 896341 4376",
  "10935 12732 -3058 1673 14971 5701 18342 4590 -10248 -11243 -5848 14836 7648 -3772 -8700 19165 -16397 -13192 -18946 14203"
]

num_inputs = str_inputs.map do |str_row|
  str_row.split(" ").map {|str| str.to_i}
end

num_inputs.each {|input| do_stuff(input)}

puts "\n"