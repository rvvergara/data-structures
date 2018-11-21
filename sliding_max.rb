require_relative "stack"
# Array version
def do_stuff(arr, k, output = "")
  return arr.max.to_s if arr.size <= k
  arr2 = arr.slice(0,k)
  output += arr2.max.to_s + " " + do_stuff(arr.slice(1..-1), k, output)
end

def do_stuff_list(arr, k, output = "")
  stack = Stack.new
  arr.slice(0...k).each {|el| stack.push(el)}
  nxt = arr.slice(1..-1).size < k ? "" : do_stuff_list(arr.slice(1..-1),k,output)
  output += stack.max.to_s + " " + nxt
end

k, input, input2, input3 = [3, [1, 3, 5, 7, 9, 2],[9, 7, 3, 0, -1, 11, 3], [2, 2, 3, 3, 7, 7, 2, 2, 3, 3]
]

puts do_stuff(input, k)
puts do_stuff(input2, k)
puts do_stuff(input3, k)

puts do_stuff_list(input,k)
puts do_stuff_list(input2,k)
puts do_stuff_list(input3,k)