##### RB130 Ruby Foundations: More Topics > Lesson 1: Blocks

---

## Assignment: TodoList

**Problem:**  

Given the following `Todo` class definition,

```ruby
# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end
```

write a `TodoList` class definition, whose initial implementation looks like the following:

```ruby
# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

end
```

The assignment is to figure out the rest of the implementation in order for the below code to work.

---

**Examples / Test Cases:**  

Here is the below code that needs to work, and will thus guide the implementation that needs to be defined for the `TodoList` class.

```ruby
# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)						# adds todo1 to end of list, returns list
list.add(todo2) 					# adds todo2 to end of list, returns list
list.add(todo3) 					# adds todo3 to end of list, returns list
list.add(1)								# raises TypeError with message "Can only add Todo objects"

# <<
# same behaviour as add

# ---- Interrogating the list -----

# size
list.size 								# returns 3

# first
list.first								# returns todo1, which is the first item in the list

# last
list.last									# returns todo3, which is the last item in the list

#to_a
list.to_a									# returns an array of all items in the list

# done?
list.done?								# returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
list.item_at 							# raises ArgumentError
list.item_at(1)						# returns 2nd item in list (zero based index)
list.item_at(100) 				# raises IndexError

# ---- Marking items in the list -----

# mark_done_at
list.mark_done_at					# raises ArgumentError
list.mark_done_at(1)			# marks the 2nd item as done
list.mark_done_at(100)		# raises IndexError

# mark_undone_at
list.mark_undone_at				# raises ArgumentError
list.mark_undone_at(1)		# marks the 2nd item as not done,
list.mark_undone_at(100)	# raises IndexError

# done!
list.done!								# marks all items as done

# shift
list.shift								# removes and returns the first item in list

# pop
list.pop									# remoes and returns the last item in list

# remove_at
list.remove_at						# raises ArgumentError
list.remove_at(1)					# removes and returns the 2nd item
list.remove_at(100)				# raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s									# returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy Milk
# [X] Clean room
# [ ] Go to gym
```

---

### Add to the List

**Problem:**  

We want to be able to add items to our TodoList object, which we have assigned to the local variable `list`. Specifically, we have an `@todos` instance variable that references an Array object, and we would like to be able to add individual Todo objects to the Array, making them elements of that Array.  

**Examples / Test Cases:**  

```ruby
# add
list.add(todo1)						# adds todo1 to end of list, returns list
list.add(todo2) 					# adds todo2 to end of list, returns list
list.add(todo3) 					# adds todo3 to end of list, returns list
list.add(1)								# raises TypeError with message "Can only add Todo objects"
```

**Data Structure:**  

**_Inputs_**

* An object of the `Todo` class.

**_Outputs_**

* Returns the Array object, which represents the list of Todo objects.

**_Rules_**

* Should return a TypeError with message "Can only add Todo objects".

**Algorithm:**  

* Begin by defining the `TodoList#add` method with a single parameter: `def add(todo)`
* Use the `Array#push` method to add the argument assigned to the `todo` parameter local variable to the end of the list (i.e. the Array object referenced by `@todos`).
* But we need to nest this code within an `if/else` conditional statement where we raise a TypeError exception if the object assigned to the `todo` local variable is not a Todo object; otherwise we add the object to our `@todos` list.

**Code:**

```ruby
class TodoList
	# rest of code omitted for brevity
	def add(todo)
    if todo.class != Todo
      raise TypeError.new("Can only add Todo objects")
    else
      @todos.push(todo)
    end
  end
  
  alias_method :<<, :add
end
```

---

### Interrogating the List

**Problem:**  

Need to write a number of methods for our `TodoList` class:

* `size`: returns the size of the Array object assigned to our `@todos` instance variable.
* `first`: returns the first item of the Array object assigned to our `@todos` instance variable.
* `last`: returns the last item of the Array object assigned to our `@todos` instnace variable.
* `to_a`: returns an array of all items in the Array object.
* `done?`: returns `true` if all todo items in the list have been completed.

**Code:**

```ruby
class TodoList
  # rest of code omitted for brevity
  
  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def last
    @todos.last
  end
  
  def to_a
    @todos
  end
  
  def done?
    @todos.all? { |todo| todo.done? }
  end
end
```

---

### Retrieving an Item in the List

**Problem:**  

We want a `TodoList#item_at` method that will retrieve the element of our `@todos` Array object specified by the argument passed to the method.  

**Examples / Test Cases:**  

```ruby
list.item_at(1)					# returns 2nd item in list (zero based index)
list.item_at(100) 			# raises IndexError
list.item_at						# raises ArgumentError
```

**Data Structure:**  

**_Inputs_**

* Called on our TodoList object, but passed an Integer object as an argument.

**_Outputs_**

* The Todo object corresponding to the the index of the Array object specificed by the argument passed in.

**_Rules_**

* Be sure to raise the appropriate exceptions as indicated above.

**Algorithm:**  

* We shall use the `fetch` method within the body of our `item_at` method to operate on the Array object referenced by `@todos`

**Code:**  

```ruby
class TodoList
  # rest of code omitted for brevity
  
  def item_at(index)
    @todos.fetch(index)
  end
end
```

---

### Marking Items in the List

**Problem:**  

We need to define three methods in our `TodoList` class:

* `mark_done_at`: marks the Todo object of the given index specfied by the argument as being completed.
* `mark_undone_at`: does the opposite of the `mark_done_at` method.
* `done!`: marks evey item (i.e. Todo object) in the list as done.

Note that if no argument is specified, then an ArgumentError should be raised, and if the argument specified is out of the index range, an IndexError should be raised.  

**Code:**

```ruby
class TodoList
  # rest of code omitted for brevity
  
  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each { |todo_item| todo_item.done! }
  end
end
```

---

### Deleting from the List

**Problem:**  

We need to define three methods for our `TodoList` class that allow us to remove items from the list:  

* `shift`: removes and returns the first item in the list.
* `pop`: removes and returns the last item in the list.
* `remove_at`: removes and returns the item at the index specified by the argument passed to the method.  

Note that for the last method, an ArgumentError should be raised if no argument is supplied, and an IndexError should be raised if the argument supplied goes beyond the index range.  

**Code:**  

```ruby
class TodoList
  # rest of code omitted for brevity
  
  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end
  
  def remove_at(index)
    @todos.delete(item_at(index))
  end
end
```

---

### Outputting the List

**Problem:**  

We need to define a `TodoList#to_s` method that will return a string representation of the list in the following format:

```ruby
# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
```

**Code:**  

```ruby
class TodoList
  # rest of code omitted for brevity
  
	def to_s
    list_output = "---- #{title} ----\n"
    @todos.each { |todo| list_output << todo.to_s + "\n" }
    list_output
  end
end
```



