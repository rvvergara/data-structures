# RyanV
# Array implementation to make solution shorter

def do_stuff(text)
  # 1. Declare an array called unpaired
  unpaired = Array.new
  # 2. Traverse through text characters
  text.chars.each do |char|
  # 3. If char is a key in tags then push it to unpaired
    if tags.keys.include? char
      unpaired.push(char)
  # 4. Else if char is a value in tags (char is a closing tag) then
    elsif tags.values.include? char
  # 5. Pop unpaired and determine if this popped value is an openning tag of char
  # 6. If it is then do nothing otherwise push char into unpaired
      if tags[unpaired.pop] != char then unpaired.push(char); end
    end
  end
  # 7. After all the text is traversed then check whether or not unpaired's length is 0
  puts unpaired.size == 0
end

def tags
  {
    "<" => ">",
    "(" => ")",
    "{" => "}",
    "[" => "]",
  }
end

inputs = ["{}(hello)[world]",
  "[({}{}{})([])]",
  "([)]",
  "(hi))(lo)(",
  "()[]([{[[[{{()}}]]]}])[]()",
  "[({}{}{)}([])]",
  "()[]([{[[[{{()}}]]]}][]()",
  "[({}[])[]()[{()]}]",
  "[{([](){}[](){})}]"
]

inputs.each {|input| do_stuff(input)}