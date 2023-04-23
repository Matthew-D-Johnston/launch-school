# 1000_lights.rb
# You have a bank of switches before you, numbered from 1 to `n`. Each switch
# is connected to exactly one light that is initially off. You walk down the
# row of switches and toggle every one of them. You go back to the beginning,
# and on this second pass, you toggle switches 2, 4, 6, and so on. On the third
# pass, you go back to the beginning and toggle switches 3, 6, 9, and so on.
# You repeat this process and keep going until you have been through `n`
# repetitions.

# Write a method that takes one argument, the total number of switches, and
# and returns an Array that identifies which lights are on after `n`
# repetitions.

# Example with `n` = 5 lights:
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The resut is that 2 lights are left on, lights 1 and 4. The return value is
# [1, 4].
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is
# [1, 4, 9]

# Pseudo-Code

# Data Structure:
# input: an integer indicating the total number of lights
# output: an array displaying the number of each light that is turned on

# Algorithm
# 1) initialize method definition: lights_turned_on(n)
# 2) create a new hash that will use the light number as the key and booleans
#    as values, with false corresponding to off and true corresponding to on.
# 3) some sort of loop to iterate
# 4) define some counter, beginning at 1: counter = 1
# 5) within the loop, will need to use the modulo operator %
#    round 1: loop over hash and for each key where the remainder from key %
#    counter is equal to 0, we want to switch the boolean to a true value; then
#    increase the counter by 1.
# 6) Outside of the loop we want to select from the hash all of the elements
#    whose values are true and return the resulting array.

def lights_turned_on(n)
  lights = {}
  1.upto(n) { |num| lights[num] = false }

  counter = 1
  loop do
    1.upto(n) { |num| lights[num] = !lights[num] if num % counter == 0 }
    counter += 1
    break if counter > n
  end

  lights.select { |_, status| status == true }.keys
end

p lights_turned_on(5) == [1, 4]
p lights_turned_on(10) == [1, 4, 9]
p lights_turned_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144,
                             169, 196, 225, 256, 289, 324, 361, 400, 441, 484,
                             529, 576, 625, 676, 729, 784, 841, 900, 961
                            ]

puts '-----'

# Launch School solution:

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p lights_turned_on(5) == [1, 4]
p lights_turned_on(10) == [1, 4, 9]
p toggle_lights(1000)

puts '------'

# Further Exploration:

# There are a few interesting points about this exercise that we can explore:

# 1. Do you notice the pattern in our answer? Every light that is on is a
#    perfect square. Why is that?
# 2. What are some alternatives for solving this exercise? What if we used an
#    `Array` to represent our 1000 lights instead of a `Hash`, how would that
#    change our code?
# 3. We could have a method that replicates the output from the description of
#    this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How
#    would we go about writing that code?

# 1. 