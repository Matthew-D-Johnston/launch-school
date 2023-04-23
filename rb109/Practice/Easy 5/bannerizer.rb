# bannerizer.rb


def print_in_box(message)
  puts "+" + "-"*(message.length + 2) + "+"
  puts "|" + ' '*(message.length + 2) + "|"
  puts "| " + message + " |"
  puts "|" + ' '*(message.length + 2) + "|"
  puts "+" + "-"*(message.length + 2) + "+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('Matt Johnston')
print_in_box('Not as painful as I was expecting. Phew.')
print_in_box('')
