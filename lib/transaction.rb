class Transaction
	attr_reader :id, :product, :customer
	@@id = 1
	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = @@id
    	@@id += 1
    	product.change_stock(1)
    	@@transactions << self
	end

	def self.find(id)
		@@transactions[id-1]
	end

	def id
		@id
	end

	def self.all
		@@transactions
	end
end




