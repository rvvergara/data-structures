class Queue
  
  def initialize
    @arr = Array.new
  end

  def queue(data)
    @arr.push(data)
    self
  end

  def poll
    @arr.empty? ? -1 : @arr.shift
  end

  def peek
    @arr.empty? ? "No data in the queue" : @arr[0]
  end

end

input = [3, 5, -1, 6, -1, -1, -1]

def do_stuff(arr)
  tmp, output = Queue.new, ""
  
  arr.each { |el| el == -1 ?  output += " " + tmp.poll.to_s : tmp.queue(el)}

  output
end

puts do_stuff(input)

# queue = Queue.new
# queue.queue(3)
# queue.queue(5)
# puts queue.poll
# queue.queue(6)
# puts queue.poll