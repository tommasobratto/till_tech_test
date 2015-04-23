require_relative '../till.rb'

describe Till do

  let(:till) { Till.new }
  let(:latte) { double :product, name: 'Cafe latte', price: 4.75 }
  let(:cappuccino) { double :product, name: 'Capucino', price: 3.85 }

  it 'should be able to take an order' do
    till.take_order latte
    expect(till.orders.count).to eq 1
  end

  it 'should be able to count the quantity of the same item ordered' do
    2.times { till.take_order latte }
    till.calculate_quantity
    expect(till.quantity[latte.name]).to eq 2
  end

  it 'should be able to calculate the line price of an item' do
    2.times { till.take_order latte }
    till.calculate_quantity
    till.calculate_line_price latte
    expect(till.line_price[latte.name]).to eq 9.50
  end

  it 'should be able to calculate the total price of an order' do
    2.times { till.take_order latte }
    till.take_order cappuccino
    till.calculate_quantity
    till.calculate_line_price latte
    till.calculate_line_price cappuccino
    till.calculate_total_price
    expect(till.total_price).to eq 13.35
  end

  it 'should be able to calculate the tax on the total price' do
    2.times { till.take_order latte }
    till.take_order cappuccino
    till.calculate_quantity
    till.calculate_line_price latte
    till.calculate_line_price cappuccino
    till.calculate_total_price
    till.calculate_tax
    expect(till.tax).to eq 1.15
  end

  it 'should be able to calculate the total price, taxed' do
    2.times { till.take_order latte }
    till.take_order cappuccino
    till.calculate_quantity
    till.calculate_line_price latte
    till.calculate_line_price cappuccino
    till.calculate_total_price
    till.calculate_tax
    expect(till.calculate_taxed_total).to eq 14.50
  end
end
