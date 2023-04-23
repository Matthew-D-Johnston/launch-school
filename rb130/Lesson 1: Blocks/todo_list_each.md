##### RB130 Ruby Foundations: More Topics > Lesson 1: Blocks

---

## Assignment: TodoList#each

Given our final `Todo` and `TodoList` classes from the previous assignment, implement a `TodoList#each` method. This method should behave similarly to the familiar `Array#each`, and the `each` method we built ourselves in an earlier example. The `TodoList#each` should take a block, and yield each `Todo` object to the block. Here's an example of how to use it:  

```ruby
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end
```

The above should send each of the 3 `Todo` objects to `puts`, which will automatically invoke the `Todo#to_s` method. The output should be:  

```
[ ] Buy milk
[ ] Clean room
[ ] Go to gym
```

Hint: refer to how we built the `each` method from earlier for ideas on how to approach.

---

### My Solution

```ruby
class TodoList
  # ...rest of code omitted for brevity
	
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

---

### Launch School's Solution

```ruby
class TodoList
  
  # ... rest of class omitted for brevity
  
  def each
    @todos.each do |todo|
      yield(todo)
    end
  end
  
end
```

