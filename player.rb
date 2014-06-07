class Player
  attr_accessor :make, :hand, :deal, :name, :score
  def initialize 
    @hand = hand
    @make = false
    @deal = false
    @name = name
    @score = 0
  end
  def order(trump_card)
    #subsitute trump card with card in hand. make trump card suit trump
    @make = true
    puts "you picked up the " + trump_card.card_to_string
    puts "trump is now " + trump_card.suit
    puts "you must swap that card with one of the following cards in your hand,"
    (0..4).each do |i|
      puts i.to_s + " : " + @hand[i].card_to_string
    end
    card_pick = gets.chomp.to_i
    puts "you discarded " + @hand[card_pick].card_to_string + " and picked up " + trump_card.card_to_string
    @hand[card_pick] = trump_card
  end
  def stick_the_dealer
    #just choose a suit and return it
    @make = true
    puts @name + ": You have to make it. Please choose a suit." 
    suit = gets.chomp
    puts @name + " made it. Trump is now " + suit + ". "
    suit
  end
  def lead_card
    #return card in hand 
    puts @name + ": Choose what card you would like to play"
    count = 0
     @hand.each do |card|
        puts count.to_s + " : " + card.card_to_string
        count += 1
     end
       card = gets.chomp
       @hand[card.to_i]
  end
  def remove_card_from_hand(card)
      @hand.delete_at(@hand.index(card)) 
  end
  def show_hand
    @hand.each do |card|
      puts card.card_to_string
    end
  end
  def respond(lead_card)
    #must follow suit of card lead
    #take current players hand and card that was lead by opposing player
    #return card
    suit = lead_card.suit
    playable_cards = []
    @hand.each do |card|
      playable_cards << card if card.suit == suit
    end
    puts @name + ": What card would you like to play?"
    puts @name + ": Please pick a card, "
    if playable_cards.empty? 
    count1 = 0     
      @hand.each do |card|
         puts count1.to_s + " : " + card.card_to_string
         count1 += 1
      end
      pick = gets.chomp.to_i
      return @hand[pick]
    else
     count = 0
      playable_cards.each do |card|    
         puts count.to_s + " : " + card.card_to_string
         count += 1
      end
      pick = gets.chomp.to_i
      return playable_cards[pick]
    end
  end
end