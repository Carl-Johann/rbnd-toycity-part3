require_relative 'errors'
class Product 
	attr_reader :title, :price, :stock
	@@products = []
	
	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.in_stock
		@@products.select! {|product| product.stock >= 1}
	end

	def in_stock?
		if @stock == 0
			return false
		else
			return true
		end
	end

	def self.find_by_title(title)
		@@products.each do |product|
			if product.title == title
				return product
			end
		end
	end

	private

	def add_to_products
    @@products.each do |product|
        if product.title == @title
            raise DuplicateProductError, "'#{@title}' already exists'"
        else
            @@products << self
            break
        end
    end
    	if @@products == []
        	@@products << self
    	end
	end
end