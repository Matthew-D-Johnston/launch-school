# display_hand.rb

def prompt(message)
  puts "=> #{message}"
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
