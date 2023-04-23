# short_long_short.rb

def short_long_short(str1, str2)
  ordered = [str1, str2].sort { |elem1, elem2| elem1.length <=> elem2.length }
  ordered[0] + ordered[1] + ordered[0]
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
