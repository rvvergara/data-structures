class Node
  attr_accessor :data, :marked
  def initialize(data = nil)
    @data = data
    @marked = false
  end
end

def mark_nodes(node_arr,p)
  max_data = node_arr.map {|node| node.data}.max
  multiples = (2..max_data).map {|num| num if num % p == 0}.compact
  node_arr.each {|node| node.marked = true if multiples.include?(node.data) && !node.marked && node.data != p }
end

def find_prime(max_num, candidates, p = 2)
  mark_nodes(candidates,p)
  
  candidates.each do |node|
    if !node.marked && node.data > p
      p = node.data
      break
    else
      return candidates.map {|node| node.data if !node.marked}.compact
    end
  end
  find_prime(max_num, p)
end


candidates = (2..10000).to_a.map {|integer| Node.new(integer)}
# print find_prime(10000, candidates)

puts "\n"