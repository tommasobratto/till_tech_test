class Till

  def initialize
    @orders = {}
  end

  def orders
    @orders
  end

  def take_order brew
    brew_count = 1

    orders.each do |product|
      if product == brew
        brew_count += 1
      end
    end

    orders[brew] = brew_count
  end

end
