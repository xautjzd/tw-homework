require '../lib/input_extraction'

describe InputExtraction do

	context ".initialize" do
		it "extract original input to an Array" do
			input = InputExtraction.new("../input/input1.txt")
			expect(input.items.class).to eq Array
		end
	end

	context "#extract" do
		it "return a array with the hash item(name, quantity, price, exempt, import and sales_price)" do
			input  = InputExtraction.new("../input/input1.txt")

			items = [
				{ name: "book", quantity: 1, price: 12.49, exempt: true, import: false, sales_price: 0.0 },
				{ name: "music CD", quantity: 1, price: 14.99, exempt: false, import: false, sales_price: 0.0 },
				{ name: "chocolate bar", quantity: 1, price: 0.85, exempt: true, import: false, sales_price: 0.0 }
			]

			expect(input.extract).to eq items
		end
	end
end
