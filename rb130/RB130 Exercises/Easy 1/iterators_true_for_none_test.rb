# iterators_true_for_none_test.rb

require 'minitest/autorun'

require_relative 'iterators_true_for_none'

require 'minitest/reporters'
MiniTest::Reporters.use!

require 'simplecov'
SimpleCov.start

class TestTrueForNone < Minitest::Test
  def test_none
    assert_equal(false, none?([1, 3, 5, 6]) { |value| value.even? })
    assert_equal(true, none?([1, 3, 5, 7]) { |value| value.even? })
    assert_equal(true, none?([2, 4, 6, 8]) { |value| value.odd? })
    assert_equal(false, none?([1, 3, 5, 7]) { |value| value % 5 == 0 })
    assert_equal(false, none?([1, 3, 5, 7]) { |value| true })
    assert_equal(true, none?([1, 3, 5, 7]) { |value| false })
    assert_equal(true, none?([]) { |value| true })
  end
end
