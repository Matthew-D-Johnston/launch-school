### Neutralizer

---

We wrote a `neutralize` method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

```ruby
def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end
  
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
   ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
```

---

**The Problem:**

The actual output includes the word 'boring', which we had expected to be output. This likely has to do with the way that the `each` method consecutively iterates over the indexes of the elements of the array object referenced by `words`. Specifically, after the `delete` method deletes `'dull'` from the array, `'boring'` moves into the index that was formerly occupied by `'dull'` and thus on the next iteration of the `each` method, `'cards'` is sitting in the current spot where `'boring'` used to occupy.

---

**Line-by-Line Code Breakdown:**

* Lines 1-8: method definition:
  * Line 1: the `neutralize` method is initialized with the `def` keyword and is intialized with a single `sentence` parameter, which will be assigned a string object as an argument when the method is called;
  * Line 2: the `split(' ')` method is called on the `sentence` parameter, splitting the string object assigned to `sentence` into individual word elements according to their separation within the string by `' '`; these word elements are used to populate a new array object that is assigned to a newly initialized `words` local variable;
  * Lines 3-5: the `each` method is called on `words`, followed by a block with a single parameter:
    * Line 3: the `each` method is called on `words`, the elements of which will be separately passed as arguments to the `each` block on each iteration of the `each` method, and will be successively assigned to the block's `word` parameter;
    * Line 4: the `delete` method is called on `words` and deletes the current element from the array object referenced by `words` if the return value of the `if` conditional statement evaluates to `true`; the `if` conditional statement evaluates to `true` if the `negative?` method call, which takes the `word` parameter as an argument, evaluates to `true`; the `negative?` method is defined on lines 10-16; however, the source of the problem highlighted in the previous section appears to have to do with the destructive nature of the `delete` method: because `delete` permanently mutates `words`, any element that is deleted will have its indexed spot taken by the element currently occupying the next indexed spot (i.e. the current index plus one), which means that on the next iteration of the `each` method, that element will not be iterated over since it is occupying an indexed spot that has already been iterated on;
    * Line 5: the each method is closed with the use of the `end` keyword.
  * Line 7: the `join(' ')` method is called on `words`, which still references the original array object, albeit now in a modified form with certain elements deleted.
  * Line 8: the `neutralize` method definition is closed with the `end` keyword.
* Lines 10-16: method definition:
  * Line 10: the `negative?` method definition is initialized with the `def` keyword, and is defined with a single `word` parameter, which will be assigned to a string object passed as an argument to the `negative?` method;
  * Lines 11-15: the `include?` method is called on an array object containing a collection of string objects (`['dull', 'boring', 'annoying', 'chaotic']`), and which is passed the `word` parameter as an argument; the `include?` method checks to see if the argument passed to it matches any of the elements contained in the array object upon which it is called; it will return a boolean value, `true` if there is a match and `false` otherwise; as the last line of the method, it is this boolean value that will be the return value of the method;
  * Line 16: the `negative?` method is closed with the `end` keyword.
* Line 18: the `puts` method is called on the `neutralize` method, which is passed the string object `'These dull boring cards are part of a chaotic board game.'` as an argument.

---

**Modified Code:**

```ruby
def neutralize(sentence)
  words = sentence.split(' ')
  neutral_words = []
  words.each do |word|
    neutral_words << word unless negative?(word)
  end

  neutral_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These cards are part of a board game.
```

----

**Launch School's Solution:**

```ruby
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
   ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
#=> These cards are part of a board game.
```

---

**Further Exploration:**

Note that we use `reject!` here, which does mutate the array while iterating over it. But the way `reject!` is implemented, it takes special care to avoid the problem we had in our code. We could re-implement it in Ruby as follows:

```ruby
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length
    
    if yield(array[i]) # if array [i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end
  
  array
end
```

For now, just read `if yield(array[i])` as "_if `array[i]` meets the condition checked by the block_"; you will learn about using blocks in methods in course RB130. The important point is that `i` is not increased when the condition is met and the element is removed. This prevents the loop from skipping over elements like what happened in our case.