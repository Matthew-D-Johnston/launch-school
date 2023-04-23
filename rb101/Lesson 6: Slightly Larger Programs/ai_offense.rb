# ai_offense.rb
# The defensive minded AI is pretty cool, but it's still not performing as well
# as it could because if there are no impending threats, it will pick a square
# at random. We'd like to make a slight improvement on that. We're not going to
# add in any complicated algorithm (there's an extra bonus below on that), but
# all we want to do is piggy back on our `find_at_risk_square` from bonus #3
# above and turn it into an attacking mechanism as well. The logic is simple:
# if the computer already has 2 in a row, then fill in the 3rd square, as
# opposed to moving at random.

def find_winning_square(line, board)
  if board.values_at(*line)count(COMPUTER_MARKER) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

# or, in keeping with my `ai_defense_needed?` method:

def ai_offense_needed?(brd)
  potential_wins = WINNING_LINES.map do |line|
              brd.values_at(*line).count(COMPUTER_MARKER) == 2 && \
              brd.values_at(*line).count(INITIAL_MARKER) == 1
            end
  potential_wins.include?(true)
end

def computer_places_piece!(brd)
  if ai_offense_needed?(brd)
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && \
         brd.values_at(*line).count(INITIAL_MARKER) == 1
        brd[line[brd.values_at(*line).index(INITIAL_MARKER)]] = COMPUTER_MARKER
        break
      end
    end
  elsif ai_defense_needed?(brd)
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 2 && \
         brd.values_at(*line).count(INITIAL_MARKER) == 1
        brd[line[brd.values_at(*line).index(INITIAL_MARKER)]] = COMPUTER_MARKER
        break
      end
    end
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

# after reading LS solution, I decide to modify my own methods and combine them
# to create a single `ai_needed?(brd, marker)` method. `style` now represents
# either the COMPUTER_MARKER or PLAYER_MARKER.

def ai_needed?(brd, marker)
  potential_wins = WINNING_LINES.map do |line|
              brd.values_at(*line).count(marker) == 2 && \
              brd.values_at(*line).count(INITIAL_MARKER) == 1
            end
  potential_wins.include?(true)
end

def computer_places_piece!(brd)
  if ai_needed?(brd, COMPUTER_MARKER)
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && \
         brd.values_at(*line).count(INITIAL_MARKER) == 1
        brd[line[brd.values_at(*line).index(INITIAL_MARKER)]] = COMPUTER_MARKER
        break
      end
    end
  elsif ai_needed?(brd, PLAYER_MARKER)
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 2 && \
         brd.values_at(*line).count(INITIAL_MARKER) == 1
        brd[line[brd.values_at(*line).index(INITIAL_MARKER)]] = COMPUTER_MARKER
        break
      end
    end
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end
