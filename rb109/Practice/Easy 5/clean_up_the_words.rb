# clean_up_the_words.rb

def cleanup(string)
  string.gsub(/[^a-z]+/i, ' ')
end

p cleanup("---what's my +*& line?")  == ' what s my line '