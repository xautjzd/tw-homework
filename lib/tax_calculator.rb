class TaxCalculator
	attr_accessor :total_tax, :total_price, :items

	def initialize(items)
		@items = items

		@total_tax = 0.0      
		@total_price = 0.0

		@goods_tax_rate = 0.10
		@imported_tax_rate = 0.05
	end

	# Calculate sales price of each product, sum the total sales tax and total needed to paied
	def calculate(items)

		items.each do |item|
			tax_rate = get_tax_rate(item)
			tax = get_tax(item[:price], item[:quantity], tax_rate)
			@total_tax += tax

			item[:sales_price] = (item[:price] * item[:quantity] + tax).round(2)
			@total_price += item[:sales_price]
		end

		return @total_tax, @total_price
	end

	# Get total tax rate of the specified product
	def get_tax_rate(item)
		tax_rate = 0.0
		tax_rate = @goods_tax_rate unless item[:exempt]
		tax_rate = tax_rate + @imported_tax_rate if item[:import]
		return tax_rate
	end

	# Get total tax of the specified product
	def get_tax(price, quantity, tax_rate)
		tax = (price * quantity) * tax_rate
		round_tax(tax)
	end

	# Round up to the nearest(0.05) of sales tax 
	def round_tax(tax)
		(tax * 20.0).ceil / 20.0
	end
end

