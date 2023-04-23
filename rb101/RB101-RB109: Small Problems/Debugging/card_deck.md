### Card Deck

---

We started working on a card game but got stuck. Check out why the code below raises a `TypeError`.



Once you get the program to run and produce a `sum`, you might notice that the sum is off: it's lower than it should be. Why is that?

```ruby
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts 	 => cards,
  			 :diamonds => cards,
  			 :clubs		 => cards,
  			 :spades	 => cards }

def score(card)
  case card
  when :ace 	then 11
  when :king 	then 10
  when :queen then 10
  when :jack 	then 10
  else card
  end
end

# Pick one random card per suit
    
player_cards = []
deck.keys.each do |suit|
	cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck
    
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
	remaining_cards.map do |card|
    score(card)
  end
    
  sum += remaining_cards.sum
end

puts sum
```

---

**The Problem:**

When trying to run the code we get a `TypeError`. Specifically, the code indicates the line that reads `sum += remaining_cards.sum`, and reports that, `:queen can't be coerced into Integer`. Thus, somewhere on this line, there is a method call that is trying to treat a Symbol object as if it were an Integer object.

---

**Line-by-Line Code Breakdown:**

* Line 1: an Array object containing Integers and Symbols is being assigned to the variable `cards`.
* Lines 3 – 6: a Hash object--with Symbols as keys and the `cards` variable as the values for each Hash element--is assigned to the variable `deck`.
* Lines 8 – 16: a method definition whereby the method is defined with a single parameter: it appears that either a symbol or an integer can be passed as an argument to the method:
  * Line 8: initialization of the `score` method definition, which is defined with a single `card` parameter; it appears that either a Symbol or an Integer object can be passed as an argument to the method;
  * Line 9: a `case` conditional statement is invoked with the parameter `card` as the case's condition;
  * Line 10: a `when` case statement is invoked and returns `11` whenever `card == :ace` would return true;
  * Line 11: similar to line 10 only `10` is returned in the case where `card == :king`;
  * Line 12: similar to 11, but only when `card == :queen`;
  * Line 13: similar to lines 10 & 11, but only when `card == :jack`;
  * Line 14: an `else` conditional statement is invoked for all other possible values of `card`; in this case, the value that is returned is whatever the value of `card` is;
  * Line 15: closes the `case` conditional block with an `end`;
  * Line 16: closes the method definition with an `end`.
* Line 20: an empty Array object, `[]` is assigned to the `player_cards` variable.
* Lines 21 – 25: an `each` method call is invoked with a `do...end` block:
  * Line 21: `each` is called on `deck.keys`, where `keys` is a method that is called on the `deck` variable, which is pointing to a Hash object; the `keys` method returns an Array object of the keys contained in the Hash object; this return value is what the `each` method is called on, and will take each element of the array, which are Symbols and successively assign them to the block parameter `suit`;
  * Line 22: the `suit` variable is used to return the value associated with the corresponding key within the Hash object that is assigned to `deck`; this return value, which in every instance is the Array object assigned to `cards`, is assigned to the `each` method's local variable `cards`;
  * Line 23: the `shuffle!` method is then called on the local `cards` variable; the `!` bang operator means that the method will shuffle the elements of the Array object assigned to `cards` in a destructive way; that is, `cards` will be permanently mutated;
  * Line 24: the `pop` method is called on the `cards` variable, which returns the last element of the Array object assigned to `cards` (this action is performed destructively); the return value of the `pop` method call on ` cards` is then shoved to the end of the Array object assigned to the `player_cards` variable; since this is the last line of the block, the value of `player_cards`, which after all iterations are complete should be an Array containing four elements (each of which is either an Integer object or a Symbol object), will be the return value of the block; however, since the `each` method returns the original object on which it is called, that is what the return value of the method will be;
  * Line 25: this line closes off the method with `end`.
* Lines 29 – 35: we have a `reduce` method call on the variable `deck`, which is followed by a block, and the return value of whic is then assigned to a variable:
  * Line 29: we have a variable assignment that takes the return value of a `reduce` method call on the variable `deck` and assigns it to the variable `sum`; `reduce` iterates through each key–value pair of the Hash object assigned to `deck`, executing the code contained within the method's block; `_` suggests that the code within the block will not make use of the keys, while the values are successively assigned to the `remaining_cards` variable; the _memo_ parameter is designated by the variable `sum` whose initial value is defined by the `0` argument passed to `reduce`;
  * Lines 30 – 32: we have the `map` method called on the `remaining_cards` variable, which points to the value of the Hash object being passed on the current iteration of the `reduce` method, which is just an Array object originially assigned to the `cards` variable:
    * Line 30: `map` is called on `remaining_cards`, which will iterate over the Array object containing both Integer objects and Symbol objects, successively assigning each of those objects to the `card` parameter;
    * Line 31: the `card` variable is passed to the `score` method, which will return an Integer object according to how `score` was defined above; since this is the last line of the block, the return value of `score` is the block's return value; `map` is a method that returns a new Array object containing the return values of its block as its distinct elements; thus, map should return an Array object containing only Integer objects;
    * Line 32: this line closes the method with an `end`.
  * Line 34: we have variable reassignment whereby the `sum` method is being called on the `remaining_cards` variable, the return value of which is added to the current value of the `sum` _memo_-variable and which reassigns that value to `sum`; however, this is the line of code that produces our `TypeError` noted above; the reason is that, the above `map` method call on `remaining_cards`, while returning a new Array containing only Integer objects, does not reassign that new Array to the `remaining_cards` variable; thus, `remaining_cards` is still pointing to an Array object that contains Symbol objects, which when the `sum` method attempts to add them, an error is produced; to fix the problem, we must implement a code something like the following: `sum += remaining_cards.map { |card| score(card) }.sum`
  * Line 35: this line closes the `reduce` method call with an `end`; the return value of the last line of the block, the value of the local inner-scope memo-variable `sum` will be assigned to the outer scope variable `sum`.
* Line 37: the value of the object assigned to the outer scope variable `sum` will be printed to the screen as a result of the `puts` method call, which returns `nil`.

---

**Modified Code:**

```ruby
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts 	 => cards,
  			 :diamonds => cards,
  			 :clubs		 => cards,
  			 :spades	 => cards }

def score(card)
  case card
  when :ace 	then 11
  when :king 	then 10
  when :queen then 10
  when :jack 	then 10
  else card
  end
end

# Pick one random card per suit
    
player_cards = []
deck.keys.each do |suit|
	cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck
    
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
	sum += remaining_cards.map { |card| score(card) }.sum
end

puts sum
```

---

**Why is the sum lower than it should be?**

The sum is lower than it should be because each of the suits, which are represented by Symbol keys in the Hash object assigned to `deck`, are all paired to values that all point to the same Array object assigned to the `cards` variable. Thus, when the destructive `pop` method is called on `cards`, which is an inner-scope variable, but still pointing to the outer-scope `cards` variable, it permanently removes that element from the Array object assigned to the outer-scope `cards` variable; since, each suit key in the Hash object assigned to `deck` points to this Array object, each element that is removed will mean that the same card will be removed for each suit, which is not what is desired. In the end, rather than having just four cards in total removed rom the deck, four * four cards will be removed, so that when we sum up the remaining cards, the sum is four times less than what it should be. In order to fix this problem, we shall use a 'clone' of the Array object assigned to `cards` as the values for the Hash object assigned to `deck`, as in: `cards.clone`. See the revised code below:

```ruby
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit
    
player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end


# Determine the score of the remaining cards in the deck
    
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  sum += remaining_cards.map { |card| score(card) }.sum
end

puts sum
```

---



  

