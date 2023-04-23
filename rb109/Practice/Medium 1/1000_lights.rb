# 1000_lights.rb

# write a method
# input: an integer signifying number of lights and number of repetitions
# output: an array identifying which lights are on after the n repetitions

# Algorithm:
# round 1: lights = [true] * 5 (all lights are on)
# round 2: lights = [true, false, true, false, true]
# start_idx = 1; increment = 2
# lights[start_idx] = !lights[start_idx]
# start_idx += increment

def which_lights_are_on(n)
  lights = [true] * n


  start_idx = 1
  increment = 2
  until increment > n
    idx = start_idx
    while idx < lights.size
      lights[idx] = !lights[idx]
      idx += increment
    end
    start_idx += 1
    increment += 1
  end
  lights_on = []
  lights.each_with_index do |light, idx|
    lights_on << (idx + 1) if light
  end
  lights_on
end

p which_lights_are_on(5)
p which_lights_are_on(10)
