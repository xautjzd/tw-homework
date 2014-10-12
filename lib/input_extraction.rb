class InputExtraction
	attr_reader :input_items, :items

	# filename: input filename
	def initialize(filename)
		# Get input file content to an Array
		@input_items = File.open(File.dirname(File.dirname(__FILE__)) + '/input/' + filename).to_a

		# Get exempt goods
		filepath = File.dirname(File.dirname(__FILE__)) + '/lib/exempt_goods.txt'
		@exempt_goods = File.open(filepath).to_a.map! {|item| item.chomp }
		@items = []
	end

	# Extract the useful infos from original input to @items
	def extract
		@input_items.each do |item|
			item = item.strip.split(' ')

			name = get_name item
			quantity = get_quantity item
			price = get_price item
			exempt = is_exempt_product? item
			import = is_import? item

			item = {
				name: name,
				quantity: quantity,
				price: price,
				exempt: exempt,
				import: import,
				sales_price: 0.0
			}

			@items << item
		end

		return @items
	end

	# Get product name
	def get_name(item)
		end_point = (item.index "at") - 1
		name = item[1..end_point].join(" ")
		return name
	end

	# Get product quantity
	def get_quantity(item)
		item.first.to_i
	end

	def get_price(item)
		item.last.to_f
	end

	# Detect the specified product whether exempt or not
	def is_exempt_product?(item)
		intersection = item & @exempt_goods
		intersection = intersection.join(" ")
		return intersection != "" ? true : false
	end

	# Detect the specified product where imported or not
	def is_import?(item)
		if item.include? "imported"
			return true
		else
			return false
		end
	end
end
