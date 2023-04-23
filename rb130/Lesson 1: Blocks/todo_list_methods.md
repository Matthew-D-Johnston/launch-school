##### RB130 Ruby Foundations: More Topics > Lesson 1: Blocks

---

## Assignment: TodoList methods

We want to implement some more methods for our `TodoList` class that can piggy-back off of the `TodoList#each` and `TodoList#select` methods.  

Hint: use either `TodoList#each` or `TodoList#select` for the implementation.

---

#### 1. `find_by_title`  

**Problem:**  

This method takes a string as argument, and returns the first `Todo` object that matches the argument. Return `nil` if no todo is found.  

**Examples / Test Cases:**  

```ruby
list.find_by_title("Clean room")
# => todo2
list.find_by_title("Buy groceries")
# => nil
```

**Data Structure:**  

**_Inputs_**

* The method will take a String object representing the title of a todo, which is refereneced by a specific Todo object's `@title` instance variable.

**_Ouputs_**

* If the title matches that of an existing Todo object contained in the todo list, then that Todo object will be returned; otherwise, `nil` will be returned.  

**Algorithm:**  

* We will want to implement the use of our `TodoList#select` method here, selecting just those todo objects that have the title specified by the argument passed to the method.
* We will iterate over the elments contained on our todo list, and use a the equality comparison method, `==` on the titles of each in order to compare with the String object passed in as an argument to the method.

**Code:**  

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def find_by_title(todo_title)
    result = self.select { |todo| todo.title == todo_title }
    
    if result.size == 1
      result.first
    elsif result.size > 1
      result
    else
      nil
    end
  end
end
```

Noticed that I tweaked the method so that it provides another possible return value in the case where there are multiple todo objects with the same title.

---

#### 2. `all_done`

**Problem:**  

Returns new `TodoList` object containing only the done items.  

**Examples / Test Cases:**  

```ruby
puts list.to_s
# ---- Today's Todos ----
# [X] Buy milk
# [ ] Clean room
# [X] Go to gym

p list.all_done
# => #<TodoList:0x00007f8d6e08ab30 @title="Today's Done Todos", @todos=[#<Todo:0x00007f8d6e08a388 @title="Buy milk", @description="", @done=true>, #<Todo:0x00007f8d6e08a8b0 @title="Go to gym", @description="", @done=true>]>
```

**Data Structure:**  

**_Inputs_**

* The calling object of the method is a TodoList object.

**_Outputs_**

* The method will return a new TodoList object containing only the Todo objects that have been completed.  

**Algorithm:**  

* We will make use of our `TodoList#select` method: initialize a local variable that references an Array object whose elements are a result of iteration using the `select` method, which selects the Todo objects that have been completed.
* We must then create a new TodoList object.
* We will then iterate over the new Array object and call the `TodoList#add` method on our new TodoList object, adding each of the Todo objects from the Array object.  

**Code:**  

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def all_done
    done_list_array = self.select { |todo| todo.done? }
    done_list_object = TodoList.new("Today's Done Todos")
    done_list_array.each { |todo| done_list_object.add(todo) }
    done_list_object
  end
end
```

---

#### 3. `all_not_done`

**Problem:**  

Returns new `TodoList` object containing only the not done items.  

**Examples / Test Cases:**  

```ruby
puts list.to_s
# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [X] Go to gym

p list.all_not_done
# => #<TodoList:0x00007f8d6e08ab30 @title="Today's Done Todos", @todos=[#<Todo:0x00007f8d6e08a388 @title="Buy milk", @description="", @done=false>, #<Todo:0x00007f8d6e08a8b0 @title="Clean room", @description="", @done=false>]>
```

**Data Structure:**  

**_Inputs_**

* The calling object of the method is a TodoList object.

**_Outputs_**

* The method will return a new TodoList object containing only the Todo objects that have not been completed.  

**Algorithm:**  

* We will make use of our `TodoList#select` method: initialize a local variable that references an Array object whose elements are a result of iteration using the `select` method, which selects the Todo objects that have not been completed.
* We must then create a new TodoList object.
* We will then iterate over the new Array object and call the `TodoList#add` method on our new TodoList object, adding each of the Todo objects from the Array object.  

**Code:**  

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def all_not_done
    not_done_list_array = self.select { |todo| !todo.done? }
    not_done_list_object = TodoList.new("Today's Not Done Todos")
    not_done_list_array.each { |todo| not_done_list_object.add(todo) }
    not_done_list_object
  end
end
```

---

#### 4. `mark_done`

**Problem:**  

Takes a string as argument, and marks the first `Todo` object that matches the argument as done.  

**Examples / Test Cases:**  

```ruby
todo2.done?
# false

list.mark_done("Clean room")
todo2.done?
# true
```

**Data Structure:**  

**_Inputs_**

* The calling object is a TodoList object but the argument passed to the method is a String object representation of a Todo object's title.

**_Outputs_**

* The result of the method operation is to mark as done the Todo object with the title specified by the argument passed to the method.

**Algorithm:**  

* We can use our `find_by_title` method defined above to find the appropriate Todo object; however, note that in the case that the `find_by_title` method returns an Array object containing more than one Todo object with the same title, we will need to provide a special case for that instance, and also one in the case where `find_by_title` returns `nil`.

**Code:**  

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def mark_done(todo_title)
    todo = find_by_title(todo_title)
    
    if todo.instance_of?(Todo)
      todo.done!
    elsif todo.instance_of?(Array)
      todo.each { |elem| elem.done! }
    else
      nil
    end
  end
end
```

---

#### 5. `mark_all_done`

**Problem:**  

Mark every todo as done.  

We already have a method called `TodoList#done!` that does the same thing, so we can simply create an alias method by invoking the `alias_method` method.  

**Code:**

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  alias_method :mark_all_done, :done!
end
```

---

#### 6. `mark_all_undone`

**Problem:**  

Mark evey todo as not done.  

This method does the opposite of the `TodoList#done!` and `TodoList#mark_all_done` methods. We shall simply mirror the implementation of the `done!` method, but making sure to mark all Todo objects as undone using the `Todo#undone!` method.  

**Code:**

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def mark_all_undone
    @todos.each { |todo_item| todo_item.undone! }
  end
end
```

---

### Launch School's Solution

```ruby
class TodoList
  
  # ... rest of code omitted for brevity
  
  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end
  
  def all_done
    select { |todo| todo.done? }
  end
  
  def all_not_done
    select { |todo| !todo.done? }
  end
  
  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end
  
  def mark_all_done
    each { |todo| todo.done! }
  end
  
  def mark_all_undone
    each { |todo| todo.undone! }
  end
end
```

After looking at these solutions I realize that I forgot that the `select` and `each` methods that I defined for the `TodoList` class actually return a new TodoList object rather than Array objects. Thus, the much easier implementation employed by Launch School's method definitions.