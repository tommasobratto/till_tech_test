require_relative '../product.rb'

describe Product do

  it 'should have a name and a price' do
    latte = Product.new("latte", 5)
    expect(latte.price).to eq 5
  end

end
