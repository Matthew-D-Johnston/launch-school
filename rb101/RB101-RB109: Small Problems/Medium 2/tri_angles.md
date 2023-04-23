### Tri-Angles

---

**Problem:**

A triangle is classified as follows:

* **right:** One angle of the triangle is a right angle (90 degrees)
* **acute:** All 3 angles of the triangle has less than 90 degrees
* **obtuse:** One angle is greater than 90 degrees



To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.



Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol `:right`, `:acute`, `:obtuse`, or `:invalid` depending on whether the triangle is a right, acute, obtuse, or invalid triangle.



You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

---

**Examples / Test Cases:**

```ruby
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
```

---

**Data Structure:**

**_Inputs_**

* Three arguments: integer values corresponding to the three angles (in degegrees) of a triangle.

**_Outputs_**

* A symbol indicating the type of triangle or, if the angles given do not constitute a valid triangle, a symbol indicating an invalid triangle.

**_Rules_**

* Assume integer valued angles
* Assume arguments are specified in degrees

---

**Algorithm:**

* Initialize method definitions: `def triangle(angle1, angle2, angle3)`
* Create an array of the three angles: `angles = [angle1, angle2, angle3]`
* Set up `if/else` conditional to deal with the initial check for whether we have a valid triangle or not:
  * `if angles.all? { |angle| angle > 0 } && angles.reduce(&:+) == 180` then triangle is valid and we can go on to determine what kind of triangle we are dealing with.
  * `else` we can return `:invalid`
* To determine what type of triangle we are dealing with, we can use a `case` conditional statement:
  * First case: `when angles.any? { |angle| angle == 90 } then :right`
  * Second case: `when angles.all? { |angle| angle < 90 } then :acute`
  * Third case: `when angles.any? { |angle| angle > 90 } then :obtuse`
* That should cover everything.

---

**Code:**

```ruby
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  if angles.all? { |angle| angle > 0 } && angles.reduce(:+) == 180
    if angles.any? { |angle| angle == 90 }
      :right
    elsif angles.all? { |angle| angle < 90 }
      :acute
    else
      :obtuse
    end
  else
    :invalid
  end
end 
```

---

**Launch School Solution:**

```ruby
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case 
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end
```

