class Player
  attr_accessor :hand
  def initialize(args)
    @hand = args[:hand]
  end
  
  def bid(card)
    index = hand.cards.index(card)
    hand.cards = hand.cards[0, index] + hand.cards[index + 1, hand.cards.size - index]
  end

  def score
    hand.cards.reduce {|a, b| a + b}
  end
end

class Hand
  attr_accessor :cards
  def initialize
    @cards = (1..13).to_a
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
    index = deck.cards.index(face)
    if bid1 != bid2
      deck.cards = deck.cards[0, index] + deck.cards[index + 1, deck.cards.size - index]
      player1.bid(bid1)
      player2.bid(bid2)
      compare_and_award(bid1, bid2, face)
    end
  end

  def cycle(game_ar)
    face = 1
    game_ar.each do |game_turn|
      turn(face, game_turn[0], game_turn[1])
      face += 1 if game_turn[0] != game_turn[1]
    end
    [player1.score, player2.score].join(" ")
  end

  private

  def compare_and_award(bid1, bid2, face)
    if bid1 > bid2
      player1.hand.cards.push(face)
      player1.hand.cards.sort!
    elsif bid2 > bid1
      player2.hand.cards.push(face)
      player2.hand.cards.sort!
    end
  end
end

def do_stuff(arr, game_args)
  game_class = game_args[:game_class]
  player_class = game_args[:player_class]
  hand_class = game_args[:hand_class]
  arr.each do |input|
    player1 = player_class.new({hand: hand_class.new})
    player2 = player_class.new({hand: hand_class.new})
    game = game_class.new({deck: hand_class.new, player1: player1, player2: player2})
    puts game.cycle(process_inputs(input))
  end
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

player1 = Player.new({hand: Hand.new})
player2 = Player.new({hand: Hand.new})

game = Game.new({deck: Hand.new, player1: player1, player2: player2})

inputs = [
  '1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12 13 13 1',
  '1 2 4 3 5 1 2 6 9 7 10 1 2 11 11 4 13 12 3 10 3 7 12 13 8 12',
  '2 1 3 2 4 3 5 5 6 4 1 5 7 6 8 7 9 8 10 9 11 11 12 12 13 13 1 10 12 11 13 12 5 13',
  '1 2 4 3 5 1 2 6 9 7 8 8 10 1 13 13 12 12 2 11 13 13 12 12 11 4 13 12 3 10 9 7 12 13 8 12'
].map {|input| input.split.map{|s| s.to_i}}

do_stuff(inputs, {game_class: Game, player_class: Player, hand_class: Hand})