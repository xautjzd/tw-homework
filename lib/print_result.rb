class PrintResult

	def initialize(items, total_tax, total_price)
		@items = items
		@total_tax = total_tax
		@total_price = total_price
	end

	def show
		puts "Output: "
		
		@items.each do |item|
			item[:sales_price] =format(item[:sales_price])
			puts "#{item[:quantity]} #{item[:name]}: #{item[:sales_price]}"
		end

		@total_tax = format(@total_tax)
		puts "Sales Taxes: #{@total_tax}"

		@total_price = format(@total_price)
		puts "Total: #{@total_price}"
	end

	# Format the given product
	def format(item)
		item = "%.2f" % item
		return item
	end
end
