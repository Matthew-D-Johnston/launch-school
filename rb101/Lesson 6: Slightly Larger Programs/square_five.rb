# square_five.rb
# We can make one more improvement: pick square #5 if it's available. The AI
# for the computer should go like this: first, pick the winning move; then,
# defend; then pick square #5; then pick a random square.

def square_five_available?(brd)
  brd[5] == INITIAL_MARKER
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
  elsif square_five_available?(brd)
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end