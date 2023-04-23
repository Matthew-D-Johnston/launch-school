# triangle_sides.rb

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  
  if sides.none? { |side| side <= 0 } && sides.min(2).sum > sides.max
    return :equilateral if sides.uniq.size == 1
    return :isosceles if sides.uniq.size == 2
    return :scalene if sides.uniq.size == 3
  else
    :invalid
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid

puts '-------'

# Launch School solution:

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max
  
  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
   when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end  

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
