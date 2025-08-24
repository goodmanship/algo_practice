# /*

# Given a black box Aligner that takes text & audio as an input and outputs some representation of words and their start times and end times
# - The Aligner is slow, so we only want to call it once
# - You decide how you want the output to be structured

# Goal:
# Design a data structure for the output of the Aligner that allows you to implement the following function:

# // Computes the time offset for a specified text character position
# getTimeOffsetForCharOffset(charOffset: Int) -> Float

# */

class Timeline
  attr_accessor :char_time_offset

  def initialize(char_time_offset)
    @char_time_offset = char_time_offset
  end

  def get_time_offset_for_char_offset(char_offset)
    @char_time_offset[char_offset]
  end

  def get_char_offset_for_time_offset(time_offset)
    times = @char_time_offset.values
    for i in 0..times.length-1
      return i if times[i] >= time_offset
    end
    return times.length - 1
  end
end

require 'test/unit'
class MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def return_a_time
    c = {
      0 => 0,
      1 => 1
    }
    t = Timeline.new(c)
    assert_equal 0, t.get_time_offset_for_char_offset(0)
  end
end

c = {
  0 => 0.0,
  1 => 1.0
}
t = Timeline.new(c)
puts t.get_time_offset_for_char_offset(0)
puts t.get_char_offset_for_time_offset(1.0)
puts "should be 0 #{t.get_char_offset_for_time_offset(0.4)}"
puts "should be 1 #{t.get_char_offset_for_time_offset(0.6)}"
