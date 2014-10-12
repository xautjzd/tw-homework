require '../lib/print_result'

describe PrintResult do
	it "print the item line by line" do
		items = [ 
			{ name: "imported bottle of chocolates", quantity: 1, price: 10.00, exempt: true, import: true, sales_price: 10.50 },
			{ name: "imported bottle of perfume", quantity: 1, price: 47.50, exempt: false, import: true, sales_price: 54.65 }
		]
		total_tax = 7.65
		sales_price = 65.15

		output = PrintResult.new(items, total_tax, sales_price)
		output.show
	end
end
