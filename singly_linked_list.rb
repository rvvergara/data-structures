class LinkedList

  class Node
    attr_accessor :next, :data
    def initialize(data)
      @data = data
      @next = nil
    end
  end

  attr_reader :head
  attr_accessor :length
  def initialize(data = nil)
    @head = nil
    @length = @head.nil? ? 0 : 1
    self.commit(data)
  end
  
  def commit(data)
    new_node = Node.new(data)
    if @head.nil?
      nil
    else
      @head.data.nil? ? nil : new_node.next = @head
    end
    @head = new_node
    @head.data.nil? ? nil : @length += 1
    self
  end

  def insert(depth, data)
    if depth == 1
      self.commit(data)
      @length -= 1
    else
      self.add_middle(@head, depth, data)
    end
    self.length += 1
    self
  end

  def push(data)
    if self.length == 0
      self.commit(data)
      @length -= 1
    else
      self.add_last(@head, data, @length)
    end
    @length += 1
    self
  end

  def pop
    removed_data = self.get(@length)
    self.remove_at(@length)
    removed_data
  end

  def reset
    target_data = @head.data
    @head = @head.next
    @length -= 1
    target_data
  end

  def remove_at(depth)
    return self.reset if depth == 1
    @length -= 1
    self.delete_node(@head, depth)
  end

  def get(depth)
    self.nth(@head, depth)
  end

  def nth(node, depth, i = 1)
    i == depth ? node.data : self.nth(node.next, depth, i+1)
  end

  def add_middle(head, depth, data, i = 1)
    new_node = Node.new(data)
    if i == depth - 1
      prev_node = head
      next_node = head.next
      new_node.next = next_node
      prev_node.next = new_node
    else
      self.add_middle(head.next, depth, data, i + 1)
    end
  end

  def add_last(head, data, length, i = 1)
    new_node = Node.new(data)
    if i == length
      head.next = new_node
    else
      self.add_last(head.next, data, length, i + 1)
    end
  end

  def delete_node(head, depth, i = 1)
    if head.next.nil?
      target_data = head.data
      head.data = nil
      target_data
    elsif i == depth - 1
      prev_node = head
      target_data = head.next.data
      new_next = head.next.next
      prev_node.next = new_next
      target_data
    else
      self.delete_node(head.next, depth, i+1)
    end
  end

end


def do_stuff(a, b)
	if a == -9
		@list.push(b)
	elsif a == -6
    puts @list.get(b + 1)
  elsif a == -1
    puts @list.remove_at(b + 1) 
  else
    @list.insert(a + 1,b)
  end  
end

def do_array_stuff(arr)
  arr.map()
end

tasks_arr = 
"-9 3
-6 0
-9 5
-9 7
-6 1
-9 4
-6 3
-6 0
-9 12
-9 14
-6 2
-6 5".split("\n").map {|pair| pair.split(" ").map {|s| s.to_i}}

complete_tasks_arr = 
"-9 3
-6 0
-9 5
1 11
-9 7
3 13
3 14
-6 1
-6 3
-1 2
-1 0
-6 3
2 10
1 9
-6 5
-6 3
-1 0
-1 0
-1 0
-1 0
-1 0
-9 2
-9 3
1 1
3 5
-6 4
-6 2".split("\n").map {|pair| pair.split(" ").map {|s| s.to_i}}

@list = LinkedList.new

# complete_tasks_arr.each {|task| do_stuff(task.first, task.last)}