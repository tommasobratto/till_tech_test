class Till

  def initialize
    @orders = []
  end

  def orders
    @orders
  end

  def take_order brew
    orders << brew
  end

end
