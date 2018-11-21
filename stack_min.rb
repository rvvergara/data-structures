# Stack implemented using linked list as internal data structure
require_relative 'singly_linked_list'
require_relative 'stack.rb'

input = [3,5,-1,-1,2,7,11,-1,-1]
input_min = [3, 5, -1, -1, 7, 2, 11, -1, -1, 9]

input2 = [9 ,12 ,11 ,6 ,4 ,-1 ,7 ,-1 ,-1 ,15 ,22 ,7]

input3 = [4 ,6 ,-1 ,7 ,-1 ,3 ,-1 ,9 ,-1 ,2 ,-1 ,-1 ,20 ,1]

def do_stuff(arr)
  stack, output = [Stack.new, ""]
 
  arr.each do |el|
    if el == -1
      stack.pop
    else
      stack.push(el)
      output += stack.min.to_s + " "
    end
  end
  puts output
end

do_stuff(input_min)
do_stuff(input2)
do_stuff(input3)