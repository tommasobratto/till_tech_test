class Till

  attr_reader :line_total_price, :line_quantity
  attr_accessor :orders

  def initialize
    @orders = []
    @line_total_price = {}
    @line_quantity = {}
  end

  def take_order product
    product_quantity = 0
    product_total_price = 0
    orders << product

    orders.each do |element|
      if element == product
        product_total_price += product.price
        product_quantity += 1
        line_total_price[product] = product_total_price
        line_quantity[product] = product_quantity
      end
    end
  end

  def total
    total = line_total_price.values.reduce { |result, element| result + element }
  end

  def receipt
    receipt = []

    line_total_price.each do |product, price|
      line = line_quantity[product].to_s + " x " + product.name.to_s + ": " + price.to_s + "£ \n"
      receipt << line
    end

    products = receipt.map { |line| "#{line}" }.join(' ')

    return products + " " + "total: " + total.to_s + "£"
  end

end
