# deal_card.rb

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
