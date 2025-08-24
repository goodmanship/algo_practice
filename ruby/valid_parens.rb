# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  closer = {
    ")" => "(",
    "]" => "[",
    "}" => "{"
  }
  s.each_char do |c|
    if c == "(" || c == "[" || c == "{"
      stack.push c
    else
      return false if stack.length == 0 || stack.pop != closer[c]
    end
  end
  return stack.length == 0
end

# Input: s = "()"
# Output: true
puts is_valid("()")