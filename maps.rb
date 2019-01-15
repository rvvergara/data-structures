def do_stuff(ar)
  num_map = {}

  ar.each do |num|
    num_map[num].nil? ? num_map[num] = 1 : num_map[num] += 1
  end

  print num_map.key(num_map.values.max)
  puts "\n"
end

str_inputs = [
  "1 2 3 1 5",
  "23 43 67 88 42 35 77 88 99 11",
  "4376 -345 -345 4376 -345 84945 4376 -345 -26509 4376 84945 84945 -26509 896341 4376",
  "2367 -65326 134 -185007 3291 7832 -65326 789 980 -3289 3490",
  "85 105 90 275 30 100 275 110 125 130 275 10 20 30 45 50 275 65 70 111",
  "10 10 20 30 20 20",
  "3 2 19 4 19 19 3 2",
  "3594976 2340 3594976 74390 -453894 32076 42 7888 -21085 -320566"
]

num_inputs = str_inputs.map do |str_row|
  str_row.split(" ").map {|str| str.to_i}
end

num_inputs.each {|input| do_stuff(input)}