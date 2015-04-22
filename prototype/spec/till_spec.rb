require_relative '../till.rb'

describe Till do

  let(:till) { Till.new }

  it 'should be able to accept a latte as an order' do
    till.take_order :latte
    expect(till.orders.first).to eq :latte
  end

end
