# oo_ttt_game_bonus_features.rb

require 'pry'

class Board
  INITIAL_MARKER = ' '

  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def [](key)
    @squares[key].marker
  end

  def []=(key, player_marker)
    @squares[key].marker = player_marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won_game?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new(key) }
  end

  def possible_winning_square(player_marker)
    possible_winner = nil

    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)

      if two_identical_markers_and_one_initial_marker?(squares, player_marker)
        possible_winner = squares.select(&:unmarked?)
      end
    end

    possible_winner ? possible_winner.first.square_key : nil
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def two_identical_markers_and_one_initial_marker?(squares, player_marker)
    markers = squares.map(&:marker)
    markers.count(INITIAL_MARKER) == 1 && markers.count(player_marker) == 2
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker, :square_key

  def initialize(square_key, marker=INITIAL_MARKER)
    @marker = marker
    @square_key = square_key
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :score
  attr_accessor :marker, :turn_order, :name

  def initialize
    @marker = nil
    @score = 0
    @turn_order = nil
  end

  def add_point
    @score += 1
  end

  def reset_score
    @score = 0
  end
end

class TTTGame
  INITIAL_MARKER = ' '
  COMPUTER_NAMES = ['Alexa', 'R2D2', 'C3P0', 'Ava', 'Gort', 'Sid 6.7', 'Tima']

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
  end

  def play
    clear
    display_welcome_message

    loop do
      prompt_user_for_name
      choose_computer_name
      clear
      display_personal_welcome_message
      specify_the_first_mover('human') # 'choose', 'human', or 'computer'
      choose_marker

      loop do
        display_board

        loop do
          current_player_moves
          break if board.someone_won_game? || board.full?
          clear_screen_and_display_board if human_turn?
        end

        display_result
        update_score
        display_score

        break if someone_won_set?
        break unless continue_playing_current_set?

        reset_game
      end

      break unless play_another_set?

      reset_game_and_scores
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_personal_welcome_message
    puts "Welcome #{human.name}. You will be playing against #{computer.name}."
    puts "Let's get started!!"
    puts ""
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def prompt_user_for_name
    puts "Please, enter your name: "
    name = nil

    loop do
      name = gets.chomp
      break unless name == ''
      puts "Invalid input. Please, type your name: "
    end

    human.name = name
  end

  def choose_computer_name
    computer.name = COMPUTER_NAMES.sample
  end

  def switch_turn_order(human_turn_order, computer_turn_order)
    @human.turn_order = human_turn_order
    @computer.turn_order = computer_turn_order
  end

  def specify_the_first_mover(mover)
    case mover
    when 'choose'
      choose_first_to_move
    when 'human'
      switch_turn_order('1st', '2nd')
    when 'computer'
      switch_turn_order('2nd', '1st')
    end
  end

  def choose_first_to_move
    puts "Choose who goes first (y for 'you' or c for 'computer'): "
    choice = nil

    loop do
      choice = gets.chomp.downcase
      if choice == 'y'
        switch_turn_order('1st', '2nd')
        break
      elsif choice == 'c'
        switch_turn_order('2nd', '1st')
        break
      else
        puts "Sorry, invalid choice. Choose y or c: "
      end
    end

    clear
  end

  def universal_marker_assignment(first_marker, second_marker)
    @human.marker = first_marker
    @computer.marker = second_marker
  end

  def choose_marker
    puts "Choose your marker (X or O): "
    choice = nil

    loop do
      choice = gets.chomp.upcase
      if choice == 'X'
        universal_marker_assignment('X', 'O')
        break
      elsif choice == 'O'
        universal_marker_assignment('O', 'X')
        break
      else
        puts "Sorry, invalid choice. Choose X or O: "
      end
    end

    clear
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(unmarked, separator=", ", conj="or")
    if unmarked.size == 1
      unmarked.first.to_s
    elsif unmarked.size == 2
      "#{unmarked.first} #{conj} #{unmarked.last}"
    else
      "#{unmarked[0..-2].join(separator)}#{separator}#{conj} #{unmarked.last}"
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)})"
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_marker_assigner(board_assignment_qualifier)
    board[board_assignment_qualifier] = computer.marker
  end

  def computer_moves
    computer_marker = @computer.marker
    human_marker = @human.marker

    if player_about_to_win?(computer_marker)
      computer_marker_assigner(board.possible_winning_square(computer_marker))
    elsif player_about_to_win?(human_marker)
      computer_marker_assigner(board.possible_winning_square(human_marker))
    elsif square_5_available?
      computer_marker_assigner(5)
    else
      computer_marker_assigner(board.unmarked_keys.sample)
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @human.turn_order = '2nd'
      @computer.turn_order = '1st'
    else
      computer_moves
      @computer.turn_order = '2nd'
      @human.turn_order = '1st'
    end
  end

  def player_about_to_win?(player_marker)
    board.possible_winning_square(player_marker) ? true : false
  end

  def someone_won_set?
    @human.score == 5 || @computer.score == 5
  end

  def square_5_available?
    board[5] == INITIAL_MARKER
  end

  def human_turn?
    @human.turn_order == "1st"
  end

  def update_score
    case board.winning_marker
    when @human.marker
      human.add_point
    when @computer.marker
      computer.add_point
    end
  end

  def display_score
    puts "You have #{human.score} point(s}."
    puts "#{computer.name} has #{computer.score} point(s)."

    if human.score == 5
      puts "Congratulations, #{human.name}! You won the set!"
    elsif computer.score == 5
      puts "#{computer.name} has won the set!"
    else
      puts "The first player to five points wins the set."
    end

    puts ""
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
    puts ""
  end

  def play_again_response
    answer = nil

    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end

    answer
  end

  def continue_playing_current_set?
    puts "Would you like to continue playing the current set? (y/n): "
    play_again_response == 'y'
  end

  def play_another_set?
    puts "Would you like to play a new set? (y/n): "
    play_again_response == 'y'
  end

  def clear
    system 'clear'
  end

  def reset_game
    board.reset
    clear
  end

  def reset_game_and_scores
    reset_game
    @human.reset_score
    @computer.reset_score
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
