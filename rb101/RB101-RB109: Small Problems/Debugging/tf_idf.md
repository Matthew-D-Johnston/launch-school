### TF-IDF

---

A friend of yours wants to build a basic search engine and starts reading up on information extraction. He decides to try a simple implementation of TF-IDF, a measure of the information content a term holds for a particular document in a document collection. However, he just started learning to code and somehow his numbers do not match what is expected. He knows you're enrolled in an awesome developer school, so he asks you to have a look.

```ruby
# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)

def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }
  
  Math.log(number_of_documents / number_of_documents_with_term)
end

# Very simple example

document 1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for the document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0

puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0

puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 3.3

puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4
```

---

**The Problem:**

While some of the results match up with what is expected, the majority do not. Indeed, it is only the first two `puts` calls and the last two that don't match what is expected.

---

**Line-by-Line Code Breakdown:**

* Lines 6-8: definition of the `tfidf` method, which is defined with three parameters:
  * Line 6: the `tfidf` method definition is initialized with the `def` keyword, and is defined with the parameters `term`, `document`, and `documents`;
  * Line 7: the `tf` method is called, taking the `term` and `document` parameters as arguments; the return value of the `tf` method is then multiplied, `*`, by the value returned by the `idf` method call, which also takes the `term` and `document` parameters as arguments; the expected return value of the `tfidf` method is a numeric object (specifically a float object);
  * Line 8: the `tfidf` method definition is closed with the `end` keyword. 
* Lines 13-15: definition of the `tf` method, which is defined with two parameters:
  * Line 13: the `tf` method definition is initialized with the `def` keyword, and is defined with the parameters `term` and `document`;
  * Line 14: the `split` method is called on the `document` parameter (which references a string object); the argument passed to the `split` method is a regex (`[\s-]`) that matches any white-space character and `-` characters; thus, the return value of the `split` method call on `document` will be an array object that contains the individual words of the original string object that had been separated by white-spaces and `-` characters; then the `count` method is called on the return value of the `split` method (which is an array object); `count` is followed by a block argument with a `word` parameter; `count` iterates through the array object on which it is called and successively passes each element as an argument to the block, assigning `word` to the individual string objects of the array; the `downcase` method is then called on `word` and compared for equality (`==`) with the `term` parameter; for each iteration where the return value of the equality comparison is `true`, the `count` method adds one to the count, so that the final return value of `count` will be the cumulative sum of the ones returned by the block; thus, the return value of the `count` method call and therefore return value of the `tf` method will be an integer object corresponding to the number of times a particular term, specified by the `term` parameter, is contained within a string object, specified by the `document` parameter.
  * Line 15: the `tf` method is closed with the `end` keyword.

Comment: the problem with the above `tf` method definition is the regex expression on line 14: it only splits words along whitespaces and `-` characters, which means that if a word is followed by some other punctuation mark, like `?`, then that punctuation marked will be tacked on to the end of some words. Thus, when comparing those words to a specific term, those words with punctuation marks tacked on the end won't match when they are expected too. For example, `'cat?' == 'cat'` will evaluate to `false` and thus won't be counted by the `count` method. Perhaps, something like `[\s\W]` might work.

* Lines 22-27: definition of the `idf` method, which is defined with two parameters:
  * Line 22: the `idf` method definition is initialized with the `def` keyword and is defined with the parameters `term` and `documents`;
  * Line 23: the `number_of_documents` variable is initialized with assignment to the return value of a `length` method call on the `documents` parameter, which is referencing an array object containing variables assigned to individual string objects; thus, the return value will be an integer object corresponding to the number of elements of the array object;
  * Line 24: the `number_of_documents_with_term` variable is initialized with assignment to the return value of the `count` method called on the `documents` parameter; `count` is called with a block argument, which on each iteration of `count`, is passed one of the elements of the array object referenced by `documents`; the block's `d` parameter is assigned, on each iteration, to one of the array object's elements, which is a string object; within the block, the `tf` method is called and is passed the`idf` method's `term` parameter and the block's `d` parameter is arguments; the return value of the `tf` method, which is an integer object, is then compared to `0` using a `>` operator; thus, for any of the `d` string objects containing at least one instance of the `term` string object, the return value of the `count` method's block will be `true` and will add another one to the cumulative sum of the `count` method; thus `number_of_documents_with_term` is assigned to an integer object.
  * Line 26: the `Math.log` method is called, which returns the logarithm of the argument passed to it, which in this case is the return value of,  `number_of_documents / number_of_documents_with_term`; for instance, if the total number of documents is `3` and the number of documents that include the specified term is also `3`, then the value that will be evaluated by `Math.log` is `1`, which will return `0.0`. I think this method maybe causing some issues due to the way in which Ruby will perform a division operation on integers; what will need to happen is that the integer objects will need to be converted to float objects using `to_f`; indeed, running that through irb confirms my suspicion;
  * Line 27: the `idf` method definition is closed with the `end` keyword.
* Line 31: the `document1` variable is initialized with assignment to a string object.
* Line 37: the `document2` variable is initialized with assignemt to a string object.
* Line 41: the `document3` variable is initialized with assignment to a string object.
* Line 47: the `documents` variable is initialized with assignment to an array object containing the variables `document1`, `document2`, and `document3` as its elements.
* Lines: 56-70: `puts` method calls on the `tfidf` method with various different arguments passed to it.

---

**Modified Code:**

```ruby
def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  Math.log(number_of_documents.to_f / number_of_documents_with_term.to_f)
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0

puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0

puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 3.3

puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4
```

---

**Launch School's Solution:**

Instead of converting to float objects, Launch School uses `fdiv`, the _float division_ method.

```ruby
def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  Math.log(number_of_documents.fdiv(number_of_documents_with_term))
end
```

---

**Further Exploration:**

There's still one issue that could get us into trouble when performing division. If you don't see it immediately, remove `document1` from the `documents` collection and check the TF-IDF value of `quantum` again.



The problem that arises is when the term we are checking does not exit in any of the documents in our search. What is returned is `NaN`. We can fix this by implementing a modification to the `idf` method, as follows:

```ruby
def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  if number_of_documents_with_term > 0
    Math.log(number_of_documents.to_f / number_of_documents_with_term.to_f)
  else
    0
  end
end
```

Thus, the final code will be:

```ruby
def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  if number_of_documents_with_term > 0
    Math.log(number_of_documents.to_f / number_of_documents_with_term.to_f)
  else
    0
  end
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0

puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0

puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 3.3

puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4
```

