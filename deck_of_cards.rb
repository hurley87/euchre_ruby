#in any deck of cards each card has a rank and suit
class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  def card_to_string
    @rank.to_s + " of " + @suit
  end
end

#
class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    rank = [9, 10, 11, 12, 13, 14]
    suit = %w[S C H D]
    cards_counter = 0
    rank.each do |r|
      suit.each do |s|
        @card = Card.new(r, s)
        @cards[cards_counter] = @card
        cards_counter += 1
      end
    end
      @cards[24] = Card.new(17, "S")
      @cards.shuffle!
  end
end

class Deal
  attr_accessor :p1_hand, :p2_hand, :trump_card
  def initialize 
    new_deck = Deck.new
    @p1_hand = new_deck.cards[0..10]
    @p2_hand = new_deck.cards[11..21]
    @trump_card = new_deck.cards[22]
  end 
end


