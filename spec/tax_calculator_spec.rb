require '../lib/tax_calculator'

describe TaxCalculator do
	subject do
		items = [{
			name: "music CD", 
			quantity: 1,
			price: 14.99,
			exempt: false, 
			import: false,
			total: 0.0 
		}]
		TaxCalculator.new(items)
	end

	context "#get_tax_rate" do
		it "return total tax rate of the specified good" do
			expect(subject.get_tax_rate(subject.items.first)).to be == 0.1
		end
	end

	context "#round_tax" do
		it "round up to nearest(0.05) of sales tax" do
			expect(subject.round_tax(1.499)).to be == 1.50
			expect(subject.round_tax(1.419)).to be == 1.45
		end
	end

	context "#calculate_tax" do
		it "get sales tax of the specified product" do
			expect(subject.calculate_tax(14.99, 1, 0.1)).to be == 1.5
			expect(subject.calculate_tax(47.5, 1, 0.15)).to be == 7.15
		end
	end
end
