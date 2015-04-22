require_relative '../till.rb'

describe Till do

  let(:till) { Till.new }

  it 'should be able to accept a product' do
    till.take_order :latte
    expect(till.orders.count).to eq 1
  end

  it 'should be able to get a price for the product' do
    till.take_order :latte
    expect(till.line_total_price[:latte]).to eq 5
  end
end
