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

  def display_product order
    return order_line.key(order_line[order])
  end

  def display_product_price order
    return order_line[order]
  end

  def display_product_quantity order
    return order_quantity[order]
  end

  def show_total
    return @total_price
  end

  def display_receipt
    receipt_paper = []

    order_line.each do |order, price|
      receipt_content = display_product_quantity(order).to_s + " x " + display_product(order) + ": " + display_product_price(order).to_s + "£ \n"
      receipt_paper << receipt_content
    end

    printed_receipt = receipt_paper.map { |line| "#{line}" }.join(' ')

    return printed_receipt + " amount total: " + show_total.to_s + '£'
  end

end
