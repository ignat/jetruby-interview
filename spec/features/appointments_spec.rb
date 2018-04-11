require 'rails_helper'

feature "appointments page" do

  before :each do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  scenario "show upcoming appointments" do
    @appointment = FactoryBot.create(:appointment, user: @user)
    visit '/appointments'
    expect(page).to have_content('Appointments')
    expect(page).to have_selector('ul li', count: 1)
  end

  scenario "show past appointments" do
    @appointment = FactoryBot.create(:past_appointment, user: @user)
    visit '/appointments?filter=past'
    expect(page).to have_content('Appointments')
    expect(page).to have_selector('ul li', count: 1)
  end

  scenario "show pending appointments" do
    @appointment = FactoryBot.create(:pending_appointment, user: @user)
    visit '/appointments?filter=pending'
    expect(page).to have_content('Appointments')
    expect(page).to have_selector('ul li', count: 1)
  end

  scenario "create new appointment" do
    visit '/appointments/new'
    fill_in 'Title', with: 'Test'
    fill_in 'When', with: '2018-10-14 10:00:00'
    select 'confirmed', from: 'Status'
    click_button 'Create Appointment'
    expect(@user.appointments.count).to equal(1)
  end

  scenario "add reminder" do
    @appointment = FactoryBot.create(:appointment, user: @user)
    visit new_appointment_reminder_path(@appointment)
    fill_in 'When', with: 23
    click_button 'Create Reminder'
    expect(@appointment.reminders.count).to equal(1)
  end

  scenario "delete appointment" do
    @appointment = FactoryBot.create(:appointment, user: @user)
    visit '/appointments'
    click_link 'Delete'
    expect(@user.appointments.count).to equal(0)
  end

end
