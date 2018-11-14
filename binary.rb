class LinkedList
	#setup head and tail
	attr_accessor :head, :tail
	def initialize
		@head = nil
		@tail = nil
	end

  def add(number)
	#your code here
   if self.head.nil? 
     self.head = number
   else
     if self.tail.nil?
       self.tail = LinkedList.new
       self.tail.head = number
     else
       self.tail.add(number)
     end
   end
  end
  
  def get(index, n = 0)
    #your code here
    n == index ? self.head : self.tail.get(index, n + 1)
  end

end


def do_stuff(a, b)
	if a == -9
		@list.add(b)
	elsif a == -6
		puts @list.get(b)
  end  
end

@list = LinkedList.new

do_stuff(-9, 3)
do_stuff(-6, 0)
do_stuff(-9,5)
do_stuff(-9,7)
do_stuff(-6,1)
do_stuff(-9,4)
do_stuff(-6,3)
do_stuff(-6,0)
do_stuff(-9,12)
do_stuff(-9,14)
do_stuff(-6,2)
do_stuff(-6,5)