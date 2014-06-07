require_relative  'deck_of_cards'
require_relative  'play_round'
require_relative  'player'

class Game
  attr_accessor :player1_score, :player2_score, :round, :player1_name, :player2_name
  def initialize(game_score_limit)
    @player1_score = 0
    @player2_score = 0
    @player1_name = player1_name
    @player2_name = player2_name
    @round = 1
    @game_score_limit = game_score_limit
  end
   def deal_new
    #ask for players names
    puts "welcome to one on one euchre" 
    puts "Enter player 1 name: "
    @player1_name = gets.chomp
    puts "Enter player 2 name: "
    @player2_name = gets.chomp 
  end
end

    new_game = Game.new(20)
    p1_score = new_game.player1_score
    p2_score = new_game.player2_score
    new_game.deal_new

    until p1_score > game_score_limit.to_i || p2_score > game_score_limit.to_i
      new_Round = Round.new
      new_Round.player1.name = new_game.player1_name
      new_Round.player2.name = new_game.player2_name
      if new_game.round % 2 == 0 
        new_Round.player2.deal = true
        new_Round.player1.deal = false
        new_Round.trump_round(new_Round.player2, new_Round.player1)

      else
        new_Round.player1.deal = true
        new_Round.player2.deal = false
        new_Round.trump_round(new_Round.player1, new_Round.player2)
      end
      9.times do 
        new_Round.play_for_trick
      end

      p1 = new_Round.player1
      p2 = new_Round.player2

      if p1.score > p2.score && p1.make == true
        p1_score += p1.score - p2.score
        puts p1.name + " just won " + (p1.score - p2.score).to_s + " points!"     
      end
      if p1.score > p2.score && p1.make == false
        p1_score += (p1.score - p2.score)*2
        puts  p1.name + " just won " + ((p1.score - p2.score)*2).to_s + " points!"        
      end
      if p1.score < p2.score && p2.make == true
        p2_score += p2.score - p1.score
        puts p2.name + " just won " + (p2.score - p1.score).to_s + " points!"  
      end
      if p1.score < p2.score && p2.make == false
        p2_score += (p2.score - p1.score)*2 
        puts p2.name + " just won " + ((p2.score - p1.score)*2).to_s + " points!"       
      end

      puts "The total score for " + p1.name + " is " + p1_score.to_s
      puts "The total score for " + p2.name + " is " + p2_score.to_s
      puts "The end of round " + new_game.round.to_s
      new_game.round += 1
    end
     