class Product
  attr_accessor :title, :price, :stock
  @@products = Array.new
    def initialize(options = {})
      @title = options[:title]
      @price = options[:price]
      @stock = options[:stock]
      add_to_products(options)
    end

    def self.all
      return @@products # Return the Array of initialized products.
    end

    def self.find_by_title(title)
      @@products.find{|product| product[:title] == title} # Finds the product via title.
    end

    def self.in_stock
      @@products.select!{|product| product[:stock] > 0} # Selects the
    end

  private
    def add_to_products(options = {}) # Pass intital arguments through a private method.
      titles = []
      if @@products.empty? # Always push first product entered.
        @@products.push(options)
      else
        titles = @@products.map{|title| title[:title]}
          if titles.include?(options[:title]) # Check to see if product was already entered by matching its title.
            raise DuplicateProductError, "#{options[:title]} already exists."
          else
            @@products.push(options)
          end
      end
    end
end

class Object # Methods for products objects. 
  def title
      return self[:title]
  end

  def price
    return self[:price]
  end

  def stock
    return self[:stock]
  end

  def in_stock?
    if self[:stock] == 0
      return false
    else
      true
    end
  end

end
