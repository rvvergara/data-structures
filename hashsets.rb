require 'set'
# Node class to store numbers for use in finding prime numbers
class Node
  attr_accessor :data, :marked
  def initialize(data = nil)
    @data = data
    @marked = false
  end
end

def mark_nodes(node_arr,p)
  max_data = node_arr.map {|node| node.data}.max
  multiples = ((2)..max_data).map {|num| num if num % p == 0}.compact
  node_arr.each {|node| node.marked = true if multiples.include?(node.data) && !node.marked && node.data != p}
end

# Sieve's algorithm for finding prime numbers
def find_prime(candidates, p = 2)
  # 1. Find all multiples of p in candidates (not including p and then mark them)
  mark_nodes(candidates, p)
  unmarked = candidates.map {|node| node.data if(!node.marked)}.compact
  
  # 2. Return unmarked if there is no more number in candidates that is still unmarked that is higher than p
  return unmarked if !unmarked.map {|num| num > p}.any?
  # 3. Else assign to p the unmarked[0].data and return the result or recursively calling method with new p
  p = unmarked.map {|node| node if node > p }.compact[0]
  find_prime(candidates, p)
end

def hash_function(ar,mod)
  num_hash = {}
  keys_arr = ar.map { |num| num.abs % 11 }
  output = ""
  ar.each_with_index { |val, i| num_hash[keys_arr[i]].nil? ? num_hash[keys_arr[i]] = Set.new{val} : num_hash[keys_arr[i]].add(val) }
  num_hash
end

def do_stuff(ar)
  non_primes = []
  max_data = ar.max
  ar.sort.each {|num| (2..max_data).to_a.each {|div| non_primes.push(num) unless non_primes.include?(num) || num % div != 0 || num == div}}
  candidates = (ar - non_primes).map {|num| Node.new(num)}
  min_data = candidates.map {|node| node.data}.min
  puts candidates.size
end

str_inputs = [
  "2 3 5 6 9",
  "121 17 21 29 11 341 407 19 119 352",
  "7 6 7 3 77 14 28 35 42",
  "55 11 33 25 15 66 35 44 16 9 22",
  "8035 6759 6113 8721 5595 5985 4643 849 629 8933 3659 6086 4337 4589 9119 8049 9337 3407 28 6771 1069 3500 8549 9251 2131 5425 2471 11 8173 5277",
  "6358 8623 2345 1385 6037 9161 796 8125 8829 9747 2834 3579 1043 1880 3508 9822 8739 2372 7723 5049 2661 5982 9692 9427 562 6617 3756 396 7009 3907 6920 3766 6139 6310 7011 650 4758 5153 6200 3146",
  "1817 2231 217 371 155 943 1219 553 679 1057 485 253 287 299 437 713 3473",
  "1817 41 2231 217 3631 371 155 943 1219 553 8803 679 1057 485 253 287 299 437 713 3473"
]

num_inputs = str_inputs.map {|str| str.split(" ").map {|num| num.to_i}}

node_inputs = str_inputs.map {|str| str.split(" ").sort.map {|num| Node.new(num.to_i)}}

num_inputs.each {|input| do_stuff(input)}

# primes = find_prime((2..(num_inputs[5].max)).map{|num| Node.new(num)})
# print hash_function(primes, primes.size)
# puts "\n"