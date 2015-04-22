require 'capybara/rspec'
require_relative '../till.rb'

feature 'till prints receipt' do

  scenario 'prints a receipt for a product' do
    till = Till.new
    till.take_order :latte
    expect(till.orders.count).to eq 1
  end

end
