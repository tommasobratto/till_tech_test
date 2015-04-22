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

end
