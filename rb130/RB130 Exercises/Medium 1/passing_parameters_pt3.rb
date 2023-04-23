# passing_parameters_pt3.rb

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1) 
gather(items) do |*firsts, last|
  puts firsts.join(', ')
  puts last
end

puts '------'
# 2)
gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

puts '------'

# 3)
gather(items) do |first, *lasts|
  puts first
  puts lasts.join(', ')
end

puts '------'

# 4)
gather(items) do |first, second, third, last|
  puts "#{first}, #{second}, #{third}, and #{last}"
end

