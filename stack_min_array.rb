# Stack implemented using array as internal data structure - RyanV
class Stack
  def initialize
    @array = Array.new
    @min = nil
  end

  def push(data)
    @array.push(data)
    @min = @array.min
  end

  def pop
    @array.pop
  end

  def min
    @min
  end
end

stack = Stack.new
input = [3,5,-1,-1,2,7,11,-1,-1]
input_min = [3, 5, -1, -1, 7, 2, 11, -1, -1, 9]

input2 = [9 ,12 ,11 ,6 ,4 ,-1 ,7 ,-1 ,-1 ,15 ,22 ,7]

input3 = [4 ,6 ,-1 ,7 ,-1 ,3 ,-1 ,9 ,-1 ,2 ,-1 ,-1 ,20 ,1]

def do_stuff(arr)
  tmp, output = Stack.new, ""
  
  arr.each { |el| el == -1 ?  output += " " + tmp.pop.to_s : tmp.push(el)}

  output
end

def do_stuff_min(arr)
  stack, output = [Stack.new, ""]
  arr.each { |el| el == -1 ? stack.pop : output += stack.push(el).to_s + " "}
  puts output
end

do_stuff_min(input_min)
do_stuff_min(input2)
do_stuff_min(input3)