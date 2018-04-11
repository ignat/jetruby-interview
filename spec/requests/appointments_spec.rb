require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "GET /appointments with signed in user" do
    it "should show a list of appointments" do
      @user = FactoryBot.create(:user)
      @appointment = FactoryBot.create(:upcoming_appointment, user: @user)
      sign_in @user
      get appointments_path
      assert_select "ul li", 1
      assert_response :success
    end
  end
  describe "GET /appointments without signed in user" do
    it "should redirect to login page" do
      get appointments_path
      assert_redirected_to new_user_session_path
    end
  end
end
