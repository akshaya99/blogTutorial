module ApplicationHelper
	def logged_in
		if session[:user_id]
			if user = User.find(session[:user_id])
				user
			end
		end
	end

	def blog_title
		if user = logged_in
			user.blog_name
		else
			'Blog on Rails'
		end
	end

	def blog_description
		if user = logged_in
			"This is the blog of #{user.name}"
		else
			"Sign up to create your very own blog!"
		end
	end
end
