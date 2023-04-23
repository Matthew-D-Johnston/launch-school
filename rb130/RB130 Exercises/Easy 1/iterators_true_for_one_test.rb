# iterators_true_for_one_test.rb

require 'minitest/autorun'

require_relative 'iterators_true_for_one'

require 'minitest/reporters'
Minitest::Reporters.use!

require 'simplecov'
SimpleCov.start

class TestTrueForOne < MiniTest::Test
  def test_one
    assert_equal(true, one?([1, 3, 5, 6]) { |value| value.even? })
    assert_equal(false, one?([1, 3, 5, 7]) { |value| value.odd? })
    assert_equal(false, one?([2, 4, 6, 8]) { |value| value.even? })
    assert_equal(true, one?([1, 3, 5, 7]) { |value| value % 5 == 0 })
    assert_equal(false, one?([1, 3, 5, 7]) { |value| true })
    assert_equal(false, one?([1, 3, 5, 7]) { |value| false })
    assert_equal(false, one?([]) { |value| true })
  end
end