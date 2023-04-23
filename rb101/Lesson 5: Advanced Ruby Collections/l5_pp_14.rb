# l5_pp_14.rb

# Practice Problem 14
# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_array = []
hsh.each do |food, traits|
  case traits[:type]
  when 'fruit'
    new_array << traits[:colors].map { |color| color.capitalize }
  when 'vegetable'
    new_array << traits[:size].upcase
  end
  new_array
end
p new_array

puts '------'

# Launch School solution:

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value [:type] == 'vegetable'
    value[:size].upcase
  end
end



