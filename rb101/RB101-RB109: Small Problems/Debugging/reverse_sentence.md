### Reverse Sentence

---

The `reverse_sentence` method should return a new string with the words of its argument in reverse order, without using any of Ruby's built-in `reverse` methods. However, the code below raises an error. Change it so that it behaves as expected.

```ruby
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []
  
  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end
  
  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
```

---

**The Problem:**

The `reverse_sentence` method, when the string `'how are you doing'` is passed as an argument to it, is expected to return `'doing you are how'`; however, it returns an error message instead: `no implicit conversion of Array into String`.

---

**Line-by-Line Code Breakdown:**

* Lines 1 – 12: we have a method definition, which is defined with a parameter that takes a String object as an argument and passest it through the method's block:
  *  On line 1, we have the intialization of the `reverse_sentence` method definition, defined with a parameter denoted by `sentence`;
  * On line 2, we have a variable assignment and a `split` method call:
    * The `split(' ')` method is called on the `sentence` variable, which will split the String object to which `sentence` refers into individual words as separated by spaces (i.e. `' '`); 
    * the return value of the `split(' ')` method call is then assigned to the `words` variable.
  * On line 3, we have variable assignment again, with an empty Array object, `[]`, being assigned to the `reversed_words` variable;
  * On line 5, we have another variable assignment, with the Integer object `0` being assigned to the `i` variable;
  * Lines 6 – 9: we have a `while` loop:
    * On line 6, the `while` loop is initialized with the condition that `i < words.length`, which means that the `while` loop will continue to loop so long as the value associated by `i` is less than the return value of the `length` method being called on the `words` variable;
    * On line 7, we have a variable re-assignment, a summation operation, and an index reference:
      * `words[i]` returns the `ith` index of the Array object assigned to the `words` variable, with the initial `i` being equal to zero;
      * An attempt is then made to add the return value of `words[i]`, which will be a String object, to the Array object assigned to `reversed_words`; but this is where the code breaks down because a String object and an Array object cannot be added together; what we want to do is add the String object as one of the elements of the Array object; the `unshift` method would be more appropriate here;
    * On line 8, we have variable reassignment again, with `i` being incremented by one, which will then be used to call the next element of the Array object assigned to `words`;
    * On line 9, we have the formal end to the `while` loop.
  * On line 11, we have a `join(' ')` method call on the `reversed_words` variable, which will join all of the elements of the Array object assigned to `reversed_words`, and will return a String object with all of the elements separated by a single space; since this is the last line of the method definition's block, this is the line that will be returned when the method is called.
  * On line 12, we have the formal end to the `reverse_sentence` method.

---

**Modified Code:**

```ruby
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []
  
  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end
  
  reversed_words.join(' ')
end
```

---

**Launch School's Solution:**

```ruby
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []
  
  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end
  
  reversed_words.join(' ')
end
```

