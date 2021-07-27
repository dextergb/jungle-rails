require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do

    it 'should pass if passwords match' do
      user = User.new(password: '123', password_confirmation: 'abc')
      expect(user).to_not be_valid
    end

    it 'should pass if passwords are present' do
      user = User.new(password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'should pass if emails are unique' do
      user = User.create(
        email: "test@test.com"
      )
      userTest = User.new(email: 'email@email.com')
      expect(userTest).to_not be_valid
    end

    it 'will test if all fields are filled correctly' do
      user = User.new(first_name: 'Lighthouse', last_name: 'Labs', password: 'password', password_confirmation: 'password', email: 'test@test.com')
      expect(user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should pass if valid credentials' do
      user = User.new(
        first_name: 'Lighthouse',
        last_name: 'Labs',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(user).to_not be(nil)
    end

    it 'should pass if spaces around email' do
      user = User.new(
        first_name: 'Lighthouse',
        last_name: 'Labs',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user = User.authenticate_with_credentials(' test@test.com ', 'password')
      expect(user).to_not be(nil)
    end

    it 'should pass if email is entered with wrong cases' do
      user = User.new(
        first_name: 'Lighthouse',
        last_name: 'Labs',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user = User.authenticate_with_credentials('TeSt@TeSt.CoM', 'password')
      expect(user).to_not be(nil)
    end
  end
end
