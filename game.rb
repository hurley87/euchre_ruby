require_relative  'deck_of_cards'
require_relative  'play_round'
require_relative  'player'

class Game
  attr_accessor :player1_score, :player2_score, :round
  def initialize(game_score_limit)
    @player1_score = 0
    @player2_score = 0
    @round = 1
    @game_score_limit = game_score_limit
  end
   def deal_new
    #ask for players names
    puts "welcome to one on one euchre" 
    puts "Enter player 1 name: "
    name1 = gets.chomp
    player_1 = Player.new(name1)
    puts "Enter player 2 name: "
    name2 = gets.chomp 
    player_2 = Player.new(name2)

    until @player1_score > @game_score_limit.to_i || @player2_score > @game_score_limit.to_i
      new_round = Round.new(player_1, player_2)

       p1 = new_round.player1
       p2 = new_round.player2
      if @round % 2 == 0 
        new_round.player2.deal = true
        new_round.player1.deal = false
        new_round.trump_round(new_round.player2, new_round.player1)

      else
        new_round.player1.deal = true
        new_round.player2.deal = false
        new_round.trump_round(new_round.player1, new_round.player2)
      end
      9.times do 
        new_round.play_for_trick
      end

      if p1.score > p2.score && p1.make == true
        @player1_score += p1.score - p2.score
        puts p1.name + " just won " + (p1.score - p2.score).to_s + " points!"     
      end
      if p1.score > p2.score && p1.make == false
        @player1_score += (p1.score - p2.score)*2
        puts  p1.name + " just won " + ((p1.score - p2.score)*2).to_s + " points!"        
      end
      if p1.score < p2.score && p2.make == true
        @player2_score  += p2.score - p1.score
        puts p2.name + " just won " + (p2.score - p1.score).to_s + " points!"  
      end
      if p1.score < p2.score && p2.make == false
        @player1_score  += (p2.score - p1.score)*2 
        puts p2.name + " just won " + ((p2.score - p1.score)*2).to_s + " points!"       
      end

      puts "The total score for " + p1.name + " is " + @player1_score.to_s
      puts "The total score for " + p2.name + " is " + @player2_score.to_s
      puts "The end of round " + @round.to_s
      @round += 1
    end
  end
end

    new_game = Game.new(20)
    new_game.deal_new

    
     