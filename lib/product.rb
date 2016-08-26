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

	def print_short_product_report
		puts @title
		puts "Price: $#{@price}"
		puts "Stock: #{@stock}"
	end

	def self.report
  		@@products.each do |product|
  			puts product.print_short_product_report
  		end
  	end

	def self.clear_list
		@@products.clear
	end

	def self.all
		@@products
	end

	def change_stock(transactions)
		@stock -= transactions
	end

	def self.in_stock
		@@products.select! {|product| product.stock >= 1}
	end

	def self.find_and_delete_by_title(title)
		@@products.select! {|product| product.title != title}
	end
	
	def in_stock?
    	@stock > 0
	end

	def self.find_by_title(title)
		@@products.find {|product| product.title == title}
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