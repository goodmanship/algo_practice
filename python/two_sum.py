# https://leetcode.com/problems/two-sum/description/
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        memo = {}
        for i, n in enumerate(nums):
            if n in memo:
                return memo[n], i
            else:
                memo[target - n] = i
        raise "No solution found"