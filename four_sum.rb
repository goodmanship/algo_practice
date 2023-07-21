def four_sum(nums, target)
  quads = []
  seen_it = {}
  for i in 0..nums.length - 1
    next if seen_it[nums[i]]
    seen_it[nums[i]] = true

    for j in i + 1..nums.length - 1
      # TODO: could also make a seen_it hash for this loop
      h_nums = {}
      for k in j + 1..nums.length - 1
        n = nums[k]
        if !h_nums[n].nil?
          quads << [nums[i], nums[j], nums[k], nums[h_nums[n]]].sort
        else
          h_nums[target - (nums[i] + nums[j] + n)] = k
        end
      end
    end
  end
  quads.uniq
end

puts "#{four_sum([1,0,-1,0,-2,2], 0)}"
# correct

# puts "#{four_sum([2,2,2,2], 8)}"
# correct

# puts "#{four_sum([-479,-472,-469,-461,-456,-420,-412,-403,-391,-377,-362,-361,-340,-336,-336,-323,-315,-301,-288,-272,-271,-246,-244,-227,-226,-225,-210,-194,-190,-187,-183,-176,-167,-143,-140,-123,-120,-74,-60,-40,-39,-37,-34,-33,-29,-26,-23,-18,-17,-11,-9,6,8,20,29,35,45,48,58,65,122,124,127,129,145,164,182,198,199,206,207,217,218,226,267,274,278,278,309,322,323,327,350,361,372,376,387,391,434,449,457,465,488], 1979)}"
# time limit

# puts "#{four_sum([2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2], 8)}"
# time limit