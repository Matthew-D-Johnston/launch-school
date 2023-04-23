# ai_defense.rb
# The computer currently picks a square at random. That's not very interesting.
# Let's make the computer defensive minded, so that if there's an immediate
# threat, then it will defend the 3rd square. We'll consider an "immediate
# threat" to be 2 squares marked by the opponent in a row. If there's no
# immediate threat, then it will pick a random square.

def ai_defense_needed?(brd)
  threats = WINNING_LINES.map do |line|
              brd.values_at(*line).count(PLAYER_MARKER) == 2 && \
              brd.values_at(*line).count(INITIAL_MARKER) == 1
            end
  threats.include?(true)
end

def computer_places_piece!(brd)
  if ai_defense_needed?(brd)
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

# Launch School solution:

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

