# place_piece.rb
# Write a `place_piece!(board, current_player)` method that utilizes the
# `player_places_piece!` and `computer_places_piece!` methods, combining them
# into a single method.

def place_piece!(board, current_player)
  if current_player == 'player'
    player_places_piece!(board)
  else 
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end
