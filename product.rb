require_relative './menu.rb'

class Product

  attr_reader :menu, :price
  attr_accessor :name

  def initialize product_name
    load_files
    @price = menu[product_name]
    @name = menu.key(price)
  end

end
