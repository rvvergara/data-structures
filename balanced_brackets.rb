# RyanV
# Array implementation to make solution shorter

def do_stuff(text)
  unpaired = Array.new
  text.chars.each do |val|
    if tags.keys.include? val
      unpaired.push(val)
    elsif tags.values.include? val
      tags[unpaired.pop] == val ? nil : unpaired.push(val)
    end
  end
  unpaired.size == 0
end

def tags
  {
    "<" => ">",
    "(" => ")",
    "{" => "}",
    "[" => "]",
  }
end

puts do_stuff("()[]([{[[[{{()}}]]]}][]()")
