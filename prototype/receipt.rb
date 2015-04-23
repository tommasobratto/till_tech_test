class Receipt

  attr_accessor :order_line, :order_quantity

  def initialize
    @order_quantity = {}
    @order_line = {}
  end

  def display_product till
    till.line_price.each do |order, price|
      order_line[order] = price
      return order_line.key(price)
    end
  end

end
