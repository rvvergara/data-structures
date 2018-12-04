def hanoi_tower_recursive(disks,start = 1,goal = 3,mid = 2)
  # Base case is when disks = 3
  if disks == 3
    output = "#{start}->#{goal} #{start}->#{mid} #{goal}->#{mid} #{start}->#{goal} #{mid}->#{start} #{mid}->#{goal} #{start}->#{goal}"
    return output
  end

  output = "#{hanoi_tower_recursive(disks -1,start, mid, goal)} #{start}->#{goal} #{hanoi_tower_recursive(disks - 1, mid, goal, start)}"

end

def do_stuff(a)
  puts hanoi_tower_recursive(a)
  puts "\n"
end

inputs = [3, 4, 5, 6]

inputs.each {|a| do_stuff(a)}