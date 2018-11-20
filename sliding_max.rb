def do_stuff(arr, k, output = "")
  return arr.max.to_s if arr.size == k
  arr2 = arr.slice(0,k)
  output += arr2.max.to_s + " " + do_stuff(arr.slice(1..-1), k, output)
end

k, input, input2, input3 = [3, [1, 3, 5, 7, 9, 2],[3, 9, 7, 3, 0, -1, 11, 3], [3, 2, 2, 3, 3, 7, 7, 2, 2, 3, 3]
]

puts do_stuff(input, k)
puts do_stuff(input2, k)
puts do_stuff(input3, k)