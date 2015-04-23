class Till

  attr_accessor :orders, :quantity, :line_price, :total_price, :tax, :taxed_total, :cash_accepted, :change
  attr_reader :tax_percent

  def initialize
    @orders = []
    @quantity = Hash.new(0)
    @line_price = {}
    @tax_percent = 8.64
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
    @total_price = line_price.values.reduce { |result, price| price + result }
  end

  def calculate_tax
    @tax = ((total_price.to_f * tax_percent) / 100).round(2)
  end

  def calculate_taxed_total
    @taxed_total = total_price + tax
  end

  def accept_cash bills
    @cash_accepted = bills
  end

  def calculate_change
    @change = cash_accepted - taxed_total
  end

end
