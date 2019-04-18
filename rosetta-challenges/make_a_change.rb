coin_types = [1, 5, 10, 25]
multiplier_for_x = [1, 2...x]
multiplier_for_y = [0,1...y]
# Determine valid coins based on change needed
def valid_coins(change, coins)
  coins.map { |coin| coin if change >= coin }.compact
end


# Inside valid_coins iterate over each item, multiplying each item by [1,2,3...]
def make_change(change, coins)
  valid_coins = valid_coins(change, coins)
  valid_coins.each do |x|
    multiplier_for_x_arr = (1..valid_coins.max).to_a
    multiplier_for_x_arr.each do |mult|
      multiplier_for_y = (0..)
    end
  end
end

print valid_coins(15, coin_types)
puts
