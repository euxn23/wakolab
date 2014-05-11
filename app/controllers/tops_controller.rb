class TopsController < ApplicationController
  before_action :set_top, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token

  def index
  end

  def aboutme
    @profile = Profile.find(0)
  end

  def admin
    redirect_to '/' unless session[:user_uid] == '123857414'
    @profile = Profile.find(0)
  end
end
