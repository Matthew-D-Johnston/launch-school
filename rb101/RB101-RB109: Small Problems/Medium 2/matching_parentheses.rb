# matching_parentheses.rb

def balanced?(string)
  parentheses = string.chars.select { |char| char == '(' || char == ')' }.join

  loop do
    if parentheses.match?(/\(\)/)
      parentheses.sub!(/\(\)/, '')
    else
      break
    end
  end

  parentheses.empty?
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('((W(ha(t))) (is this))?') == true

puts '------'

# Launch School solution:

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('((W(ha(t))) (is this))?') == true

puts '-------'

# Further Exploration

def balanced_par?(string)
  parentheses = string.chars.select { |char| char == '(' || char == ')' }.join

  loop do
    if parentheses.match?(/\(\)/)
      parentheses.sub!(/\(\)/, '')
    else
      break
    end
  end

  parentheses.empty?
end

def balanced_sqr?(string)
  sqr_brack = string.chars.select { |char| char == '[' || char == ']' }.join

  loop do
    if sqr_brack.match?(/\[\]/)
      sqr_brack.sub!(/\[\]/, '')
    else
      break
    end
  end

  sqr_brack.empty?
end

def balanced_curl?(string)
  curly = string.chars.select { |char| char == '{' || char == '}' }.join

  loop do
    if curly.match?(/\{\}/)
      curly.sub!(/\{\}/, '')
    else
      break
    end
  end

  curly.empty?
end

def balanced_quotes?(string)
  words = string.split
  quote_words = words.select do |word|
    word[0] == "'" || word[0] == "\"" || word[-1] == "'" || word[-1] == "\""
  end
  quote_words_chars = quote_words.join.chars
  quotes_str = quote_words_chars.select { |char| char == "'" || char == "\"" }.join  
  
  loop do
    if quotes_str.match?(/\'\'/)
      quotes_str.sub!(/\'\'/, '')
    elsif quotes_str.match?(/\"\"/)
      quotes_str.sub!(/\"\"/, '')
    else
      break
    end
  end
    
  quotes_str.empty?
end

def balanced?(string)
  balanced_par?(string) && balanced_sqr?(string) && balanced_curl?(string) && balanced_quotes?(string)
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('((W(ha(t))) (is this))?') == true
puts balanced?('[(W(ha{t})) (is this)]?') == true
puts balanced?('[(W(ha{t})] (is this))?')
