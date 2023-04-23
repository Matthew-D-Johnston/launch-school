# twenty_one_bonus.rb

# Methods
def prompt(message)
  puts "=> #{message}"
end

def deal_card(deck)
  remaining_cards = deck.select { |_, value| !value.empty? }
  card = remaining_cards.keys.sample
  if card.nil?
    puts "Deck is empty."
  else
    value = deck[card].pop if !deck[card].nil?
    [card, value]
  end
end

def add_card_values(hand)
  total_value = 0

  hand.each do |card|
    total_value += card[0] == 'ace' ? 11 : card[1]
  end

  number_of_aces = hand.count { |card| card[0] == 'ace' }
  while total_value > 21 && number_of_aces > 0
    total_value -= 10
    number_of_aces -= 1
  end

  total_value
end

def display_hand(hand, scenario)
  cards = hand.map(&:first)

  case scenario
  when 1
    prompt("Player's hand: #{cards[0..-2].join(', ')} and #{cards.last}")
  when 2
    prompt("Dealer's hand: #{cards[1..-1].join(', ')} and unknown card")
  else
    prompt("Dealer's hand: #{cards[0..-2].join(', ')} and #{cards.last}")
  end
end

def player_wins_msg(player_points, dealer_points)
  prompt("Player has #{player_points}; Dealer has #{dealer_points}.")
  prompt("Player wins!")
end

def dealer_wins_msg(player_points, dealer_points)
  prompt("Player has #{player_points}; Dealer has #{dealer_points}.")
  prompt("Dealer wins!")
end

def declare_winner(player_points, dealer_points)
  if dealer_points > 21
    player_wins_msg(player_points, dealer_points)
  elsif player_points > 21
    dealer_wins_msg(player_points, dealer_points)
  elsif player_points > dealer_points
    player_wins_msg(player_points, dealer_points)
  elsif player_points < dealer_points
    dealer_wins_msg(player_points, dealer_points)
  else
    prompt("Player has #{player_points}; Dealer has #{dealer_points}.")
    prompt("It's a tie!")
  end
end

def busted(player_points, dealer_points)
  prompt("Busted!")
  declare_winner(player_points, dealer_points)
end

# Constants

POINT_LIMIT = 21
DEALER_LIMIT = 17

# Start of Game
loop do
  player_score = 0
  dealer_score = 0

# Welcome
  prompt("Welcome to Twenty-One!")
  prompt("First one to win 5 games wins the round.")
  puts ''

  loop do
    card_deck = { '2' => [2, 2, 2, 2], '3' => [3, 3, 3, 3],
                  '4' => [4, 4, 4, 4], '5' => [5, 5, 5, 5],
                  '6' => [6, 6, 6, 6], '7' => [7, 7, 7, 7],
                  '8' => [8, 8, 8, 8], '9' => [9, 9, 9, 9],
                  '10' => [10, 10, 10, 10], 'jack' => [10, 10, 10, 10],
                  'queen' => [10, 10, 10, 10], 'king' => [10, 10, 10, 10],
                  'ace' => [[1, 11], [1, 11], [1, 11], [1, 11]] }

    # Dealing of Cards
    prompt("Hit the 'Enter' button to deal the cards.")
    gets.chomp

    players_hand = []
    dealers_hand = []

    2.times do
      players_hand << deal_card(card_deck)
      dealers_hand << deal_card(card_deck)
    end

    display_hand(players_hand, 1)
    display_hand(dealers_hand, 2)
    puts ''

    # Player's Turn
    prompt("Player's turn:")
    loop do
      prompt("Hit or Stay (type h for Hit or s for Stay)")
      choice = gets.chomp
      if choice == 'h'
        players_hand << deal_card(card_deck)
        display_hand(players_hand, 1)
        if add_card_values(players_hand) > POINT_LIMIT
          busted(add_card_values(players_hand), add_card_values(dealers_hand))
          dealer_score += 1
        else
          next
        end
      end
      break
    end
    puts ''

    if add_card_values(players_hand) <= POINT_LIMIT

      # Dealer's Turn
      while add_card_values(dealers_hand) < POINT_LIMIT
        if add_card_values(dealers_hand) < DEALER_LIMIT
          prompt("Dealer hits")
          dealers_hand << deal_card(card_deck)
          display_hand(dealers_hand, 2)
        else
          break
        end
      end
      puts ''

      player_points = add_card_values(players_hand)
      dealer_points = add_card_values(dealers_hand)

      if dealer_points > POINT_LIMIT
        display_hand(dealers_hand, 3)
        busted(player_points, dealer_points)
        player_score += 1
      else
        display_hand(players_hand, 1)
        display_hand(dealers_hand, 3)
      end
      puts ''

      if dealer_points <= POINT_LIMIT
        declare_winner(player_points, dealer_points)
        player_score += 1 if player_points > dealer_points
        dealer_score += 1 if dealer_points > player_points
      end
    end
    puts ''

    prompt("Player's score: #{player_score}; Dealer's score: #{dealer_score}")
    if player_score < 5 && dealer_score < 5
      prompt("First one to 5 wins the round.")
      prompt("Would you like to continue the round? (y or n)")
      response = gets.chomp
      puts ''
      break unless response.downcase == 'y'
    else
      prompt("Player wins the round!") if player_score >= 5
      prompt("Dealer wins the round!") if dealer_score >= 5
      puts ''
      break
    end
  end

  prompt("Would you like to play again? (y or n)")
  response = gets.chomp
  break unless response.downcase == 'y'
end
