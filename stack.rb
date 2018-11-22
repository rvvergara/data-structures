# Stack implemented using linked list as internal data structure
require_relative 'singly_linked_list'

class Stack
  attr_reader :size
  def initialize
    @list = LinkedList.new
    @least = nil
    @most = nil
    @min_list = LinkedList.new
    @max_list = LinkedList.new
    @size = @list.length
  end

  def push(data)
    @list.push(data)
    # Reassigning minimum
    if @least.nil? || @min_list.head.nil? || data < @least 
      @min_list.commit(data)
      @least = data
    else
      nil
    end
    # Reassigning maximum
    if @most.nil? || @max_list.head.nil? || data > @most 
      @max_list.commit(data)
      @most = data
    else
      nil
    end
    @size += 1
    self
  end

  def pop
    popped = @list.pop
    # Reassign minimum when popping
    if popped == @min_list.head.data
      @min_list.reset
      @least = @min_list.head.nil? ? nil : @min_list.head.data
    else
      nil
    end
    # Reassigning maximum when popping
    if popped == @max_list.head.data
      @max_list.reset
      @most = @max_list.head.nil? ? nil : @max_list.head.data
    else
      nil
    end
    @size -= 1
    popped
  end

  def min
    @least
  end

  def max
    @most
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
  
  arr.each { |el| el == -1 ?  output += tmp.pop.to_s + " ": tmp.push(el)}

  output
end

# puts do_stuff(input)