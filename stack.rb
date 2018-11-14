require_relative 'singly_linked_list'

class Stack
  
  def initialize
    @list = LinkedList.new
  end

  def push(data)
    @list.push(data)
  end

  def pop
    return "Stack is empty" if @list.length == 0
    @list.pop
  end

  def peek
    self.is_empty? ? "No data in the stack" : @list.head.data
  end

  def is_empty?
    @list.length == 0
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