def hanoi_tower(starting, goal)
  output = ""
  tower_keys = [starting, goal]
  temp = 0

  # Set temp
  (1..3).to_a.each {|i| !tower_keys.include?(i) ? temp += i : nil }

  # 1. Move from starting peg to temp peg
  output += "#{starting}->#{temp} "

  # 2. Move from starting to goal peg
  output += "#{starting}->#{goal} "

  # 3. Move from temp to goal
  output += "#{temp}->#{goal}"

  puts output
end

inputs = [[1,3],[1,2],[2,3],[2,1]]

inputs.each {|pair| hanoi_tower(pair.first, pair.last)}