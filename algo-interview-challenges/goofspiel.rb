class Player
  attr_reader :hand, :score
  def initialize(args)
    @hand = args[:hand]
    @score = 0
  end

  def bid(card)
    card = hand.cards[card]
    bid = card.value
    bid
  end

  def add_score(bid, value)
    @score += value
    hand.cards.delete(bid)
  end

  
end

class Hand
  attr_reader :cards
  def initialize(args)
    @cards = {
      1=>  args[:card1],
      2=>  args[:card2],
      3=>  args[:card3],
      4=>  args[:card4],
      5=>  args[:card5],
      6=>  args[:card6],
      7=>  args[:card7],
      8=>  args[:card8],
      9=>  args[:card9],
      10=> args[:card10],
      11=> args[:card11],
      12=> args[:card12],
      13=> args[:card13],
    }
  end
end

class Card
  attr_reader :value
  def initialize(value)
    @value = value
  end
end

class Game
  attr_reader :deck, :player1, :player2
  def initialize(args)
    @deck = args[:deck]
    @player1 = args[:player1]
    @player2 = args[:player2]
  end

  def turn(face, bid1, bid2)
    @player1.bid(bid1)
    @player2.bid(bid2)
    compare(face, bid1, bid2)
    @deck.cards.delete(face) if bid1 != bid2
  end

  private

  def compare(face, bid1, bid2)
    if(bid1 > bid2)
      @player1.add_score(bid1, face)
    elsif bid2 > bid1
      @player2.add_score(bid2, face)
    end
  end
end

cards = {
  :card1 => Card.new(1),
  :card2 => Card.new(2),
  :card3 => Card.new(3),
  :card4 => Card.new(4),
  :card5 => Card.new(5),
  :card6 => Card.new(6),
  :card7 => Card.new(7),
  :card8 => Card.new(8),
  :card9 => Card.new(9),
  :card10 => Card.new(10),
  :card11 => Card.new(11),
  :card12 => Card.new(12),
  :card13 => Card.new(13)
}

player1 = Player.new({hand: Hand.new(cards)})
player2 = Player.new({hand: Hand.new(cards)})

game = Game.new({deck: Hand.new(cards), player1: player1, player2: player2})

game.turn(1, 1, 2)
game.turn(2, 2, 3)
game.turn(3, 3, 4)
game.turn(4, 4, 5)
game.turn(5, 5, 6)
game.turn(6, 6, 7)
game.turn(7, 7, 8)
game.turn(8, 8, 9)
game.turn(9, 9, 10)
game.turn(10, 10, 11)
game.turn(11, 11, 12)
game.turn(12, 12, 13)
game.turn(13, 13, 1)

puts game.player1.score
puts game.player2.score

inputs = [
  '1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12 13 13 1'
].map {|input| input.split.map{|s| s.to_i}}

puts
print inputs[0]
puts