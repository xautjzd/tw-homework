require './lib/input_extraction'
require './lib/tax_calculator'
require './lib/print_result'

class PrintTax

	def initialize(filename)
		@filename = filename
	end

	def execute
		input = InputExtraction.new(@filename)
		items = input.extract

		calculator = TaxCalculator.new(items)
		total_tax, total_price = calculator.calculate(items)

		result = PrintResult.new(items, total_tax, total_price)
		result.show
	end
end

filename = ARGV[0]
unless filename.nil?
	result = PrintTax.new(filename)
	result.execute
else
	p "The script format is: $ scriptname inputfile. Please give an input file"
end
