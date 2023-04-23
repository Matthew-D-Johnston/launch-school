# keep_score.rb
# Keep score of how many times the player and computer each win. Don't use
# global or constant variables. Make it so that the first player to 5 wins the
# game.

# Pseudo-code:

# Data Structure:
# input: a string: either 'Player' or 'Computer'
# output: returns the updated score for each player

# Algorithm:
# 1) create a new loop within the primary game loop, leaving the query to play
#    again outside of the new loop.
# 2) Inside the main outer loop but outside the new inner loop, define two
#    variables to keep track of the scores: player_score = 0 and
#    computer_score = 0
# 2) initialize method definition: def update_score(string)
# 3) if string == 'Player', then player_score += 1
# 4) if string == 'Computer', then computer_score += 1
# 5) display the current score using prompt: "Player: #{player_score};
#    Computer: #{computer_score}"
# 6) break out of the new inner loop if player_score == 5 ||
#    computer_score == 5
# NEED TO HANDLE NIL

def prompt(msg)
  puts "=> #{msg}"
end

# within the main loop
player_score = 0
computer_score = 0

# inside the inner loop
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

