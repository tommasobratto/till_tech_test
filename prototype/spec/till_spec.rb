require_relative '../till.rb'

describe Till do

  let(:till) { Till.new }
  let(:latte) { double :latte, price: 5 }
  let(:espresso) { double :espresso, price: 3 }

  it 'should be able to accept a product' do
    till.take_order latte
    expect(till.orders.count).to eq 1
  end

  it 'should be able to get a price for the product' do
    till.take_order latte
    expect(till.line_total_price[latte]).to eq 5
  end

  it 'should be able to calculate the total' do
    till.take_order latte
    till.take_order espresso
    expect(till.total).to eq 8
  end
end
