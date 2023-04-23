# hard_one_q_four.rb

def is_an_ip_number?(string)
  return false if string.to_i.to_s != string
  (0..255).include?(string.to_i)
end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop

    if is_an_ip_number?(word)
      next
    else
      return false
    end
  end
  
  true
end

puts dot_separated_ip_address?("234.45.2.6") == true
puts dot_separated_ip_address?("255.3.9") == false
puts dot_separated_ip_address?("0.245.34.56.21") == false
puts dot_separated_ip_address?("43.256.43.21") == false
puts dot_separated_ip_address?("1.2.3.4") == true
puts dot_separated_ip_address?("hallo") == false


