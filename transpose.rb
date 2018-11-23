# RyanV's solution: 

def do_stuff(text)
  # T0 -> declare variables stack and temp as both arrays
  stack, temp = [[],[]]
  # T1 -> traverse text for each character
  text.chars.each do |char|
    # T2 -> check if char is 'n'
    if char == "n"
      # T3 -> if it is then pop stack and push the popped item to temp eveytime the last element in stack is a 'g' this will ensure that the there won't be a 'g' immediately before 'n'. Temp will contain as many 'g's as long as 'n' cannot be pushed to the stack yet
      temp.push(stack.pop) until stack[-1] != "g"
      # T4 -> when all 'g' are gone from stack then push the letter 'n'
      stack.push(char)
      # T5 -> afterwards push to stack all letter g's in temp until temp becomes empty (remember that temp is populated with g's)
      stack.push(temp.pop) until temp.empty?
    else
      # T6 -> if char is not 'n' then simply push it to stack
      stack.push(char)
    end
  end
  # T7 -> final result is printing the string version of stck
  puts stack.join
end

texts = ["he was searchign on Bign for signign kigns",
  "rignadingdiggn!",
  "gngngnnggnngggnnn",
  "pign me when you see ggn",
  "ggggggnnnnnn"
]

texts.each {|text| do_stuff(text)}
