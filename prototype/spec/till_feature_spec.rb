require 'capybara/rspec'
require_relative '../till.rb'

feature 'till prints receipt' do

  let(:latte) { double :product, price: 5}

  scenario 'prints a receipt for a product' do
    till = Till.new
    till.take_order latte
    expect(till.orders.first).to eq latte
  end

  scenario 'prints the total of that product' do
    till = Till.new
    2.times { till.take_order latte }
    expect(till.line_total_price[latte]).to eq 10
  end

end
