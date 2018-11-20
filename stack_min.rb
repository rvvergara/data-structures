# Stack implemented using linked list as internal data structure
require_relative 'singly_linked_list'

class Stack
  attr_reader :min_list
  def initialize
    @list = LinkedList.new
    @least = nil
    @min_list = LinkedList.new
  end

  def push(data)
    @list.push(data)
    if @least.nil? || @min_list.head.nil? || data < @least 
      @min_list.commit(data)
      @least = data
    else
      nil
    end
    @least
  end

  def pop
    popped = @list.pop
    if popped == @min_list.head.data
      @min_list.reset
      @least = @min_list.head.nil? ? nil : @min_list.head.data
    else
      nil
    end
  end

  def min
    @min_list.head.data
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