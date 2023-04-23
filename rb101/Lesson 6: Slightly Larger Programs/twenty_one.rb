# twenty_one.rb

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

# Start of Game
loop do
  card_deck = { '2' => [2, 2, 2, 2], '3' => [3, 3, 3, 3],
                '4' => [4, 4, 4, 4], '5' => [5, 5, 5, 5],
                '6' => [6, 6, 6, 6], '7' => [7, 7, 7, 7],
                '8' => [8, 8, 8, 8], '9' => [9, 9, 9, 9],
                '10' => [10, 10, 10, 10], 'jack' => [10, 10, 10, 10],
                'queen' => [10, 10, 10, 10], 'king' => [10, 10, 10, 10],
                'ace' => [[1, 11], [1, 11], [1, 11], [1, 11]] }

  # Welcome and Dealing of Cards
  prompt("Welcome to Twenty-One!")
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
      add_card_values(players_hand) > 21 ? prompt("Busted! Player loses.") : next
    end
    break
  end
  puts ''

  if add_card_values(players_hand) <= 21

    # Dealer's Turn
    while add_card_values(dealers_hand) < 21
      if add_card_values(dealers_hand) < 17
        prompt("Dealer hits")
        dealers_hand << deal_card(card_deck)
        display_hand(dealers_hand, 2)
      else
        break
      end
    end
    puts ''

    if add_card_values(dealers_hand) > 21
      display_hand(dealers_hand, 3)
      prompt("Dealer busts. Player wins!")
    else
      display_hand(players_hand, 1)
      display_hand(dealers_hand, 3)
    end
    puts ''

    if add_card_values(dealers_hand) <= 21
      # Declaring the Winner
      player_points = add_card_values(players_hand)
      dealer_points = add_card_values(dealers_hand)
      if player_points > dealer_points
        prompt("Player has #{player_points}; Dealer has #{dealer_points}.")
        prompt("Player wins!")
      elsif player_points < dealer_points
        prompt("Player has #{player_points}; Dealer has #{dealer_points}.")
        prompt("Dealer wins!")
      else
        prompt("Player has #{player_points}; Dealer has #{dealer_points}.")
        prompt("It's a tie!")
      end
    end
  end

  prompt("Would you like to play again? (y or n)")
  response = gets.chomp
  break unless response.downcase == 'y'
end
