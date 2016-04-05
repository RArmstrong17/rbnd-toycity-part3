class Customer
  attr_accessor :name
  @@customers = []
    def initialize(options = {})
      @name = options[:name]
      add_to_customer
    end

    def find_by_name(name)
      @@customers.find{|customer| customer.name == name}
    end

    def purchase(product)
      raise OutOfStockError, "#{product.title} is out of stock." if product.stock <= 0
      Transaction.new(self, product)
    end

  class << self
    def all # Returns array of customers names.
      return @@customers
    end

    def find_by_name(name) # Search for the customer via name.
      @@customers.find{|customer| customer.name == name}
    end
  end

  private
    def add_to_customer
      #Tests if there is alrady a customer that exists in array.
      raise DuplicateCustomerError, "#{@name} already exists." if self.find_by_name(@name)
      @@customers << self
    end
end
