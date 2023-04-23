# triangle_sides.rb

# write a method:
# input: three arguments: the lengths of the three sides of a triangle
# output: a symbol, corresponding to the type of triangle or invalid if the
# three arguments do not correpsond to a valid triangle

# valid: 1) sum of the lengths of two shortest sides must be greater than the
# length of the third side; 2) all sides must have lengths greater than 0;
# invalid: 1 || 2
# equilateral: all 3 sides are of equal length
# isoceles: 2 sides are of equal length, while the 3rd is different
# scalene: all 3 sides are different


def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  return :invalid if sides[0] == 0 || sides[0] + sides[1] <= sides[2]
  return :equilateral if sides.uniq.size == 1
  return :isoceles if sides.uniq.size == 2
  return :scalene if sides.uniq.size == 3
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isoceles
p triangle(3, 4, 5) == :scalene
p triangle(3, 1, 1) == :invalid
p triangle(3, 0, 5) == :invalid


