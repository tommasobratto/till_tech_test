require_relative '../product.rb'

describe Product do

  it 'should have a price' do
    brew = Product.new(5)
    expect(brew.price).to eq 5
  end

end
