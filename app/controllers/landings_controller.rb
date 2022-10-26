# frozen_string_literal: true

class LandingsController < ApplicationController
  def index
    @user = user
    @users = User.all
  end
end
