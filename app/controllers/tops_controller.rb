class TopsController < ApplicationController
  before_action :set_top, only: [:show, :edit, :update, :destroy]

  def index
  end

  def aboutme
    @profile = Profile.first
  end

  def ds
  end

  def ds_coil
  end
end
