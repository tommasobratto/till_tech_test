class Till

  attr_accessor :orders, :quantity, :line_price

  def initialize
    @orders = []
    @quantity = Hash.new(0)
    @line_price = {}
  end

  def take_order product
    orders << product.name
  end

  def calculate_quantity
    orders.each do |product|
      quantity[product] += 1
    end
  end

  def calculate_line_price product
    line_price[product.name] = quantity[product.name] * product.price
  end

  def calculate_total_price
    total = line_price.values.reduce { |result, price| price + result }
  end

end
