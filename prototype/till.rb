class Till

  attr_reader :line_total_price
  attr_accessor :orders

  def initialize
    @orders = []
    @line_total_price = {}
  end

  def take_order brew
    brew_total_price = 0
    orders << brew

    orders.each do |product|
      if product == brew
        brew_total_price += brew.price
        line_total_price[brew] = brew_total_price
      end
    end
  end

  def total
    total = line_total_price.values.reduce { |result, element| result + element }
  end

  def receipt
    receipt = []
    line_total_price.each do |product, price|
      line = product.name.to_s + ": " + price.to_s + "£ \n"
      receipt << line
    end
    products = receipt.map { |product| "#{product}" }.join(' ')
    return products + " " + total.to_s + "£"
  end

end
