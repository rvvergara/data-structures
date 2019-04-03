BLOCKS = 
  'B O
  X K
  D Q
  C P
  N A
  G T
  R E
  T G
  Q D
  F S
  J W
  H U
  V I
  A N
  O B
  E R
  F S
  L Y
  P C
  Z M'

inputs = ['A', 'BBB', 'BARK', 'BOOK', 'TREAT', 'COMMON', 'SQUAD', 'CONFUSE']

def word_can_be_formed?(str, blocks)
  blocks_copy = blocks.slice(0..-1)
  str_out = ''
  str.chars.each do |letter|
    blocks_copy.each do |block|
      if(block.include?(letter))
        index = blocks_copy.index(block)
        str_out += letter
        blocks_copy = blocks_copy[0,index] + blocks_copy.slice(index+1..-1)
        break
      end
    end
  end
  str_out == str
end

def process_inputs(arr)
  pairs = []
  pair = []
  until arr.empty?
    if pair.size == 2
      pairs.push(pair)
      pair = []
    else
      pair.push(arr.shift)
    end
  end
  pairs.push(pair)
  pairs
end

def do_stuff(word)
  print word_can_be_formed?(word, process_inputs(BLOCKS.split))  
  puts
end

inputs.each {|input| do_stuff(input)}