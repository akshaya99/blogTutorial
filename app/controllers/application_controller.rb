class ApplicationController < ActionController::Base
	before_filter :authorize
  protect_from_forgery

  def authorize
  	if not session[:user_id] or not User.find(session[:user_id])
  		redirect_to login_url, :notice => "Please log in first"
  	end
  end

  def logged_in
		if session[:user_id]
			if user = User.find(session[:user_id])
				user
			end
		end
	end

  def check_user_for_post(post)
  	if post.user == logged_in
  		true
  	end
	end
end
