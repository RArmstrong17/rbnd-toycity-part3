class Product
  @@products = Array.new{Hash.new}
  attr_accessor :title, :price, :stock
    def initialize(title: title, price: price, stock: stock)
      @product_hash = Hash.new{}
      @product_hash[:title] = title
      @product_hash[:price] = price
      @product_hash[:stock] = stock
      add_to_products
    end

    def self.all
      return @@products
    end

    def self.find_by_title(title)
      @@products.each_with_index do |product, index|
        if product[:title] == title
          return @@products[index]
        end
      end
    end

  private
    def add_to_products
      titles = []
      if @@products.empty?
        @@products.push(@product_hash)
      else
        titles = @@products.map{|title| title[:title]}
          if titles.include?(@product_hash[:title])
            raise DuplicateProductError, "#{@product_hash[:title]} already exists."
          else
            @@products.push(@product_hash)
          end
      end
    end
end
