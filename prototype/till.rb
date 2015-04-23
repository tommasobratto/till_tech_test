require_relative './menu.rb'

class Till

  attr_accessor :orders, :quantity, :line_price
  attr_reader :menu

  def initialize
    load_files
    @orders = []
    @quantity = Hash.new(0)
    @line_price = {}
  end

  def take_order product
    orders << product
  end

  def calculate_quantity
    orders.each do |product|
      quantity[product] += 1
    end
  end

  def calculate_line_price product
    line_price[product] = quantity[product] * menu[product]
  end

  def calculate_total_price

  end

end
