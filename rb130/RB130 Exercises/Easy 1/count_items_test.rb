# count_items_test.rb

require 'minitest/autorun'

require_relative 'count_items'

require 'minitest/reporters'
MiniTest::Reporters.use!

require 'simplecov'
SimpleCov.start

class TestCountItems < Minitest::Test
  def test_count
    assert(3, count([1,2,3,4,5]) { |value| value.odd? })
    assert(2, count([1,2,3,4,5]) { |value| value % 3 == 1 })
    assert(5, count([1,2,3,4,5]) { |value| true })
    assert(0, count([1,2,3,4,5]) { |value| false })
    assert(0, count([]) { |value| value.even? })
    assert(2, count(%w(Four score and seven)) { |value| value.size == 5 })
  end
end
