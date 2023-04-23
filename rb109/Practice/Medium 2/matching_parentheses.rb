# matching_parentheses.rb

# Write a method

def balanced?(string)
  return false if string.count('()').odd?
  parenthesis_tracker = 0

  string.each_char do |char|
    if char == '('
      parenthesis_tracker += 1
    elsif char == ')'
      parenthesis_tracker -= 1
    end

    break if parenthesis_tracker < 0
  end

  parenthesis_tracker >= 0
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
