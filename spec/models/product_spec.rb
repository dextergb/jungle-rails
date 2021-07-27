require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'will save if all fields entered correctly' do
      @category = Category.new(name: "test")
      @product = @category.products.new(name: 'hat', price: 10, quantity: 50)
      expect(@product).to be_valid
    end

    it 'will not save if quantity is nil' do
      @category = Category.new(name: "test")
      @product = @category.products.new(name: 'hat', price: 10, quantity: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'will not save if name is nil' do
      @category = Category.new(name: "test")
      @product = @category.products.new(name: nil, price: 10, quantity: 50)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'will not save if price is nil' do
      @category = Category.new(name: "test")
      @product = @category.products.new(name: 'hat', price: nil, quantity: 50)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'will not save if category is nil' do
      @category = Category.new({name: "test"})
      @product = @category.products.new(name: 'hat', price: 10, quantity: 50, category: nil)
      expect(@test_product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end