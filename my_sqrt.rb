# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return 0 if x < 0
  i = 0
  while i * i <= x
    i += 1
  end
  i - 1
end

puts "#{my_sqrt(9)} should be 3"
puts "#{my_sqrt(8)} should be 2"
puts "#{my_sqrt(4)} should be 2"