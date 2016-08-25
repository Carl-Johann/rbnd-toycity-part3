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

	private

	def add_to_customer_list
    @@customer_list.each do |customer|
        if customer.name == @name
            raise DuplicateProductError, "'#{@name}' already exists'"
        else
            @@customer_list << self
            break
        end
    end
    	if @@customer_list == []
        	@@customer_list << self
    	end
	end

	def self.find_by_name(name)
		@@customer_list.each do |customer|
			if customer.name == name
				return customer
			end
		end
	end
end





