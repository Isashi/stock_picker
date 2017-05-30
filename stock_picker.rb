def pick(stocks)
	max_gain = gain = buy_day = sell_day = buyvalue = sellvalue = 0
	puts "  day      price"
	stocks.each_with_index do |value, index|
		puts "  " + (index+1).to_s + " "*(5-(index+1).to_s.length) + "|   " + value.to_s
		stocks[index..-1].each_with_index do |value2, index2|
			gain=value2-value
			if gain > max_gain then
				max_gain = gain
				buy_day = index
				sell_day = index2+index
				buyvalue = value
				sellvalue = value2
			end
		end
	end
	puts ""
	puts " " + max_gain.to_s + "€ is the max gain possible."
	puts " You should buy in the day " + (buy_day+1).to_s + " (at the price of " + buyvalue.to_s + "€) and sell in the day " + (sell_day+1).to_s + " (at the price of " + sellvalue.to_s + "€)."
end

def create
	stock = Array.new
	puts "How many days for your stock?"
	days = gets.chomp.to_i
	days.times do |day|
		puts "What is the price stock for day #" + (day+1).to_s + "?"
		stock << gets.chomp.to_i
	end
	pick(stock)
end

def generate
	pick(Array.new(Random.rand(15...30)) { Random.rand(1...100) } )
end

puts ""
puts "  ____  _             _      ____  _      _                   
 / ___|| |_ ___   ___| | __ |  _ \\(_) ___| | _____ _ __       
 \\___ \\| __/ _ \\ / __| |/ / | |_) | |/ __| |/ / _ | '__|      
  ___) | || (_) | (__|   <  |  __/| | (__|   |  __| |         
 |____/ \\__\\___/ \\___|_|\\_\\ |_|   |_|\\___|_|\\_\\___|_|         
                                                              "
puts ""
puts 'The "Stock Picker" takes in an array of stock prices, one for each hypothetical day and it returns a pair of days representing the best day to buy and the best day to sell.'
puts "Options:"
puts "1) Create a manual stocks"
puts "2) Generate a random stocks"
puts
puts "Choose an option:"
choice = gets.chomp.downcase

case choice
	when "1","1)","create" then create
	when "2","2)","generate" then generate
	else puts "Choice not accepted"
end