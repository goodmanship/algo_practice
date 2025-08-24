# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  last_letter = s.length
  for i in (s.length - 1).downto(0)
    if last_letter == s.length
      last_letter = i if s[i] != ' '
    elsif s[i] == ' '
      return last_letter - i
    end
  end

  # we got all the way through the string
  if last_letter == s.length
    return 0
  else
    return last_letter + 1 # for zero index
  end
end

require 'test/unit'
class MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def test_1
    s = "Hello World"
    assert_equal 5, length_of_last_word(s)
    # Output: 5
    # Explanation: The last word is "World" with length 5.
  end
  def test_2
    s = "   fly me   to   the moon  "
    assert_equal 4, length_of_last_word(s)
    # Output: 4
    # Explanation: The last word is "moon" with length 4.
  end
  def test_3
    s = "luffy is still joyboy"
    assert_equal 6, length_of_last_word(s)
    # Output: 6
    # Explanation: The last word is "joyboy" with length 6.
  end
  def test_3
    s = "a"
    assert_equal 1, length_of_last_word(s)
  end
end
