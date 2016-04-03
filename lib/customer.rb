class Customer
  attr_accessor :name
  @@customers = Array.new
    def initialize(options = {})
      @name = options[:name]
      add_to_customer(options)
    end

    def self.all
      return @@customers
    end

    def self.find_by_name(name)
      @@customers.find{|customer| customer[:name] == name}
    end

  private
    def add_to_customer(options = {})
      names = []
      if @@customers.empty?
        @@customers.push(options)
      else
        names = @@customers.map{|name| name[:name]}
          if names.include?(options[:name])
            raise DuplicateCustomerError, "#{options[:name]} already exists."
          else
            @@customers.push(options)
          end
      end
    end
end

class Object
  def name
    return self[:name]
  end

  def purchase(product)
    if product[:stock] > 0
      Transaction.new(self, product)
    else
      raise OutOfStockError, "#{product[:title]} is out of stock."
    end
  end

end
