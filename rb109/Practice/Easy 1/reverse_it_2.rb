# reverse_it_2.rb

def reverse_words(string)
  words = string.split

  reversed_words = words.map do |word|
    if word.length >= 5
      word.chars.reverse.join
    else
      word
    end
  end

  reversed_words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School') 
