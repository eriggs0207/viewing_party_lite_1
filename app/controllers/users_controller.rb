# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
      flash[:success] = "#{@user.name} profile successfully created"
      redirect_to user_path(@user)
    elsif params[:password] != params[:password_confirmation]
      flash[:error] = "passwords do not match"
      redirect_to '/register/new'
    else
      redirect_to '/register/new'
    end
  end

  def login_form
  end
  
  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.name}!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
