# rock_paper_scissors_bonus.rb
# Add bonus features to rock-paper-scissors program in rock_paper_scissors.rb
# file.

# Bonus Features:
# 1. Lizard Spock
# This game is a variation on the Rock Paper Scissors game that adds two more
# options--Lizard and Spock.
# The goal of this bonus is to add Lizard and Spock into your code.

# 2. Typing the full word "rock" or "lizard" is tiring. Update the program so
# the user can type "r" for "rock", "p" for "paper," etc. Note that if you do
# bonus #1, you'll have two words that start with "s." How do you resolve that?

# 3. Keep score of the player's and computer's wins. When either the player or
# computer reaches five wins, the match is over, and the winning player becomes
# the grand winner. Don't add your incrementing logic to `display_results`.
# Keep your methods simple; they should perform one logical task--no more, no
# less.

# Pseudo-Code for #1:
# Begin by redefining `VALID_CHOICES` to include 'lizard' and 'spock'.
# Then organize each distinct move with the pair of moves that it defeats.
# Then redefine `win?` method to include the 'lizard'- and 'spock'-move
# possibilities.

# Pseudo-Code for #2:
# Give users the option to type in full word or just the first letter.
# For spock, users will have to type 'sp'.

# Pseudo_Code for #3:
# I need to define a method to test whether the match is over.
# The match is over when either the user or the computer reaches a total of
# five wins.
# Perhaps, also a method that counts the number of wins of each player.

VALID_CHOICES = %w(rock paper scissors lizard spock)

BEATS = { 'rock' => ['scissors', 'lizard'],
          'paper' => ['rock', 'spock'],
          'scissors' => ['paper', 'lizard'],
          'lizard' => ['paper', 'spock'],
          'spock' => ['scissors', 'rock'] }

total_wins = { user: 0, comp: 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

start_game_prompt = <<-MSG
  Choose one: #{VALID_CHOICES.join(', ')}
      (Please type the full word or the first letter
       of the word. For example: type 'rock' or 'r'
       for rock; use 'sp' shorthand for spock)
MSG

def convert_shorthand(shorthand)
  case shorthand
  when 'r'
    shorthand = 'rock'
  when 'p'
    shorthand = 'paper'
  when 's'
    shorthand = 'scissors'
  when 'l'
    shorthand = 'lizard'
  when 'sp'
    shorthand = 'spock'
  else
    shorthand
  end
end

def win?(first, second)
  BEATS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt(start_game_prompt)

    choice = Kernel.gets().chomp()
    choice = convert_shorthand(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  puts ''
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  winners_choice = ''
  losers_choice = ''
  if win?(choice, computer_choice)
    winners_choice = choice
    losers_choice = computer_choice
  elsif win?(computer_choice, choice)
    winners_choice = computer_choice
    losers_choice = choice
  else
    winners_choice = choice
    losers_choice = winners_choice
  end

  action = if winners_choice == 'scissors' && losers_choice == 'paper'
             'cuts'
           elsif winners_choice == 'paper' && losers_choice == 'rock'
             'covers'
           elsif winners_choice == 'rock' && (losers_choice == 'lizard' ||
                                     losers_choice == 'scissors')
             'crushes'
           elsif winners_choice == 'lizard' && losers_choice == 'spock'
             'poisons'
           elsif winners_choice == 'spock' && losers_choice == 'scissors'
             'smashes'
           elsif winners_choice == 'scissors' && losers_choice == 'lizard'
             'decapitates'
           elsif winners_choice == 'lizard' && losers_choice == 'paper'
             'eats'
           elsif winners_choice == 'paper' && losers_choice == 'spock'
             'disproves'
           elsif winners_choice == 'spock' && losers_choice == 'rock'
             'vaporizes'
           else
             'equals'
           end

  prompt("#{winners_choice.capitalize} #{action} #{losers_choice.capitalize}")
  display_results(choice, computer_choice)
  puts ''

  if win?(choice, computer_choice)
    total_wins[:user] += 1
  elsif win?(computer_choice, choice)
    total_wins[:comp] += 1
  else
    total_wins
  end

  prompt("Current score:")
  prompt("You: #{total_wins[:user]}; Computer: #{total_wins[:comp]}")
  unless total_wins[:user] == 5 || total_wins[:comp] == 5
    prompt("First one to five is the champion!")
    puts ''
    next
  end

  puts ''
  if total_wins[:user] == 5
    prompt("You won five matches! You are the champion!")
  else
    prompt("The computer won five matches! The computer is the champion!")
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  total_wins = { user: 0, comp: 0 }
end

prompt("Thank you for playing. Good bye!")
