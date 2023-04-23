# Lesson 5: Slightly Larger OO Programs

## 7. Assignment: OO TTT Bonus Features

#### 1. Review the "bonus" features from the procedural TTT program, and incorporate all of them here, in the OO version.

---

##### 1. Improved "join"

If we run the current game, we'll see the following prompt:

```
=> Choose a square (1, 2, 3, 4, 5, 6, 7, 8, 9)
```

This is ok, but we'd like for this message to read a little better. We want to separate the last item with a "or", so that it reads:  

```
=> Choose a square (1, 2, 3, 4, 5, 6, 7, 8, or 9)
```

Currently, we're using the `Array#join` method, which can only insert a delimiter between the array elements, and isn't smart enough to display a joining word for the last element.  

Write a method called `joinor` that will produce the following result:

```ruby
joinor([1, 2])									# => "1 or 2"
joinor([1, 2, 3])								# => "1, 2, or 3"
joinor([1, 2, 3], '; ')					# => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')	# => "1, 2, and 3"
```

Then, use this method in the TTT game when prompting the user to mark a square.

**My Solution:**  

```ruby
def joinor(unmarked, separator=", ", conj="or")
  if unmarked.size == 1
    "#{unmarked.first}"
  elsif unmarked.size == 2
    "#{unmarked.first} #{conj} #{unmarked.last}"
  else
  	"#{unmarked[0..-2].join(separator)}#{separator}#{conj} #{unmarked.last}"
  end
end
```

---

##### 2. Keep score

Keep score of how many times the player and computer each win. Don't use global or instance variables. Make it so that the first player to 5 wins the game.  

**My Solution:**

I think I am going to try adding a `@score` instance variable to the `Player` class, since a score is something that pertains to each player and a score of zero can be initialized whenever a new player is initialized.  

We will also need to include a way to retrieve the `@score` variable, which we can do with a `attr_reader`. Then we will need to define a method that allows us to increment the score depending on who won.

Thus, we can retrofit the `Player` class in the following way:

```ruby
class Player
  attr_reader :marker, :score
  
  def initialize(marker)
    @marker = marker
    @score = 0
  end
  
  def add_point
    @score += 1
  end
end
```

Thus, within the `TTTGame` class we will need to define an `update_score` method. We might utilize the `Board#winning_marker` method here.

```ruby
def update_score(winner)
  case board.winning_marker
  when HUMAN_MARKER
    human.add_point
  when COMPUTER_MARKER
    computer.add_point
  end
end
```

Now, we also need a `display_score` method in the `TTTGame` class that will retrieve each player's score, print it to the screen, and either indicate that the first one to five points wins or, if a player has five points, indicate that they have won the set.

```ruby
def display_score
  puts "You have #{human.score} point(s)."
  puts "The computer has #{computer.score} point(s)."
  
  if human.score == 5
  	puts "You have won the set!"
  elsif computer.score == 5
    puts "The computer has won the set!"
  else
    puts "The first player to five points wins the set."
  end
  
  puts ""
end
```

Now, if someone wins the set and reaches 5 points then we need a way to reset the scores before proceeding to another round. Perhaps, we could put this in the `TTTGame#reset` method. But we will need to create a `reset_score` method within the `Player` class.

```ruby
def reset_score
  @score = 0
end
```

Now, our `Player` class looks like this:

```ruby
class Player
  attr_reader :marker, :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def add_point
    @score += 1
  end
  
  def reset_score
    @score = 0
  end
end
```

And the `TTTGame#reset` method will look like this:

```ruby
def reset
  board.reset
  clear
  @current_marker = FIRST_TO_MOVE
  while [human.score, computer.score].include?(5)
    human.reset_score
    computer.reset_score
  end
end
```

I would also like to modify the `TTTGame#play_again?` so that while a current set is being played the following message is displayed:

```
"Continue playing? (y/n)"
```

At the end of a set, the following message should be displayed:

```
"Would you like to play another set? (y/n)"
```

Thus, our `TTTGame#play_again?` method will look like this:

```ruby
def play_again?
  answer = nil
		
  if human.score < 5 && computer.score < 5
    loop do
      puts "Continue playing? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end
  else
    loop do
      puts "Would you like to play another set? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end
  end
    
  answer == 'y'
end
```

However, the redundancy of the `loop` method suggest that we should maybe create another method called `play_again_prompt(message)`. 

```ruby
def play_again_response
  answer = nil

  loop do
    answer = gets.chomp.downcase
    break if %w(y n).include? answer
    puts "Sorry, must be y or n."
  end

  answer
end
```

Thus, we can rewrite our `TTTGame#play_again?` method in the following way:

```ruby
def play_again?
  if human.score < 5 && computer.score < 5
    puts "Continue playing? (y/n)"
    play_again_response == 'y'
  else
    puts "Woud you like to play another set? (y/n)"
    play_again_response == 'y'
  end
end
```

---

##### 3. Computer AI: Defense  

The computer currently picks a square at random. That's not very interesting. Let's make the computer defensive minded, so that if there's an immediate threat, then it will defed the 3rd square. We'll consider an "immediate threat" to be 2 squares marked by the opponent in a row. If there's no immediate threat, then it will just pick a random square.  

**My Solution:**  

We will need to rework the `TTTGame#computer_moves` method to allow for a more defensive-minded computer player.  Currently, that method is as follows:

```ruby
def computer_moves
  board[board.unmarked_keys.sample] = computer.marker
end
```

The choice based on a random sample may still be used, but only after checking to see if there are any lines where the human player could win on the next move. In that case the computer will choose the 3rd square to block the human player from winning.  

We might want to make use of the `WINNING_LINES` constant in the `Board` class. We might iterate over the winning lines, checking for two squares with a human mark and one with the initial, blank marking.  

We might create two methods, a `possible_winning_square` method and a `human_player_about_to_win?` method. We should define the `possible_winning_square` method first, because if there exists a possible winning square, then we know that the human player is about to win.  

Also, I think it might help to define a new instance variable for the `Square` class that gets initiated when a new `Square` object is created. This `instance` variable we can simply call, `square_key` and will be an integer that corresponds to the square's placement on the board. 

```ruby
class Square
  INITIAL_MARKER = " "

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
```

This means that we will need to redefine the `Board#reset` method to include an argument when we create a new `Square` object.

```ruby
def reset
  (1..9).each { |key| @squares[key] = Square.new(key) }
end
```

So the `possible_winning_square` method will be defined within our `Board` class.

```ruby
class Board
  # ... rest of code omitted for brevity
  
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]  
  
  def possible_winning_square
    possible_winner = nil
    
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)	 					# an array of square objects
      
      if two_identical_human_markers_and_one_initial_marker?(squares)
        possible_winner = squares.select(&:unmarked?)
      end
    end
    
    possible_winner ? possible_winner.first.square_key : nil
  end  
end
```

Now, we will need to define the `two_identical_human_markers_and_one_initial_marker?(squares)` method that we utilize above.

```ruby
def two_identical_human_markers_and_one_initial_marker?(squares)
  markers = squares.map(&:marker)
  markers.count(INITIAL_MARKER) == 1 && markers.count(HUMAN_MARKER) == 2
end
```

Now, we can define our `human_player_about_to_win?` method, in our `TTTGame` class:

```ruby
def human_player_about_to_win?
  board.possible_winning_square ? true : false
end
```

Thus, we can now redefine our `TTTGame#computer_moves` method in the following way:

```ruby
def computer_moves
  if human_player_about_to_win?
    board[board.possible_winning_square] = computer.marker
  else
  	board[board.unmarked_keys.sample] = computer.marker
  end
end
```

The code works, but I have had to make use of the marker signs (i.e. ' ' and 'X') in the `Board` class where the constant variables `INITIAL_MARKER` and `HUMAN_MARKER` are not defined. I could put them in their, or I could make a `Marker` class that contains these constants and make the other classes inherit from that class.

```ruby
class Marker
  INITIAL_MARKER = ' '
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
end
```

That has cleared things up, and I went back up to change the methods, exchanging `' '` for `INITIAL_MARKER` and `'X'` for `HUMAN_MARKER`.

---

##### 4. Computer AI: Offense  

The defensive minded AI is pretty cool, but it's still not performing as well as it could because if there are no impending threats, it will pick a square at random. We'd like to make a slight improvement on that. We're not going to add in any complicated algorithm (there's an extra bonus below on that), but all we want to do is piggy back on our `find_at_risk_square` from bonus #3 above and turn it into an attacking mechanism as well. The logic is simple: if the computer already has 2 in a row, then fill in the 3rd square, as opposed to moving at random.  

**My Solution:**  

I think I should be able to rework my `two_identical_human_markers_and_one_initial_marker?(squares)` method above, in order to generate a more offensive-minded computer player. But we shall rename it and add a new parameter that allows for us to specify which player marker to check. Call it `two_identical_markers_and_one_initial_marker?(squares, player_marker)`. 

```ruby
def two_identical_markers_and_one_initial_marker?(squares, player_marker)
  markers = squares.map(&:marker)
  markers.count(INITIAL_MARKER) == 1 && markers.count(player_marker) == 2
end
```

Let's step back for a second and take a look at the `TTTGame#computer_moves` method. We are going to need a method named `computer_player_about_to_win?`, which will then be implemented in the conditional statement within the `computer_moves` method definition.  

Right now, for the `human_player_about_to_win?` method we have:

```ruby
def human_player_about_to_win?
  board.possible_winning_square ? true : false
end
```

We can basically just reformat this method, so that we pass an argument to it that will specify which player is about to win, by using the player's specific marker.

```ruby
def player_about_to_win?(player_marker)
  board.possible_winning_square(player_marker) ? true : false
end
```

This means that we will need to redefine the `Board#possible_winning_square` method with a parameter as well.

```ruby
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
```

So, we can now redefine our `TTTGame#computer_moves` method:

```ruby
def computer_moves
  if player_about_to_win?(HUMAN_MARKER)
    board[board.possible_winning_square(HUMAN_MARKER)] = computer.marker
  elsif player_about_to_win?(COMPUTER_MARKER)
    board[board.possible_winning_square(COMPUTER_MARKER)] = computer.marker
  else
    board[board.unmarked_keys.sample] = computer.marker
  end
end
```

The code appears to be working, but Rubocop is now complaining about the "Assignment Branch Condition size" for the `computer_moves` method being too high.

```ruby
def computer_moves
  if player_about_to_win?(HUMAN_MARKER)
    board[board.possible_winning_square(HUMAN_MARKER)] = computer.marker
  elsif player_about_to_win?(COMPUTER_MARKER)
    board[board.possible_winning_square(COMPUTER_MARKER)] = computer.marker
  else
    board[board.unmarked_keys.sample] = computer.marker
  end
end
```

Perhaps, we could create a simple `computer_marker_board_assignment` method.

```ruby
def computer_marker_assigner(board_assignment_qualifier)
  board[board_assignment_qualifier] = computer.marker
end
```

Then we can redefine the `computer_moves` method as follows:

```ruby
def computer_moves
  if player_about_to_win?(HUMAN_MARKER)
    computer_marker_assigner(board.possible_winning_square(HUMAN_MARKER))
  elsif player_about_to_win?(COMPUTER_MARKER)
    computer_marker_assigner(board.possible_winning_square(COMPUTER_MARKER))
  else
    computer_marker_assigner(board.unmarked_keys.sample)
  end
end
```

That worked to silence Rubocop on that issue.

---

##### 5. Computer turn refinements  

**a)** We actually have the offense and defense steps backwards. In other words, if the computer has a chance to win, it should take that move rather than defend. As we have coded it now, it will defend first. Update the code so that it plays the offensive move first.  

**My Solution:**  

This is just a matter of exchanging some of the arguments passed to the `player_about_to_win?` method within our `TTTGame#computer_moves` method definition. Currently, we have the `HUMAN_MARKER` as the argument pertaining to the first conditional use of `player_about_to_win?`, but it should be `COMPUTER_MARKER`. This will ensure that the program first checks if the computer has a chance to win before defending. Thus, we redefine the `computer_moves` method in the following way:

```ruby
def computer_moves
  if player_about_to_win?(COMPUTER_MARKER)
    computer_marker_assigner(board.possible_winning_square(COMPUTER_MARKER))
  elsif player_about_to_win?(HUMAN_MARKER)
    computer_marker_assigner(board.possible_winning_square(HUMAN_MARKER))
  else
    computer_marker_assigner(board.unmarked_keys.sample)
  end
end
```

---

**b)** We can make one more improvement: pick square #5 if it's available. The AI for the computer should go like this: first, pick the winning move; then, defend; then pick square #5; then pick a random square.  

**My Solution:**  

First, we will need to define a method to see if square #5 is available. Something like, `square_5_available?`.

```ruby
def square_5_available?
  board[5] == INITIAL_MARKER
end
```

Then we add another conditional to the `computer_moves` method.

```ruby
def computer_moves
  if player_about_to_win?(COMPUTER_MARKER)
    computer_marker_assigner(board.possible_winning_square(COMPUTER_MARKER))
  elsif player_about_to_win?(HUMAN_MARKER)
    computer_marker_assigner(board.possible_winning_square(HUMAN_MARKER))
  elsif square_5_available?
    computer_marker_assigner(5)
  else
    computer_marker_assigner(board.unmarked_keys.sample)
  end
end
```

It appears that I need to first create a `[]` method in the `Board` class.

```ruby
def [](key)
  @squares[key].marker
end
```

---

**c)** Can you change the game so that the computer moves first? Can you make this a setting at the top (i.e. a constant), so that you could play the game with either player or computer going first? Can you make it so that if the constant is set to "choose", then your game will prompt the user to determine who goes first? Valid options for the constant can be "player", "computer", or "choose".  

**My Solution:**  

We already have the `FIRST_TO_MOVE` constant defined at the top of the `TTTGame` class definition, which we can currently set to `HUMAN_MARKER` or `COMPUTER_MARKER` depending on which player we want to go first. If we want to introduce the option for the player to choose will the program is running we will need to define a `choose_first_to_move` method.

```ruby
def choose_first_to_move
  puts "Choose who goes first (y for 'you' or c for 'computer'): "
	choice = nil
  
  loop do
  	choice = gets.chomp.downcase
    break if choice == 'y' || choice == 'c'
    puts "Sorry, invalid choice. Choose y or c: "
  end
  
  choice == 'y' ? HUMAN_MARKER : COMPUTER_MARKER
  clear
end 
```

Now, I will add a `CHOOSE` constant to the `Marker` class.

```ruby
class Marker
  INITIAL_MARKER = ' '
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  CHOOSE = nil
end
```

Now, I can set my `FIRST_TO_MOVE` constant to `CHOOSE`.  

Then, we need to define a `set_current_marker` setter method for our `@current_marker` instance variable.

```ruby
def set_current_marker(marker)
  @current_marker = marker
end
```

Then, we will add a new line to our `TTTGame#play` method, at the top of our first `loop`.

```ruby
 def play
    clear
    display_welcome_message

    loop do
      set_current_marker(choose_first_to_move) if FIRST_TO_MOVE == CHOOSE
      display_board
      
      # ... rest of code omitted for brevity
```

This allows us to only invoke the `set_current_marker` method if `FIRST_TO_MOVE == CHOOSE`. If the `FIRST_TO_MOVE` constant is set to one of our other options, `HUMAN_MARKER` or `COMPUTER_MARKER`, then that line will be skipped.

---

#### 2. Allow the player to pick any marker.

---

The first thing to think about is perhaps when we want to ask the user for the marker they want to use.  

* Do we want to ask the user to choose their marker after each individual game? Or, after each set?
* I think we want to do it after each set. Thus, we will want to create another loop outside of the individual game loop.

I think we may also want to perhaps change the interface for choosing who goes first. We could also implement this so that the user chooses at the start of a set who goes first. Then, we could maybe do something where the loser of each individual round gets to move first the next game. Once a player obtains  five victories, then they will be prompted about playing a new set and if so then they will have the option to choose their marker again and who will lead off the turns.

```ruby
def play
  clear
  display_welcome_message
	
  loop do # new loop
    
    # choose who goes first
    # choose marker ('X' or 'O')
    
    
  	loop do
    	@current_marker = choose_first_to_move if FIRST_TO_MOVE == CHOOSE
    	display_board

    	loop do
      	current_player_moves
      	break if board.someone_won? || board.full?
      	clear_screen_and_display_board if human_turn?
    	end

    	display_result
    	update_score
    	display_score

    	break unless play_again? # change this to continue_playing?

    	reset
    	display_play_again_message
  	end
    
    # break unless play_another_set? # this will be a play again for a new set
    # reset
    # display_play_another_set_message   
  end

  display_goodbye_message
end
```

The next thing we want to think about is dissociating the turn order with the specific markers. We first need to decide who is going first, and then we will decide which player has which marker.  

It might be expedient to add a new instance variable to the `Player` class, one that specifies their turn. We could name it `@turn_order` and associate it with a string `'1st'` or `'2nd'`. We will want to able to both read and rewrite this new variable.

```ruby
class Player
  attr_reader :marker, :score, :turn_order

  def initialize(marker)
    @marker = marker
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
```

Then we can define a `TTTGame@choose_who_goes_first` method:

```ruby
def choose_first_to_move
  puts "Choose who goes first (y for 'you' or c for 'computer'): "
  choice = nil
  
  loop do
    choice = gets.chomp.downcase
    break if choice == 'y' || choice == 'c'
    puts "Sorry, invalid choice. Choose y or c: "
  end
  
  clear
  choice == 'y' ? @human.turn_order = '1st' : @computer.turn_order = '1st'
end
```

We can also easily redefine our `human_turn?` method:

```ruby
def human_turn?
  @human.turn_order == "1st"
end
```

The `current_player_moves` method will also need to be changed in order to incorporate the above changes of how the program tracks whose turn it is:

```ruby
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
```

So, the start of our `TTTGame#play` method looks like this:

```ruby
def play
  clear
  display_welcome_message
  
  choose_first_to_move if FIRST_TO_MOVE == CHOOSE
  
  loop do
    display_board
    
    loop do
      current_player_moves
  
  # ....
```

We now want to intrdouce a `choose_marker` method to be invoked following the `choose_first_to_move` method.

```ruby
def choose_marker
  puts "Choose your marker (X or O): "
  choice = nil
  
  loop do
    choice = gets.chomp.upcase
    if choice == 'X'
      @human.marker = 'X'
      @computer.marker = 'O'
      break
    elsif choice == 'O'
      @human.marker = 'O'
      @computer.marker = 'X'
      break
    else
      puts "Sorry, invalid choice. Choose X or O: "
    end
  end
end
```

We will have to change the `initialize` method within the `Player` class so that there is no `marker` argument passed, but instead the `@marker` instance variable will be assigned to `nil`.

```ruby
class Player
  attr_reader :score
  attr_accessor :marker, :turn_order
  
  def initialize
    @marker = nil
    @score = 0
    @turn_order = nil
  end
  
  # ....
```

The program stil runs but there are some obvious problems with the game due to the residual code that specificies the markers associated with each player. I will have to go through and replace whereever there is a `HUMAN_MARKER` with `@human.marker` and `COMPUTER_MARKER` with `@computer.marker`. We can even remove those two constants from our `Marker` class.  

Now, I want to implement the separate loop to separate out the five-wins set from the individual games. Let's introduce a new method called `TTTGame#someone_won_set?` and change our `Board#someone_won?` method to `Board#someone_won_game?`.

```ruby
def someone_won_set?
  @human.score == 5 || @computer.score == 5
end
```

Then I insert a `break if someone_won_set?` line in the `TTTGame#play` method:

```ruby
def play
  
  # ...
  
  display_result
  update_score
  display_score
  
  break if someone_won_set?
  break unless play_again?
  
  # ...
  
  
```

Now, I want to change the `play_again?` method name to `continue_playing_current_set?`, and revise its definition since we no longer need to specify two separate cases, one for the current set and one for a brand new set:

```ruby
def continue_playing_current_set?
  puts "Would you like to continue playing the current set? (y/n): "
 	play_again_response == 'y'
end
```

Now, I can define a `play_another_set?` method:

```ruby
def play_another_set?
  puts "Would you like to play a new set? (y/n): "
  play_again_response == 'y'
end
```

Seems to work, but noticed that when I decided to play a new set, I chose for the computer to go first but this didn't seem to work.  

Just had to modify the `choose_first_to_move` method:

```ruby
def choose_first_to_move
  puts "Choose who goes first (y for 'you' or c for 'computer'): "
  choice = nil

  loop do
    choice = gets.chomp.downcase
    if choice == 'y'
      @human.turn_order = '1st'
      @computer.turn_order = '2nd'
      break
    elsif choice == 'c'
      @human.turn_order = '2nd'
      @computer.turn_order = '1st'
      break
    else
      puts "Sorry, invalid choice. Choose y or c: "
    end
  end

  clear
end
```

Now, I need to rename the `TTTGame#reset` method to `TTTGame#reset_game` and define a `TTTGame#reset_game_and_scores` that will also reset the players' scores to `0`.

```ruby
def reset_game_and_scores
  reset_game
  @human.reset_score
  @computer.reset_score
end
```

Now, I need to figure out how to touch up the `FIRST_TO_MOVE` constant and decide whether a whole `Marker` class is really necessary.  

First, I can get rid of the `@current_marker` instance variable since it is not really doing anything.

Next, I can change the line `choose_first_to_move if FIRST_TO_MOVE == CHOOSE` to `choose_first_to_move if FIRST_TO_MOVE == "choose"`, and swicth the initiation of the `FIRST_TO_MOVE` constant to `FIRST_TO_MOVE = 'choose'`. But I leave open the other options of either `'human'` or `'computer'`.  

Thus, we need to implement a way to bypass the prompt to choose who goes first if either `'human'` or `'computer'` is specified as the value pertaining to the `FIRST_TO_MOVE` constant.  

Let's create a `specify_the_first_mover` method:

```ruby
def specify_the_first_mover(mover)
  case mover
  when 'choose'
    choose_first_to_move
  when 'human'
    human.turn_order = '1st'
    computer.turn_order = '2nd'
  when 'computer'
    human.turn_order = '2nd'
    computer.turn_order = '1st'
  end
end
```

I decided that having the `FIRST_TO_MOVE` constant at the top was no longer necessary. Now the start of the `TTTGame#play` method looks like this:

```ruby
def play
  clear
  display_welcome_message
  
  loop do
    specify_the_first_mover('choose') # 'choose', 'human', or 'computer'
    choose_marker
    
    loop do
      display board
      
      #....
```

Well, I think that does it.  

After running Rubocop, I decided to create a `switch_turn_order` method:

```ruby
def switch_turn_order(human_turn_order, computer_turn_order)
  @human.turn_order = human_turn_order
  @computer.turn_order = computer_turn_order
end
```

I also created a `universal_marker_assignment` method:

```ruby
def universal_marker_assignment(first_marker, second_marker)
  @human.marker = first_marker
  @computer.marker = second_marker
end
```

I also modified the `computer_moves` method to eliminate some of the method calls. I achieved this by creating to local variables and assigning them to the method calls that are repeated in the rest of the method:

```ruby
def computer_moves
  computer_marker = @computer.marker
  human_marker = @human.marker
  
  # .... rest of code omitted, but whereever there was one of the two method calls I replaced it with the corresponding local variable.
```

Rubocop is mostly happy except for the `TTTGame# play` method still being too large and complex, but I think we can live with that.

---

#### 3. Set a name for the player and computer.

---

We definitely want to let the player choose their own name, but perhaps for the computer we can assign it one out of a list of possible predetermined names.  

To start, I think we are going to want to add a `@name` instance variable to the `Player` class. We won't initialize it at game play, but allow it to be read and rewritten with an `attr_accessor`:

```ruby
class Player
  attr_reader :score
  attr_accessor :marker, :turn_order, :name
  
  def initialize
    @marker = nil
    @score = 0
    @turn_order = nil
  end
  
  # ....
```

We will want to create names for the player and computer at the beginning of each set. We will prompt the user for their name with a method called `prompt_user_for_name`:

```ruby
def prompt_user_for_name
  puts "Please, enter your name: "
  name = nil

  loop do 
    name = gets.chomp
    break unless name == ''
    puts "Invalid input. Please, type your name: "
  end
  
  @human.name = name
end
```

Now, create a method that will choose a name for the computer at random: 

```ruby
def choose_computer_name
  computer.name = ['Alexa', 'R2D2', 'C3P0', 'Ava', 'Gort', 'Sid 6.7', 'Tima'].sample
end
```

Let's create a constant variable, `COMPUTER_NAMES` and call `sample` on that in our method:

```ruby
COMPUTER_NAMES = ['Alexa', 'R2D2', 'C3P0', 'Ava', 'Gort', 'Sid 6.7', 'Tima']

# ...

def choose_computer_name
  computer.name = COMPUTER_NAMES.sample
end
```

Now write a short, personalized welcome message that tells the user who they will be playing against:

```ruby
def display_personal_welcome_message
  puts "Welcome #{human.name}. You will be playing against #{computer.name}."
  puts "Let's get started!!"
  puts ""
end
```

We now should modify the `display_board` method:

```ruby
def display_board
  puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
  
  # ...
```









 

























