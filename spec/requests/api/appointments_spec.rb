require 'rails_helper'

RSpec.describe "Appointmets Endpoint", type: :request do
  describe "authorized access" do
    it "should show a list of appointments" do
      @user = FactoryBot.create(:api_user)
      @appointment = FactoryBot.create(:upcoming_appointment, user: @user)
      headers =  {'Authorization' => '11223344556677889900aabbccddeeff'}
      get api_appointments_path, params: {}, headers: headers
      expect(response).to have_http_status(200)
    end
    it "should create a new appointment" do
      @user = FactoryBot.create(:api_user)
      headers =  {'Authorization' => '11223344556677889900aabbccddeeff'}
      data = {title: "Test", starts_at: 1.hour.since.strftime("%F %T")}
      post api_appointments_path, params: data, headers: headers
      expect(response).to have_http_status(201)
      expect(@user.appointments.count).to equal(1)
    end
  end
  describe "Not-Authorized access" do
    it "should return not authorized error" do
      get api_appointments_path
      expect(response).to have_http_status(401)
    end
  end
end
