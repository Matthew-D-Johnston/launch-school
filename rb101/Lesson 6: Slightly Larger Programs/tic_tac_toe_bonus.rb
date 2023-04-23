# tic_tac_toe.rb

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2.
# 8. Play again?
# 9. If yes, go to #1.
# 10. Good bye!

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_TURN = ["player", "computer", "choose"]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

# def computer_places_piece!(brd)
#   square = empty_squares(brd).sample
#   brd[square] = COMPUTER_MARKER
# end

# Modified computer_places_piece! method:

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

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

# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
# rubocop:enable Metrics/LineLength

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# Bonus Features:

def joinor(list, punctuation = ', ', last_word = 'or')
  last_element = list.last
  punctuation = ' ' if list.size == 2
  if list.size == 1
    last_element.to_s
  else
    "#{list[0..-2].join(punctuation)}#{punctuation}#{last_word} #{last_element}"
  end
end

def ai_needed?(brd, marker)
  potential_wins = WINNING_LINES.map do |line|
    brd.values_at(*line).count(marker) == 2 && \
      brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  potential_wins.include?(true)
end

def square_five_available?(brd)
  brd[5] == INITIAL_MARKER
end

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

# Main Loop:

loop do
  player_score = 0
  computer_score = 0

  loop do
    board = initialize_board
    display_board(board)
    current_player = FIRST_TURN[0] # toggle: 0 (play), 1 (comp) or 2 (choice)

    if current_player == 'choose'
      prompt "Choose who will go first (p for player or c for computer)."
      choice = gets.chomp.downcase
      choice == 'p' ? current_player = 'player' : current_player = 'computer'
    end

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won the game!"
    else
      prompt "It's a tie!"
    end

    # Update Score
    player_score += 1 if detect_winner(board) == 'Player'
    computer_score += 1 if detect_winner(board) == 'Computer'
    prompt "Player: #{player_score}; Computer: #{computer_score}"

    if player_score == 5
      prompt "Player won the match!"
      break
    elsif computer_score == 5
      prompt "Computer won the match!"
      break
    end

    prompt "First to 5 wins the match. Continue the match? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  prompt "Play another match? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
