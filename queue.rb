# Queue implemented using linked list as internal data structure
require_relative 'singly_linked_list'

class Queue

  def initialize
    @list = LinkedList.new
  end

  def push(data)
    @list.push(data)
    data
  end

  def poll
    return -1 if @list.length == 0
    @list.reset
  end


  def peek
    self.is_empty? ? "No data in the stack" : @list.head.data
  end

  def is_empty?
    @list.length == 0
  end

end

def do_stuff(arr)
  tmp, output = Queue.new, ""
  
  arr.each { |el| el == -1 ?  output += " " + tmp.poll.to_s : tmp.push(el)}

  output
end

input = [3,5,-1,6,-1,-1,-1]

puts do_stuff(input)