class Transaction
  attr_accessor :name
  @@transactions = Array.new
    def initialize(customer, product)#Takes two classes and associates the customers name as key to the product they buy.
      @transactions_hash = {}
      @customer = customer
      @product = product
      @transactions_hash[@customer] = @product
      add_to_transaction(@transactions_hash)
      remove_stock(@product)
    end

    def self.all #Array of all trasactions.
      return @@transactions
    end

    def id # Each transactions has own ID, which is there index in the array plus one.
      index = @@transactions.index(@transactions_hash)
      return index + 1
    end

    def self.find(id) #Finds the transaction based off of the ID.
      @@transactions[id - 1]
    end

    def product
      @product
    end

    def customer
      @customer
    end

  private
    def add_to_transaction(options = {})
      @@transactions.push(options)
    end

    def remove_stock(product) #When a transaction is added, remove stock of the product bought.
      product[:stock] -= 1
    end
end

class Object
  def product
    self.each do |name, product|
      return self[name]
    end
  end
end
