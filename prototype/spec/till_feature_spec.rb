require 'capybara/rspec'
require_relative '../till.rb'

feature 'till prints receipt' do

  let(:till) { Till.new }
  let(:latte) { double :product, price: 5 }
  let(:espresso) { double :product, price: 3 }

  scenario 'prints a receipt for a product' do
    till = Till.new
    till.take_order latte
    expect(till.orders.first).to be latte
  end

  scenario 'prints the total of that product' do
    2.times { till.take_order latte }
    expect(till.line_total_price[latte]).to eq 10
  end

  scenario 'prints several products' do
    2.times { till.take_order latte }
    till.take_order espresso
    expect(till.orders.count).to eq 3
    expect(till.orders.last).to be espresso
  end

  scenario 'prints correct prices for each product' do
    2.times { till.take_order latte }
    till.take_order espresso
    expect(till.line_total_price[latte]).to eq 10
    expect(till.line_total_price[espresso]).to eq 3
  end

  scenario 'prints the total for an order' do
    2.times { till.take_order latte }
    till.take_order espresso
    expect(till.total).to eq 13
  end

end
