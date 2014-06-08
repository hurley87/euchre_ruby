#each card has a rank and suit 
#must be able to acess the rank and suit of each card
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

#deck is made up of 25 cards, 6 cards in each suit with one Joker
class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    #    11 - Jack, 12 - Queen, 13 - King, 14 - Ace
    rank = [9, 10, 11, 12, 13, 14] 
    #    S - Spades, C - Clubs, H - Hearts, D - Diamonds
    suit = %w[S C H D]
    cards_counter = 0
    rank.each do |r|
      suit.each do |s|
        @card = Card.new(r, s)
        @cards[cards_counter] = @card
        cards_counter += 1
      end
    end
      @cards[24] = Card.new(17, "S") #put Joker in the Deck
      @cards.shuffle! #need to shuffle that deck
  end
end

#give 11 cards to each player and a decision_card
class Deal
  attr_accessor :p1_hand, :p2_hand, :decision_card
  def initialize 
    new_deck = Deck.new
    @p1_hand = new_deck.cards[0..10]
    @p2_hand = new_deck.cards[11..21]
    @decision_card = new_deck.cards[22]
  end 
end


