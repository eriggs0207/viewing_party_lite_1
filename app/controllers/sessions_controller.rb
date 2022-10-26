class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Password or email is incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
