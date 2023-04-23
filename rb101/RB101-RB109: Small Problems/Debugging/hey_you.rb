# hey_you.rb

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }
  
  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# Modified Code:

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')

# Launch School's Solution:

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end
