class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:profile]

  def index
  end

  def profile
    @user = current_user
    if @user.api_key.blank?
      @user.api_key = SecureRandom.hex
      @user.save
    end
  end

end
