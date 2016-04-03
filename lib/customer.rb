class Customer
  attr_accessor :name
  @@customers = Array.new
    def initialize(options = {})
      @name = options[:name]
      add_to_customer(options)
    end

    def self.all # Returns array of customers names.
      return @@customers
    end

    def self.find_by_name(name) # Search for the customer via name.
      @@customers.find{|customer| customer[:name] == name}
    end

  private
    def add_to_customer(options = {})
      names = []
      if @@customers.empty?
        @@customers.push(options)
      else
        names = @@customers.map{|name| name[:name]}
          if names.include?(options[:name])  #Tests if there is alrady a customer that exists in array.
            raise DuplicateCustomerError, "#{options[:name]} already exists."
          else
            @@customers.push(options)
          end
      end
    end
end

class Object #Creates method for customers to return their name.
  def name
    return self[:name]
  end

  def purchase(product)#Creates a method that allows a customer to purchase a product by creating a new transaction.
    if product[:stock] > 0
      Transaction.new(self, product)
    else #If the product is out of stock raise error. 
      raise OutOfStockError, "#{product[:title]} is out of stock."
    end
  end

end
