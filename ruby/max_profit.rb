# @param {Integer[]} prices
# @return {Integer}
# def max_profit(prices)
#   max_profit = 0
#   prices.each_with_index do |p, i|
#     for j in i..prices.length - 1 do
#       temp_price = prices[j] - p
#       max_profit = temp_price if temp_price > max_profit
#     end
#   end
#   max_profit
# end

def max_profit(prices)
  high = 0
  low = 0
  max_profit = 0

  prices.each_with_index do |p, i|
    if prices[i] > prices[high]
      high = i
      profit = prices[high] - prices[low]
      max_profit = profit if profit > max_profit
    elsif prices[i] < prices[low]
      low = i
      high = i
    end
  end

  max_profit
end

# time limit exceeded

# puts max_profit([7,1,5,3,6,4])
#  5

puts max_profit([3,2,6,5,0,3])