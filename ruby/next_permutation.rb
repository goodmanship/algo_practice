# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  return [] if nums.length == 0
  return nums if nums.length == 1
  
  pivot = nums.length
  for i in (nums.length - 1).downto(1)
    if nums[i - 1] < nums[i]
      pivot = i - 1
      break
    end
  end

  return nums.reverse if pivot == nums.length

  swap = nums.length - 1
  for i in (nums.length - 1).downto(0)
    if nums[i] > pivot
      swap = i
      break
    end
  end

  nums[pivot], nums[swap] = nums[swap], nums[pivot] # swap the pivot

  nums[pivot + 1..nums.length - 1] = nums[pivot + 1..nums.length - 1].reverse # reverse the end

  nums
end

# puts "#{next_permutation([1,2,3])}"
puts "#{next_permutation([3,2,1])}"
# puts "#{next_permutation([1,1,5])}"

# Input: nums = [1,2,3]
# Output: [1,3,2]