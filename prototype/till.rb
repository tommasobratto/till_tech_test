class Till

  attr_reader :line_total_price
  attr_accessor :orders

  def initialize
    @orders = []
    @line_total_price = {}
  end

  def take_order brew
    orders << brew
    brew_price = 0
    orders.each do |product|
      if product == brew
        brew_price += 5
        line_total_price[brew] = brew_price
      end
    end
  end

end
