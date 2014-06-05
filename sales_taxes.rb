class Order
	@@order_num = 0
	def initialize
		@sales_tax = 0
		@to_return = {}
		@@order_num += 1
	end

	def add(str)
		str[/(.+) at (.+)/]
		item = $1
		cost = $2.to_f

		if item =~ /imported/ && item =~ /book|chocolate|pills/
			@to_return[item] = cost + import_tax(cost) 
		elsif item =~ /imported/ 
			@to_return[item] = cost + import_tax(cost) + sales_tax(cost)
		elsif item =~ /book|chocolate|pills/
			@to_return[item] = cost
		else
			@to_return[item] = cost + sales_tax(cost)
		end
	end


	def sales_tax(cost)
		@item_tax = cost * 0.1
		@sales_tax += @item_tax
		@item_tax
	end

	def import_tax(cost)
		@item_tax = cost * 0.05
		@sales_tax += @item_tax
		@item_tax
	end

	def output 
		@total = @to_return.values.inject(:+)
		puts "Order #{@@order_num}"
		@to_return.each do |key,value|
			puts "#{key}: #{value}"
		end 
		puts "Sales Taxes: #{@sales_tax}"
		puts "Total: #{@total}"
		puts ""
	end
end

order1 = Order.new
order1.add("1 book at 12.49")
order1.add("1 music CD at 14.99")
order1.add("1 chocolate bar at 0.85")
order1.output

order2 = Order.new
order2.add("1 imported box of chocolates at 10.00")
order2.add("1 imported bottle of perfume at 47.50")
order2.output

order3 = Order.new
order3.add("1 imported bottle of perfume at 27.99")
order3.add("1 bottle of perfume at 18.99")
order3.add("1 packet of headache pills at 9.75")
order3.add("1 box of imported chocolates at 11.25")
order3.output

