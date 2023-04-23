# todo_list_methods.rb

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

# Implementation of the `TodoList` class:

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class != Todo
      raise TypeError.new("Can only add Todo objects")
    else
      @todos.push(todo)
    end
  end

  alias_method :<<, :add

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

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each { |todo_item| todo_item.done! }
  end

  alias_method :mark_all_done, :done!

  def mark_all_undone
    @todos.each { |todo_item| todo_item.undone! }
  end

  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    list_output = "---- #{title} ----\n"
    @todos.each { |todo| list_output << todo.to_s + "\n" }
    list_output
  end

  def each
    counter = 0
    
    while counter < size
      yield(item_at(counter))
      counter += 1
    end
    
    self
  end

  def select    
    selected_list = TodoList.new("Selected List")
    
    each do |todo|
      selected_list.add(todo) if yield(todo)
    end

    selected_list
  end

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

  def all_done
    done_list_array = self.select { |todo| todo.done? }
    done_list_object = TodoList.new("Today's Done Todos")
    done_list_array.each { |todo| done_list_object.add(todo) }
    done_list_object
  end

  def all_not_done
    not_done_list_array = self.select { |todo| !todo.done? }
    not_done_list_object = TodoList.new("Today's Not Done Todos")
    not_done_list_array.each { |todo| not_done_list_object.add(todo) }
    not_done_list_object
  end

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


# Launch School's Implementation

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class != Todo
      raise TypeError.new("Can only add Todo objects")
    else
      @todos.push(todo)
    end
  end

  alias_method :<<, :add

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

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each { |todo_item| todo_item.done! }
  end

  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    list_output = "---- #{title} ----\n"
    @todos.each { |todo| list_output << todo.to_s + "\n" }
    list_output
  end

  def each
    counter = 0
    
    while counter < size
      yield(item_at(counter))
      counter += 1
    end
    
    self
  end

  # def select
  #   selected = []
    
  #   self.each do |todo|
  #     selected << todo if yield(todo)
  #   end
    
  #   selected
  # end

  def select    
    selected_list = TodoList.new("Selected List")
    
    each do |todo|
      selected_list.add(todo) if yield(todo)
    end
   
    # selected.each { |selected_todo| selected_list.add(selected_todo) }
    selected_list
  end

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

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

puts list.all_not_done
list.mark_all_done
puts list.all_not_done
puts list.all_done
list.mark_all_undone
puts list.all_not_done


