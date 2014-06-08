class Round
  attr_accessor :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @deal = Deal.new
    @trump = ""
    @player1.hand = @deal.p1_hand
    @player2.hand = @deal.p2_hand
  end

   #determine who deals, who makes it trump, what trump is and card values after
  def trump_round(p1, p2)
    if p1.deal == true && p2.deal == false
      puts p1.name + ": Do you want to order or pass(o or p)"
      decision = gets.chomp
      if decision == 'o'
        p1.order(@deal.decision_card)
        @trump = @deal.decision_card.suit
        p1.make = true
      else
        puts p2.name + ": Either press p to pass or choose a suit."
        decision = gets.chomp
        if decision == 'p'
          p1.stick_the_dealer
          p1.make = true
        else
          @trump = decision
          p2.make = true
          puts p2.name + " made it trump. Trump is " + @trump
        end
      end
    end
    #need to set card values here
    set_card_values(p1.hand) 
    set_card_values(p2.hand)
  end
  def set_card_values(hand)
    #set value of the bauers
    hand.each do |card|
      if (@trump == 'D')
        if(card.suit == 'S' && card.rank == 17)
          card.suit = 'D'
        end
        if(card.suit == 'D' && card.rank == 11)
          card.rank = 16
        end
        if(card.suit == 'H' && card.rank == 11)
            card.rank = 15
            card.suit = 'D'
        end
      elsif (@trump == 'H')
        if(card.suit == 'S' && card.rank == 17)
          card.suit = 'H'
        end      
        if(card.suit == 'H' && card.rank == 11)
          card.rank = 16
        end
        if(card.suit == 'D' && card.rank == 11)
            card.rank = 15
            card.suit = 'H'
        end
      elsif (@trump == 'S')
        if(card.suit == 'S' && card.rank == 11)
          card.rank = 16
        end
        if(card.suit == 'C' && card.rank == 11)
            card.rank = 15
            card.suit = 'S'
        end
      elsif (@trump == 'C')
        if(card.suit == 'S' && card.rank == 17)
          card.suit = 'C'
        end
        if(card.suit == 'C' && card.rank == 11)
          card.rank = 16
        end
        if(card.suit == 'S' && card.rank == 11)
            card.rank = 15
            card.suit = 'C'
        end
      end
    end
  end

  #determine who wins in a given trick
  def play_for_trick 
      if @player1.deal == true && @player2.deal == false && !@player1.hand.empty?
         #start with the hand on each player
        response_hand = @player2.hand
        leading_card_hand = @player1.hand
        #find card of player who leads
        leading_card =  @player1.lead_card
        @player1.remove_card_from_hand(leading_card)
        puts @player1.name + " chooses the " + leading_card.card_to_string
        #find card of player who responds
        response_card = @player2.respond(leading_card)
        @player2.remove_card_from_hand(response_card)
        puts @player1.name + " plays the " + leading_card.card_to_string + " and " +
        @player2.name + " plays the " + response_card.card_to_string
        
         #find winning card and then find out who that card belongs too
         winning_card = determine_winner(leading_card, response_card)
          if winning_card == leading_card 
              @player1.deal = true
              @player2.deal = false
              @player1.score += 1
           else
              @player2.deal  = true
              @player1.deal = false
              @player2.score += 1
           end
           #display players scores
      puts @player1.name + "'s score is " + @player1.score.to_s
      puts @player2.name + "'s score is " + @player2.score.to_s
      end

      if @player1.deal == false && @player2.deal == true && !@player2.hand.empty?
         #start with the hand on each player
        response_hand = @player2.hand
        leading_card_hand = @player1.hand
        #find card of player who leads
        leading_card =  @player2.lead_card
        @player2.remove_card_from_hand(leading_card)
        puts @player2.name + " chooses the " + leading_card.card_to_string
        #find card of player who responds
        response_card = @player1.respond(leading_card)
        @player1.remove_card_from_hand(response_card)
        puts @player2.name + " plays the " + leading_card.card_to_string + " and " +
        @player1.name + " plays the " + response_card.card_to_string

        #find winning card and then find out who that card belongs too
       winning_card = determine_winner(leading_card, response_card)

       if winning_card == leading_card 
          @player2.deal = true
          @player1.deal = false
          @player2.score += 1
       else
          @player1.deal  = true
          @player2.deal = false
          @player1.score += 1
       end
       #display players scores
      puts @player1.name + "'s score is " + @player1.score.to_s
      puts @player2.name + "'s score is " + @player2.score.to_s
      end
  end
  def determine_winner(card1, card2)
     #make sure card1 is the leading card
     #both cards are trump
     if(card1.suit == @trump && card2.suit == @trump)
      if(card1.rank >= card2.rank)
        return card1
       else
        return card2
       end
     end
     #leading card is trump
     if(card1.suit == @trump && card2.suit != @trump)
      return card1
     end
     #now if response card is trump
     if(card1.suit != @trump && card2.suit == @trump)
       return card2
     end
     #both cards are not trump
      if(card1.suit != @trump && card2.suit != @trump)
       if(card1.rank >= card2.rank)
        return card1
       else
        return card2
       end
     end
    #return winning card
  end
  
end



