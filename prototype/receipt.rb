class Receipt

  attr_accessor :order_line, :order_quantity, :total_price

  def initialize
    @order_quantity = {}
    @order_line = {}
    @total_price = 0
  end

  def get_product_line till
    till.line_price.each do |order, price|
      order_line[order] = price
    end
  end

  def get_product_quantity till
    till.quantity.each do |order, quantity|
      order_quantity[order] = quantity
    end
  end

  def get_total_price till
    @total_price = till.total_price
  end

  def display_product
    order_line.each do |order, price|
      return order_line.key(order_line[order])
    end
  end

  def display_product_price
    order_line.each do |order, price|
      return order_line[order]
    end
  end

  def display_product_quantity
    order_quantity.each do |order, quantity|
      return order_quantity[order]
    end
  end

  def show_total
    return @total_price
  end

end
