# todolist_test.rb

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todos[1..2], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
    @todos.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  def test_raise_type_error_when_adding_non_todo
    assert_raises(TypeError) do 
      @list << ['', 1, 3.4, [], {}, :ed].sample
    end
  end

  def test_shovel_method_adds_todo
    todo = Todo.new("Bake bread")
    @list << todo
    assert_equal(todo, @list.last)
  end

  def test_add
    todo = Todo.new("Mow the lawn")
    @list.add(todo)
    assert_equal(todo, @list.last)
  end

  def test_item_at
    idx = [0, 1, 2].sample
    bad_idx = @todos.size

    assert_equal(@todos[idx], @list.item_at(idx))
    assert_raises(IndexError) do
      @list.item_at(bad_idx)
    end
  end

  def test_mark_done_at
    idx = [0, 1, 2].sample
    bad_idx = @todos.size
    @list.mark_done_at(idx)

    assert_equal(true, @list.item_at(idx).done?)
    assert_raises(IndexError) { @list.mark_done_at(bad_idx) }
  end

  def test_mark_undone_at
    @todos.each { |todo| todo.done! }
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_raises(IndexError) { @list.mark_undone_at(3) }
  end

  def test_make_all_todos_done
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    idx = [0, 1, 2].sample
    bad_idx = @todos.size
    removed = @todos[idx]
    @list.remove_at(idx)

    assert_equal(false, @list.to_a.include?(removed))
    assert_raises(IndexError) { @list.remove_at(bad_idx) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_done_todo
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_when_all_todos_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    result_array = []
    @list.each { |todo| result_array << todo }

    assert_equal(@todos, result_array)
  end

  def test_each_return_value
    return_value = @list.each { |todo| nil }

    assert_equal(@list, return_value)
  end

  def test_select
    new_list = TodoList.new("Today's Todos")
    new_list.add(@todo1)
    new_list.add(@todo3)
    new_list.done!

    @list.mark_done_at(0)
    @list.mark_done_at(2)
    result_list = @list.select { |todo| todo.done? }

    assert_instance_of(TodoList, result_list)
    assert_equal(new_list.to_a, result_list.to_a)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
    assert_equal(@todo2, @list.find_by_title("Clean room"))
    assert_equal(@todo3, @list.find_by_title("Go to gym"))
    assert_equal(nil, @list.find_by_title("Bake bread"))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
    @todo1.done!
    @todo3.done!
    assert_equal([@todo1, @todo3], @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
    @todo1.done!
    assert_equal([@todo2, @todo3], @list.all_not_done.to_a)
  end

  def test_mark_done
    assert_equal(false, @todo1.done?)
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
  end

  def test_mark_all_done
    assert_equal(false, [@todo1, @todo2, @todo3].all? { |todo| todo.done? })
    @list.mark_all_done
    assert_equal(true, [@todo1, @todo2, @todo3].all? { |todo| todo.done? })
  end

  def test_mark_all_undone
    [@todo1, @todo2, @todo3].each { |todo| todo.done! }
    assert_equal(true, [@todo1, @todo2, @todo3].all? { |todo| todo.done? })
    @list.mark_all_undone
    assert_equal(true, [@todo1, @todo2, @todo3].all? { |todo| !todo.done? })
  end
end
