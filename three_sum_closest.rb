# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  min_dist = target - nums.first(3).sum # benchmark is the first 3
  nums.each_with_index do |n, i|
    left = 0
    right = nums.length - 1
    while left < right do
      if left == i
        left += 1
        next
      end
      if right == i
        right -= 1
        next
      end

      current = n + nums[left] + nums[right]
      dist = target - current
      min_dist = dist if dist.abs < min_dist.abs

      if current < target
        left += 1
      elsif current > target
        right -= 1
      else
        return target
      end
    end
  end
  return target - min_dist
end
