# def search_insert(nums, target)
#   tail = nums.length - 1
#   head = 0

#   while tail - head > 1
#     if target > nums[(tail + head)/2]
#       puts "target greater than #{(nums[tail] + nums[head])/2}"
#       puts "moving head to #{(tail + head)/2}"
#       head = (tail + head)/2
#     else
#       puts "target less than #{(nums[tail] + nums[head])/2}"
#       puts "moving tail to #{(tail + head)/2}"
#       tail = (tail + head)/2
#     end
#   end

#   (tail + head)/2
# end

# def search_insert(nums, target)
#   i = nums.length/2
#   least = 0
#   most = nums.length - 1
#   return most + 1 if target > nums[most]
#   return least if target < nums[least]

#   while i - least > 0 && most - i > 0
#     puts "i: #{i}, least: #{least}, most: #{most}"

#     if target > nums[i]
#       least = i + 1
#     elsif target < nums[i]
#       most = i
#     else
#       return i
#     end
#     i = (most + least) / 2
#   end

#   i
# end

def search_insert(nums, target)
  for i in 0..nums.length
    return i if nums[i] >= target
  end
  return nums.length
end

puts search_insert([1,3,5,6], 2)