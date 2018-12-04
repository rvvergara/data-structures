def hanoi_tower(starting,goal)
  output = ""
  temp = 0
  tower_keys = [starting,goal]
  towers = {}
  
  (1..3).to_a.each {|i| !tower_keys.include?(i) ? temp += i : nil}
  tower_keys.push(temp)
  
  tower_keys.each {|key| towers[key] = key == goal ? ["b","a"] : []}

  # 1. Check if towers[temp].empty? if yes then push towers[starting].pop
  towers[temp].push(towers[starting].pop) if towers[temp].empty?
  output += "#{starting}->#{temp} "

  # 2. Check if towers[goal].empty? if yes then push towers[starting].pop
  towers[goal].push(towers[starting].pop) if towers[goal].empty?
  output += "#{starting}->#{goal} "

  # 3. towers[goal].push(towers[temp].pop)
  towers[goal].push(towers[temp].pop)
  output += "#{temp}->#{goal}"
  puts output
end

inputs = [[1,3],[1,2],[2,3],[2,1]]

inputs.each {|pair| hanoi_tower(pair.first, pair.last)}