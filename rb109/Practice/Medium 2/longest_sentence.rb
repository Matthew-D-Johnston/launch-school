# longest_sentence.rb

# write a program:
# input: a text file (a string)
# output: a string (the longest sentence in the file based on number of words);
# also print the number of words in the longest sentence

# Algorithm:
# scan through the text, looking for either '.', '!'. or '?'
# text.each_char do |char|
# start_index = 0
# end_index = text.length - 1
# current_index = text.index(/[.!?]/)
# number_of_words = 0
# number_of_words_of_largest_sentence = 0
# current_sentence = text[start_index..current_index]
# number_of_words = current_sentence.split.size
# if number_of_words > number_of_words_of_largest_sentence
#     number_of_words_of_largest_sentence = number_of_words
#     longest_sentence = current_sentence
# end
# start_index = current_index + 1

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

book = File.read('pg84.txt')

def find_the_longest_sentence(text)
  start_index = 0
  end_index = text.length - 1
  current_index = end_index

  number_of_words_of_longest_sentence = 0

  longest_sentence = ''

  loop do
    current_index = text[start_index..end_index].index(/[.!?]/) + start_index

    current_sentence = text[start_index..current_index]
    number_of_words_of_current_sentence = current_sentence.split.size

    if number_of_words_of_current_sentence > number_of_words_of_longest_sentence
      number_of_words_of_longest_sentence = number_of_words_of_current_sentence
      longest_sentence = current_sentence
    end

    start_index = current_index + 1
    break if current_index >= end_index || !text[start_index..end_index].index(/[.!?]/)
  end

  puts longest_sentence
  puts number_of_words_of_longest_sentence
end

find_the_longest_sentence(book)

