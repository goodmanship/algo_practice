# @param {Integer[]} digits
# @return {Integer[]}
# def plus_one(digits)
#   (digits.join("").to_i + 1).to_s.chars.map{|c| c.to_i}
# end

# puts plus_one([1,2,3])

def plus_one(digits)
  for i in (digits.length - 1).downto 0
    if digits[i] == 9
      digits[i] = 0
      if i == 0
        return digits.unshift 1
      end
    else
      digits[i] += 1
      return digits
    end
  end
end
puts plus_one([1,2,3])
