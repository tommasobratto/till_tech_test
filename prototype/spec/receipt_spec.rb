require_relative '../receipt.rb'

describe Receipt do

  let(:receipt) { Receipt.new }
  let(:till) { double :till, line_price: {}, quantity: {}, total_price: 0 }

  before do
    till.line_price['Cafe Latte'] = 9.50
  end

  it 'should be able to show a product' do
    receipt.get_product_line till
    expect(receipt.display_product).to eq 'Cafe Latte'
  end

  it 'should be able to show a line price for a product' do
    receipt.get_product_line till
    expect(receipt.display_product_price).to eq 9.50
  end

  # it 'should be able to show the quantity of a product' do

  # end

  before do
    till.line_price['Cafe Latte'] = 9.50
    till.line_price['Cappucino'] = 3.85
    till.total_price 13.35
  end

  # it 'should be able to show several products' do

  # end

  # it 'should be able to show a total price' do

  # end

  # it 'should be able to show an actual receipt' do

  # end
end
