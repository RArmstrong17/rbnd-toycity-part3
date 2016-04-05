class Product
  attr_accessor :title, :price, :stock, :time
  @@products = Array.new
    def initialize(options = {})
      @title = options[:title]
      @price = options[:price]
      @stock = options[:stock]
      add_to_products
    end

    def find_by_title(title)
      @@products.find{|product| product.title == title} # Finds the product via title.
    end

    def in_stock?
      @stock > 0 # Selects the products with toys available.
    end

  class << self
    def all
      return @@products # Return the Array of initialized products.
    end

    def find_by_title(title)
      @@products.find{|product| product.title == title} # Finds the product via title.
    end

    def in_stock
      @@products.select {|product| product.stock > 0}
    end
  end


  private
    def add_to_products
    # Check to see if product was already entered by matching its title.
      raise DuplicateProductError, "#{@title} already exists." if self.find_by_title(@title)
      @@products << self
    end
end
