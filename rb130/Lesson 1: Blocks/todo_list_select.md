##### RB130 Ruby Foundations: More Topics > Lesson 1: Blocks

---

## Assignment: TodoList#select

###### Step 1

Let's continue using our `TodoList` and `Todo` classes, keeping in mind that out `TodoList` class should have a `TodoList#each` method.  

In this assignment, you are to build a `TodoList#select` method, very similar to `Array#select` or the `select` method we built ourselves earlier. Take a look at the following code examples for how it should behave:

```ruby
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect
```

If you run that code, you should see an output that looks something like this:

```ruby
[#<Todo:0x007fd88c0ad9f0 @title="Buy milk", @description="", @done=true>]
```

That's an array which contains all done todos from `list`. In this case, there's only 1 todo that's done, so there's only one element in the array.  

Hints:  

1. Review how we built the `select` method from earlier.
2. You'll need some way to iterate over the `@todos`; use `TodoList#each`.

---

### My Solution:

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def select
    selected = []
    
    self.each do |todo|
      selected << todo if yield(todo)
    end
    
    selected
  end
end   
```

---

## Launch School Solution

```ruby
class TodoList
  
  # ... rest of class omitted for brevity
  
  def select
    results = []
    each do |todo|
      results << todo if yield(todo)
    end
    results
  end
  
end
```

---

###### Step 2

However, right now our `TodoList#select` method returns an Array object rather than a TodoList object, which deviates from the way in which the `Array#select` method returns an object of the same class as the calling object (i.e. an Array object).  

Your next task is to refine the `TodoList#select` method so that it still behves the same, except instead of returning an `Array` object, it returns a `TodoList` object.  

Hint: notice that `Array#select` and `Hash#select` both return a _new_ object. It's not a destructive action. The original object is left alone, and a new object is returned.

#### My Solution:

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def select    
    selected_list = TodoList.new("Selected List")
    
    each do |todo|
      selected_list.add(todo) if yield(todo)
    end
   
    # selected.each { |selected_todo| selected_list.add(selected_todo) }
	  selected_list
  end
end  
```

#### Launch School's Solution:

```ruby
class TodoList
  
  # ... rest of class omitted for brevity
  
  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end
  
end
```

---

###### Step 3

One final refinement we should make is to a previous method: `TodoList#each`. Notice that it, too, doesn't follow the pattern. One quirk with `Array#each` and `Hash#each` is that it returns the _original_ object.  

Update the `TodoList#each` method so that it returns the original (not new) `TodoList` object.  

Hint: returning a new `TodoList` object is easy: just instantiate it. But how do we return the "current" object?    

#### My Solution:  

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
	def each
    counter = 0
    
    while counter < size
      yield(item_at(counter))
      counter += 1
    end
    
    self
  end
end
```

#### Launch School's Solution:

```ruby
class TodoList

  # ... rest of code omitted for brevity

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

end
```



