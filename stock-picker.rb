def get_input ()
  puts "This program calculates for the maximum profit or the minimum loss when selling a stock."
  puts ""
  puts "Input the amount of days to track maximum profit or track minimum loss."
  days = gets.chomp.to_i
  price_per_day = []

  puts "Input the price($) per day, press enter every price input."
  days.times do 
    price_per_day.push(gets.chomp.to_i)
  end

  puts "Here are the stock prices you input in the span of #{days} days: #{price_per_day}"
  stock_picker(price_per_day)
end

def stock_picker(days_array)
  reverse_days_array = days_array.reverse
  price_pairs_array = reverse_days_array.combination(2).to_a
  profit_per_price_pair = price_pairs_array.map {|price_pair| price_pair[0] - price_pair[1]}
  i = profit_per_price_pair.find_index(profit_per_price_pair.max)
  
  if (profit_per_price_pair.max.negative?)
    puts "A loss of $#{price_pairs_array[i][0]} - $#{price_pairs_array[i][1]} == -$#{profit_per_price_pair.max.abs}"
  else
    puts "A profit of $#{price_pairs_array[i][0]} - $#{price_pairs_array[i][1]} == $#{profit_per_price_pair.max}" 
  end
end

get_input()