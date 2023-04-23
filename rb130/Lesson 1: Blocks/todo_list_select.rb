# todo_list_select.rb

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

# Examples with `Todo` class:

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

# puts todo1
# puts todo2
# puts todo3

# puts "--------"

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
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo
end

todo1.done!
list.each do |todo|
  puts todo
end
results = list.select { |todo| todo.done? }

puts results.inspect
