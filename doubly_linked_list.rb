class LinkedList
  attr_accessor :head,:data,:next, :length
  def initialize(data = nil)
    @head = nil
    @data = data
    @next = nil
    @length = self.data.nil? ? 0 : 1
  end
  
  def add_next(data)
    if self.data.nil?
      self.data = data
    else
      if self.next.nil?
        self.next = LinkedList.new(data)
        self.next.head = self
      else
        self.next.add_next(data)
      end
      self.length += 1
    end
  end
  
  def add(index, data, i = 0)
    new_node = LinkedList.new(self.data)
    new_node.head = self
    if i == index
      self.next = new_node
      self.data = data
    else
      self.next.add(index, data, i+1)
    end
    self.length += 1
  end
  
  def get(index, i=0)
    i == index ? self.data : self.next.get(index, i + 1)
  end
  
  def remove(index, i=0)
    if i == index
      if self.head.nil?
        if self.next.nil?
          self.data = nil
        else
          self.data = self.next.data
          self.next = self.next.next
        end
      else
        self.head.next = self.next
      end
    else
      self.next.remove(index, i+1)
    end
    self.length > 0 ? self.length -= 1 : self.length = 0
  end
end

list = LinkedList.new
puts "List length: #{list.length}"