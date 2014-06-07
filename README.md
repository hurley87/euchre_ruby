euchre_ruby
===========

This is a game Mom and I made. We have played 2v2 Euchre(the way its traditional) for all life. She grew up playing the game and passed it down to me. 

I'll do my best to explain the rules here: 

Game is played with a Euchre deck + 1 Joker ==> 25 cards. There are two players I'll refer to as player_1 and player_2. Each player is dealt 11 cards and a trump round where one player must make it trump. When trump is made players play for 11 tricks. 

-------------------
Deal
-------------------

One player starts by dealing out the cards face down to each player - let's assume player_1 deals first. Each player gets five cards they can look at and another 5 face down on the table in front of them. Each player now has 11 cards(5 they can see and 6 they can't). Both players have 11 cards which leaves 3 cards left over. These 3 cards are placed in a stack on the table facedown. The top card to flipped over for both players to see. This top card I'll refer to as the decision_card. 

-------------------
Trump Round
-------------------

Because it is player_1's deal, player_2 acts first. player_2 can decide to either 'pass' or 'order'. If player_2 orders they are now the 'trump_maker'. player_1 must pick up the decision_card and 'trump' is the decision_card's suit.

If player_2 decides to pass player_1 must either pass or order. If player_1 orders they must put the descision_card is their hand(5 cards they can see) and discard one card. Trump is now the decision_card's suit. 

If player_1 decides to pass the decision_card is turned down and player_2 must act. player_2 can either make it trump and pass the decision back to player_1. 

If player_2 passes player_1 must choose a suit to make trump. This is called stick the dealer. 

At the end of the trump round 2 things have happened: we know trump and we know which player made it trump. Both are important to remember. 

------------------
Trump and Card Value
------------------
When trump is made each player can determine the card values in the hand they have. When a suit is named trump, the jack in the suit of the same color as this trump suit becomes a powerful member of this trump suit. Then any card of that (expanded) suit outranks any card of a non-trump suit. The highest-ranking card in euchre is the Jack of the trump suit (called 'The Right Bower' or 'Right') then the other Jack of the same color, (called 'The Left Bower' or 'Left'). The cards are ranked, in descending order, J (of trump suit) J (same color as trump suit) A, K, Q, 10, and 9 of the trump suit.

The remaining cards rank in the usual order (the off-color jacks are not special) and the cards of those suits rank from high to low as A, K, Q, J, 10, and 9.
Example:

Assume a hand is dealt and that spades are named as trump. In this event, the trump cards are as follows, from highest-ranking to lowest:

Jack of spades (right bower)
Jack of clubs (left bower)
Ace of spades
King of spades
Queen of spades
10 of spades
9 of spades

The Joker is the highest card. When played the other player must play their top card. For obvioius reasons its a huge advantage to have the Joker. 

------------------
Trick Round
------------------

After the trump tround each player turns up 3 of their 6 table cards. Because player_1 dealt player_2 must lead first and player_1 reponds. Whoever has the highest card wins the trick. 

Whoever wins the trick leads first.  

Each player must follow suit. 

Trump cards always beat regular cards. 

When a Joker is lead the player who responds must player their highest trump card. If the reponding player doesnt have trump they can play any other card.

The players each have 3 cards face up and 3 cards face down on the table. Each time they play one of these face up cards they are able to flip over another card thats face down. 

Players play until all 11 cards are gone. Player with the most tricks win the trick and wins points. 

------------------
Scoring
------------------

I'll assume here that player_1 made it trump. 

Each player has a certain amount of tricks(example: player_1.tricks == 8 and player_2.tricks == 3). Tricks must add up to 11 total tricks. 

If player_1 has more tricks player_1 recieves (player_1.tricks - player_2.tricks) points. 
If player_2 has more tricks this is a euchre. player_2 recieves (player_2.tricks - player_1.tricks)*2 points. 

------------------
Game
------------------

Players go through this same process again. This time player_2 deals and dealer alternates every new hand. 

Players can play up to any score but typically, after extensive experimentation, games up to 100 seem appropriate. 


