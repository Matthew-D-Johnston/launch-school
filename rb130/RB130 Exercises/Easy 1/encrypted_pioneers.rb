# encrypted_pioneers.rb

CHAR_INVERSE = { 'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q', 'e' => 'r',
                 'f' => 's', 'g' => 't', 'h' => 'u', 'i' => 'v', 'j' => 'w',
                 'k' => 'w', 'l' => 'y', 'm' => 'z', 'n' => 'a', 'o' => 'b',
                 'p' => 'c', 'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
                 'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k', 'y' => 'l',
                 'z' => 'm' }

def decipher(string)
  deciphered = ''

  string.each_char do |char|
    if char.match?(/[^a-z]/i)
      deciphered << char
    elsif char == char.downcase
      deciphered << CHAR_INVERSE[char]
    else
      deciphered << CHAR_INVERSE[char.downcase].upcase
    end
  end

  deciphered
end

# puts decipher("Uryyb")
# puts decipher("Znggurj")

names = ["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat",
         "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
         "Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof",
         "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx", "Xbaenq Mhfr",
         "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb",
         "Unllvz Fybavzfxv", "Tregehqr Oynapu"
        ] 

names.each { |name| puts decipher(name) }

puts "------------"
# Launch School's Solution:

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                          encrypted_char
  end
end
    
ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
