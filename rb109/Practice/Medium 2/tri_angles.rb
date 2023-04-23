# tri_angles.rb

# write a method
# input: three arguments corresponding to the angles of three triangles
# output: a symbol corresponding to the type of triangle or invalid if the 
# angles given do not represent a valid triangle

# valid: 1) sum of angles must be 180 degrees; 2) all angles must be greater
# than 0
# invalid: if sum != 180 || any angle < 0
# right: one angle == 90
# acute: all three angles < 90
# obtuse: one angle > 90

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3].sort
  return :invalid if angles.sum != 180 || angles[0] <= 0
  return :right if angles.count(90) == 1
  return :acute if angles.count { |angle| angle < 90 } == 3
  return :obtuse if angles.count { |angle| angle > 90 } == 1
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

 