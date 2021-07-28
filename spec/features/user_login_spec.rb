require 'rails_helper'

RSpec.feature "User Login", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'Lighthouse',
      last_name: 'Labs',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario 'test that users can login successfully and are taken to the home page once they are signed in' do
    visit root_path
    click_link 'Login'
    expect(page).to have_text('Email:')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Submit'
    save_screenshot('login.png')
    expect(page).to have_text(/signed in as Lighthouse/i)
    expect(page).to have_text(/logout/i)
  end

end