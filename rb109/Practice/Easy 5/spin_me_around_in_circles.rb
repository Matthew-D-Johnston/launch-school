# spin_me_around_in_circles.rb

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p msg = "hello world"
p msg.object_id
p new_msg = spin_me("hello world") # "olleh dlrow"
p new_msg.object_id

# it will be a different object
