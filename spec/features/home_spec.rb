require 'rails_helper'

feature "home page" do

  scenario "show profile of logged in user" do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit '/profile'
    expect(page).to have_content('API Key')
  end

  scenario "show home page" do
    visit '/'
    expect(page).to have_content('Appointments Management System')
  end

end
