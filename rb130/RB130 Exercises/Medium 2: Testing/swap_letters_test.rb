# swap_letters_test.rb

require 'minitest/autorun'
require_relative 'swap_letters'

require 'minitest/reporters'
MiniTest::Reporters.use!

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
    @file_data = @file.read
  end

  def test_swap
    sample_text = Text.new(@file_data)
    
    a_indexes = []
    e_indexes = []

    sample_text.text.chars.each_with_index do |char, idx|
      a_indexes << idx if char == 'a'
      e_indexes << idx if char == 'e'
    end

    ae_indexes = a_indexes.concat(e_indexes).sort
    swapped_letters = sample_text.swap('a', 'e')

    a_indexes = []
    e_indexes = []

    swapped_letters.chars.each_with_index do |char, idx|
      a_indexes << idx if char == 'a'
      e_indexes << idx if char == 'e'
    end

    assert_equal([], a_indexes)
    assert_equal(ae_indexes, e_indexes)
  end

  def test_word_count
    expected_word_count = @file_data.split.size
    sample_text = Text.new(@file_data)
    actual_word_count = sample_text.word_count

    assert_equal(expected_word_count, actual_word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end