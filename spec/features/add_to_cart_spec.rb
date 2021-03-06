require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can click on the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one" do
    # ACT
    visit root_path
    within first('.product') do
      click_button 'Add'
    end

    # DEBUG
    save_screenshot('add_cart.png')

    # VERIFY
    expect(page).to have_text('My Cart (1)')
  end
end
