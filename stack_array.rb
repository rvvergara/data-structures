# Stack implemented using array as internal data structure
class Stack
  
  def initialize
    @arr = Array.new
  end

  def push(data)
    @arr.push(data)
  end

  def pop
    return "Stack is empty" if @arr.length == 0
    @arr.pop
  end

  def peek
    self.is_empty? ? "No data in the stack" : @arr[0]
  end

  def is_empty?
    @arr.length == 0
  end

end

stack = Stack.new
input = [3,5,-1,-1,2,7,11,-1,-1]

def do_stuff(arr)
  tmp, output = Stack.new, ""
  
  arr.each { |el| el == -1 ?  output += " " + tmp.pop.to_s : tmp.push(el)}

  output
end

puts do_stuff(input)
puts stack.peek