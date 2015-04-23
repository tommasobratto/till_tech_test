require_relative '../receipt.rb'

describe Receipt do

  let(:receipt) { Receipt.new }
  let(:till) { double :till, line_price: {}, quantity: {}, taxed_total: 14.50 }

  before do
    till.line_price['Cafe Latte'] = 9.50
    till.quantity['Cafe Latte'] = 2
  end

  it 'should be able to show a product' do
    receipt.get_product_line till
    expect(receipt.display_product 'Cafe Latte').to eq 'Cafe Latte'
  end

  it 'should be able to show a line price for a product' do
    receipt.get_product_line till
    expect(receipt.display_product_price 'Cafe Latte').to eq 9.50
  end

  it 'should be able to show the quantity of a product' do
    receipt.get_product_quantity till
    expect(receipt.display_product_quantity 'Cafe Latte').to eq 2
  end

  before do
    till.line_price['Cafe Latte'] = 9.50
    till.quantity['Cafe Latte'] = 2
    till.line_price['Cappucino'] = 3.85
    till.quantity['Cappucino'] = 1
  end

  it 'should be able to show several products' do
    receipt.get_product_line till
    expect(receipt.order_line.count).to eq 2
  end

  it 'should be able to show a total price' do
    receipt.get_total_price till
    expect(receipt.show_total).to eq 14.50
  end

  it 'should be able to show an actual receipt' do
    receipt.get_product_line till
    receipt.get_product_quantity till
    receipt.get_total_price till
    expect(receipt.display_receipt).to eq "2 x Cafe Latte: 9.5£ \n 1 x Cappucino: 3.85£ \n amount total: 14.5£"
  end
end
