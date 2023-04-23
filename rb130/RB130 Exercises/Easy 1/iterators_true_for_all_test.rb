# iterators_true_for_all_test.rb

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'iterators_true_for_all'

require 'simplecov'
SimpleCov.start

class TrueForAllTest < MiniTest::Test
  def test_all
    assert_equal(false, all?([1, 3, 5, 6]) { |value| value.odd? })
    assert_equal(true, all?([1, 3, 5, 7]) { |value| value.odd? })
    assert_equal(true, all?([2, 4, 6, 8]) { |value| value.even? })
    assert_equal(false, all?([1, 3, 5, 7]) { |value| value % 5 == 0 })
    assert_equal(true, all?([1, 3, 5, 7]) { |value| true })
    assert_equal(false, all?([1, 3, 5, 7]) { |value| false })
    assert_equal(true, all?([]) { |value| false })
  end
end
