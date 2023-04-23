### Triangle Sides

---

**Problem:**

A triangle is classified as follows:

* **equilateral:** All 3 sides are of equal length.
* **isosceles:** 2 sides are of equal length, while the 3rd is different.
* **scalene:** All 3 sides are of different length.

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.



Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol `:equilateral`, `:isosceles`, `:scalene`, or `:invalid` depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

---

**Examples / Test Cases:**

```ruby
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
```

---

**Data Structure:**

**_Input:_**

* three different numbers (float or integer).

**_Output:_**

* one of the four following symbols: `:equilateral`, `:isosceles`, `:scalene`, or `:invalid` .

---

**Algorithm:**

* Write a method that tests whether the three numbers given will form a valid triangle; once this method is written, it can be used in an `if/else` conditional where a valid triangle will then be tested for what type of triangle and an invalid triangle will simply return `:invalid`.
* Write a separate method for each of the three types of triangles that outputs a boolean if the conditions for that type of triangle are met.
* For the `valid_triangle?` method:
* There are two conditions that both have to be true in order for the triangle to be valid:
* `if` all sides have lengths `>` 0 `&&` the sum of the lengths of the two shortest sides `>` the length of the longest side.
* For the first condition: `[num1, num2, num3].none? { |num| num <= 0 }`
* For the second condition: `[num1, num2, num3].min(2).sum > [num1, num2, num3].max`
* For the `equilateral?` method:
* `sides = [num1, num2, num3]`
* `sides.uniq.size == 1`
* For `isosceles?` method:
* `sides = [num1, num2, num3]`
* `sides.uniq.size == 2`
* For `scalene?` method:
* `sides = [num1, num2, num3]`
* `sides.uniq.size == 3`

---

**Code:**

```ruby
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  
  if sides.none? { |side| side <= 0 } && sides.min(2).sum > sides.max
    return :equilateral if sides.uniq.size == 1
    return :isosceles if sides.uniq.size == 2
    return :scalene if sides.uniq.size == 3
  else
    return :invalid
  end
end
```

---

**Launch School solution:**

```ruby
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
```

