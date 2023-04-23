### Complete the Program - Cats!

---

**Problem:**  

Consider the following program.

```ruby
class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
```

Update this code so that when you run it, you see the following output:

```
My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.
```

---

**My Solution:**  

```ruby
class Pet
  def initialize(name, age, fur_colour)
    @name = name
    @age = age
    @fur_colour = fur_colour
  end
end

class Cat < Pet
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@fur_colour} fur."
  end
end
```

---

**Launch School's solution:**

```ruby
class Cat < Pet
  def initialize(name, age, colors)
    super(name, age)
    @colors = colors
  end
  
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@colors} fur."
  end
end
```

###### Discussion

Since `Cat#new` requires arguments that differ from `Pets#new`, we must define an `initialize` method for `Cat`, and that method must be sure to call `super`. Additionally, the fact that the two `initialize` methods take different arguments also forces us to supply the correct arguments to `super`.  



Cat objects must responsd appropriately to `puts`. The way to do this is to override `to_s` to provide the appropriate value, which we do.

---

**Further Exploration:**  

An alternative approach to this problem would be to modify the `Pet` class to accept a colors parameter. If we did this, we wouldn't need to supply an `initialize` method for `Cat`.



Why would we be able to omit the `initialize` method? Would it be a good idea to modify `Pet` in this way? Why or why not? How might you deal with some of the problems, if any, that might arise from modifying `Pet`?



###### My Response:  

I think that in this case modifying `Pet` is appropriate since all animals have a colour. If there is a special class that inherits from `Pet` and which does not need a `colour` variable defined, then that class could have its own special `initialize` method specific to it.