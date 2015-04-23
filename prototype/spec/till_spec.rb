require_relative '../till.rb'

describe Till do

  let(:till) { Till.new }

  it 'should be able to take an order' do
    till.take_order :latte
    expect(till.orders.count).to eq 1
  end

  it 'should be able to count the quantity of the same item ordered' do
    2.times { till.take_order :latte }
    till.calculate_quantity
    expect(till.quantity[:latte]).to eq 2
  end

  it 'should be able to calculate the line price of an item' do
    2.times { till.take_order :latte }
    till.calculate_quantity
    till.calculate_line_price :latte
    expect(till.line_price[:latte]).to eq 10
  end

end
