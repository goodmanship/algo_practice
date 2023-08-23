# @param {String} s
# @return {String}
def reorganize_string(s)
  char_stack = []
  new_s = ""
  for i in 0..s.length - 1
    c = s[i]
    if char_stack.length > 0 && char_stack.first != new_s[-1]
      puts "#{new_s} so pop from #{char_stack}"
      new_s += char_stack.shift
    elsif new_s[-1] && c == new_s[-1]
      char_stack << c
      i += 1
    else
      new_s += c
      i += 1
    end
  end
  new_s
end
puts reorganize_string("aab")