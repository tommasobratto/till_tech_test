class Receipt

  attr_accessor :order_line, :order_quantity

  def initialize
    @order_quantity = {}
    @order_line = {}
  end

  def get_product_line till
    till.line_price.each do |order, price|
      order_line[order] = price
    end
  end

  def get_product_quantity till

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

end
