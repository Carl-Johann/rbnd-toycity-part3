require_relative 'errors'
class Customer
	attr_reader :name
	@@customer_list = []
	
	def initialize(option={})
		@name = option[:name]
		add_to_customer_list
	end

	def self.all 
		@@customer_list
	end

	def purchase(product)		
		Transaction.new(self, product)
	end	

	def self.find_by_name(name)
		@@customer_list.each do |customer|
			if customer.name == name
				return customer
			end
		end
	end

	private

	def self.clear_list
		@@customer_list.clear
	end

	def add_to_customer_list
    @@customer_list.each do |customer|
        if customer.name == @name
            raise DuplicateCustomerError, "'#{@name}' already exists'"
        else
            @@customer_list << self
            break
        end
    end
    	if @@customer_list == []
        	@@customer_list << self
    	end
	end
end





