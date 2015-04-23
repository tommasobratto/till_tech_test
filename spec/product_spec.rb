require_relative '../product.rb'

describe Product do

  let(:latte) { Product.new('Cafe Latte') }

  it 'should have a name' do
    expect(latte.name).to eq "Cafe Latte"
  end

  it 'should have a price' do
    expect(latte.price).to eq 4.75
  end

end
