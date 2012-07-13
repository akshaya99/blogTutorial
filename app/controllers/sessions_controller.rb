class SessionsController < ApplicationController

  skip_before_filter :authorize

  def home
    if session[:user_id]
      @user = User.find session[:user_id]
    else
      @user = nil
    end
  end

  def new
  end

  def create
  	if user = User.authenticate(params[:user_name], params[:password_plain])
  		session[:user_id] = user.id
      redirect_to posts_url, :notice => "Welcome back #{user.name}"
  	else
      session[:user_id] = nil
  		redirect_to login_url, :notice => "Incorrect user name or password"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "You've been successfully logged out"
  end

end
