# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :require_user

  def show
    @user = user
    @movies = @user.parties.map do |party|
      MovieFacade.movie_details(party.movie_id)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "#{@user.name} profile successfully created"
      redirect_to dashboard_path
    elsif params[:password] != params[:password_confirmation]
      flash[:error] = "passwords do not match"
      redirect_to new_user_path
    else
      redirect_to new_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
