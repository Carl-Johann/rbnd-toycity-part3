require_relative 'errors'
class Transaction
	attr_reader :id, :product, :customer
	@@id = 1
	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = @@id
    	product.change_stock(1)
    	add_to_transactions
    	@@id += 1
	end

	def self.find(id)
		@@transactions[id-1]
	end

	def self.clear_list
		@@transactions.clear
	end

	def id
		@id
	end

	def self.all
		@@transactions
	end

	private

	def add_to_transactions
   
    	if product.stock != 0
    		@@transactions << self
    	else
    		raise "OutOfStockError, "#{@product.title} is out of stock"
    	end
	end
end




