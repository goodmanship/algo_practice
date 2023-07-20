# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  letter_map = {
    "2" => ["a", "b", "c"],
    "3" => ["d", "e", "f"],
    "4" => ["g", "h", "i"],
    "5" => ["j", "k", "l"],
    "6" => ["m", "n", "o"],
    "7" => ["p", "q", "r", "s"],
    "8" => ["t", "u", "v"],
    "9" => ["w", "x", "y", "z"]
  }

  return [] if digits.length == 0
  return letter_map[digits[0]] if digits.length == 1

  letter_map[digits[0]].map do |x|
    letter_combinations(digits[1..-1]).map { |y| x + y }
  end.flatten
end

puts "#{letter_combinations("2")}"
# should output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

# Example 1:

# Input: digits = "23"
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

# Example 2:

# Input: digits = ""
# Output: []

# Example 3:

# Input: digits = "2"
# Output: ["a","b","c"]