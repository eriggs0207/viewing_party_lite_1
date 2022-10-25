# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !user
      flash[:error] = "You are not a registered user"
      redirect_to root_path
    end
  end
end
