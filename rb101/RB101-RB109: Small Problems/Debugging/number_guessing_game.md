### Number Guessing Game

---

A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1 and a provided maximum number and offers you a given number of attempts to guess it.



However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior. Can you figure out what is wrong?

```ruby
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0
  
  loop do
    attempts += 1
    break if attempts > max_attempts
    
    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end
    
    guess = input.to_i
    
    if guess == winning_number
      puts 'Yes! You win.'
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.' if guess > winning_number
      
      # Try again:
      guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)
```

---

**The Problem:**

There are a number of problems that become evident when the code is run. First of all, upon guessing the correct response on the second attempt, the program prompted for another guess; regardless of the number of attempts specified by the `max_attempts` parameter, when a correct guess is made the program should stop. Secondly, even after hitting the maximum number of attempts, the program continued to prompt for another guess; thus, the program runs indefinitely rather than stopping once the specified max number of attempts is made.

---

**Line-by-Line Code Breakdown:**

* Lines 1-3: method definition with a single parameter:

  * Line 1: initialization of the `valid_integer?` method with the `def` keyword; method defined with a single `string` parameter, taking a string object as its argument;
  * Line 2: a comparison between the `string` parameter and the `string` parameter with two chained method calls (i.e. `.to_i.to_s`); the `to_i` method called on `string` will convert the string object referenced by `string` into an integer object; the `to_s` method call will convert that integer object back to a string object; the comparison is then made to see if the string object, after going through multliple, conversions still holds a value equivalent to that of the original string object, which should happen if the string object that was passed was a numerical string object;
  * Line 3: the `valid_integer?` method definition is closed with the `end` keyword.

* Lines 5-31: `guess_number` method definition, which is defined with two parameters:

  * Line 5: the `guess_number` method definition is initialized with the `def` keyword and is defined with the parameters `max_number` and `max_attempts`

  * Line 6: initialization of the `winning_number` variable, which is assigned to an integer object; that integer object is the result of a number of method calls: first, a range object starting from `1` and finishing at the integer object referenced by the `max_number`parameter is passed to the `to_a` method, which transforms the range object into an array object; secondly, the array object is passed to the `sample` method, which randomly selects one of the elements of the array object; in this case, those elements will be integer objects, so that the return value of `sample` is an array object and will be what `wining_number` is assigned to;

  * Line 7: the `attempts` variable is initialized with an assignment to the integer object `0`;

  * Lines 9-30: loop method with a block

    * Line 9: a `loop` method is called, which is followed the `do` keyword to initialize the block;
    * Line 10: the `attempts` variable is reassigned to an integer object that is equivalent to the value of its prior assignment plus `1`;
    * Line 11: a `break` keyword is invoked to break out of the loop under a condition specified following the `if` statment invocation; that condition is `attempts > max_attempts`, which in the context of the full line of code means that if the integer object referenced by `attempts` is greater than the integer object referenced by `max_attempts`, then the `if` condition will be satisfied and the `break` will be performed, causing the program to break out of the loop and the remaining lines of code up until the last line of the loop will not be performed;
    * Line 13: the `input` variable is initialized with the assignment to the `nil` object;
    * Lines 14-17: `until` conditional statement invoked with a block:
      * Line 14: the block of the `until` method will only run if the `valid_integer?` returns `false` when the argument `input` is passed to it; if `valid_integer?(input)` returns `true` then the block of the `until` method will not be executed; since the `input` variable was just assigned to the `nil` object, `valid_integer?(input)` will return false and the block of the `until` method will be run; 
      * Line 15: the `print` method is called on the string object containing the value `'Make a guess: '`, which will print that value to the screen;
      * Line 16: the `input` variable is reassigned to the string object input by the user and retrieved by the `gets` method, of which the `chomp` method is called upon to remove any of the carriage return characters; so long as the `input` is a numerical input, the next iteration of the loop will not run since `valid_integer?(input)` will return `true`; however, if the user's input is not a numerical string object, then `valid_integer?(input)` will return `false` and the block will be executed again, with the user being prompted once again to make a guess;
      * Line 17: the `until` loop is closed with the `end` keyword.

    * Line 19: the `guess` variable is initialized with assignment to the return value resulting from a `to_i` method call on `input`, which converts the string object rerenced by `input` to an integer object;

    * Lines 21-29: `if/else` conditional statement invoked:

      * Line 21: invokation of the `if` conditional statement with the following condition: `guess == winning_number`, which compares the integer object assigned to `guess` with the integer object assigned to `winning_number`; if those to values are equivalent, then the code corresponding to the `if` condition will be executed, otherwise the program will move onto the `else` statement.
        * Line 22: the code to be executed if the condition of the `if` conditional statement evaluates to `true`: `puts` is called on the string object containing the value `'Yes! You win.'`;

      * Line 23: the `else` conditional statement; the code corresponding to the `else` condition will be executed if the condition of the `if` conditional statement evaluates to `false`:
        *  Line 24: the `puts` method is called on the string object containing the value `'Nope. Too small.'` only if the condition following the `if` conditional statement evaluates to true; that condition is a comparison between `guess` and `winning_number`, which will return `true` if `guess` is less than `winning_number`;
        * Line 25: the `puts` method is called on the string object containing the value `'Nope. Too big.'` only if the condition following the `if` conditional statement evaluates to true; that condition is a comparison between `guess` and `winning_number`, which will return `true` if `guess` is greater than `winning_number`;
        * Line 28: the `guess_number` method is recursively invoked, which takes `max_number` and `max_attempts` as arguments; I believe this is the source of the problem, because it basically restarts the whole process: while `max_attempts` and `max_number` will remain the same, the `winning_number` variable will be reassigned and so will the `attempts` variable; this line is useless and should be removed, but we will also need to add a `break` following line 22 so that if the user guess correctly, there are no more prompts for further guesses.
        * Line 29: the `if/else` conditional statement is closed with the `end` keyword
      * the `loop` method is closed with the `end` keyword.

    * the `guess_number` method is closed with the `end` keyword.

* Line 33: the `guess_number` method is called with `10` and `3` passed as arguments and assigned to the `max_number` and `max_attempts` parameters, respectively.

---

**Modified Code:**

Added a `break` statement to line 23 and removed the recursive `guess_number` method call from line 28.

```ruby
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0
  
  loop do
    attempts += 1
    break if attempts > max_attempts
    
    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end
    
    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.' if guess > winning_number
    end
  end
end
```

---

**Launch School Solution:**

Came to the same conclusion as I did.

