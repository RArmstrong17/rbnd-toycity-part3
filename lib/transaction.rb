class Transaction
  attr_accessor :product, :customer
  @@transactions = Array.new
    def initialize(customer, product)#Takes two classes and associates the customers name as key to the product they buy.
      @customer = customer
      @product = product
      @product.time = Time.new
      remove_stock
      add_to_transaction
    end

    def self.all #Array of all trasactions.
      return @@transactions
    end

    def id # Each transactions has own ID, which is there index in the array plus one.
      index = @@transactions.index(self)
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

    def self.report
      puts "Transaction Report".center(65)
      puts "Name".ljust(20) + "Time of Purchase".center(25) +"Product".rjust(40)
      86.times {|i| print "-"}
      puts "\n"
      @@transactions.each do |transaction|
        puts "#{transaction.customer.name.ljust(20)} #{transaction.product.time} #{transaction.product.title.rjust(40)}"
      end
    end

  private
    def add_to_transaction
      @@transactions << self
    end

    def remove_stock #When a transaction is added, remove stock of the product bought.
      @product.stock -= 1
    end
end
