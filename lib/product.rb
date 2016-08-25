require_relative 'errors'
class Product 
	attr_reader :title

	@@products = []
	
	def initialize(options={})
		@title = options[:title]
		add_to_products
	end

	def self.all
		@@products
	end

	private

	def add_to_products
    @@products.each do |item|
        if item.title == @title
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