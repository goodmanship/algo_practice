# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  l = nums.length
  nums.delete(val)
  l - nums.length
end
# should work, but fails

def remove_element(nums, val)
  l = nums.length
  nums.reject!{ |x| x == val }
  puts "#{nums}"
  l - nums.length
end


puts remove_element([0,1,2,2,3,0,4,2], 2)