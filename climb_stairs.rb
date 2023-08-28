# @param {Integer} n
# @return {Integer}
# def climb_stairs(n)
#   return 2 if n == 2
#   return 1 if n == 1
#   return 0 if n == 0
#   climb_stairs(n - 2) + climb_stairs(n - 1)
# end

def climb_stairs(n)
  return 2 if n == 2
  return 1 if n == 1
  return 0 if n == 0
  count = 2
  last = 1
  current = 2
  temp = current
  while count < n do
    temp = last + current
    last = current
    current = temp
    count += 1
  end
  current
end

puts climb_stairs(2)
puts "should be 2"

puts climb_stairs(3)
puts "should be 3"

puts climb_stairs(6)
puts "shoudl be 13"

puts climb_stairs(38)
puts "should be 63245986"

# o o o
# oo o
# o oo

# n=4
# o + n=3
# oo + n=2

