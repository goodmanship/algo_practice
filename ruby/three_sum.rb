# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    sums = []
    seen_it = {}
    nums.each_with_index do |k, j|
        next if seen_it[k]
        seen_it[k] = true

        h_nums = {}
        for i in j+1..nums.length-1
            n = nums[i]
            if !h_nums[n].nil?
                sums.push( [k, nums[h_nums[n]], n].sort )
            else
                h_nums[-k-n] = i
            end
        end
    end
    sums.uniq
end

puts "#{three_sum([-1,0,1,2,-1,-4])}"