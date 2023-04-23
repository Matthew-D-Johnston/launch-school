# rps_lizard_spock.rb

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def rocks_victims?(move)
    move.scissors? || move.lizard?
  end

  def papers_victims?(move)
    move.rock? || move.spock?
  end

  def scissors_victims?(move)
    move.paper? || move.lizard?
  end

  def lizards_victims?(move)
    move.paper? || move.spock?
  end

  def spocks_victims?(move)
    move.scissors? || move.rock?
  end

  def rocks_conquerers?(move)
    move.paper? || move.spock?
  end

  def papers_conquerers?(move)
    move.scissors? || move.lizard?
  end

  def scissors_conquerers?(move)
    move.rock? || move.spock?
  end

  def lizards_conquerers?(move)
    move.scissors? || move.rock?
  end

  def spocks_conquerers?(move)
    move.paper? || move.lizard?
  end

  def >(other_move)
    if rock?
      rocks_victims?(other_move)
    elsif paper?
      papers_victims?(other_move)
    elsif scissors?
      scissors_victims?(other_move)
    elsif lizard?
      lizards_victims?(other_move)
    elsif spock?
      spocks_victims?(other_move)
    end
  end

  def <(other_move)
    if rock?
      rocks_conquerers?(other_move)
    elsif paper?
      papers_conquerers?(other_move)
    elsif scissors?
      scissors_conquerers?(other_move)
    elsif lizard?
      lizards_conquerers?(other_move)
    elsif spock?
      spocks_conquerers?(other_move)
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "#{human.name} has #{human.score} point(s)."
    puts "#{computer.name} has #{computer.score} point(s)."
  end

  def declare_winner
    if human.score == 10
      puts "#{human.name} is the first one to 10 points and wins the game!"
    elsif computer.score == 10
      puts "#{computer.name} is the first one to 10 points and wins the game!"
    else
      puts "First one to 10 points wins."
    end
  end

  def game_over?
    human.score == 10 || computer.score == 10
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message

    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        update_score
        display_score
        declare_winner
        break if game_over?
      end

      reset_score
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
