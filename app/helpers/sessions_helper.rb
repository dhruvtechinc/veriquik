module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
		self.current_role = user.role
	end
	def current_user=(user)
		@current_user = user
	end  
	def current_role=(role)
		@current_role = role
	end
	def current_role
		if !@current_user.nil?
			@current_role ||= @current_user.role
		end
	end
	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end	

	def signed_in?
		!current_user.nil?		
	end

	def sign_out
		self.current_user = nil
		self.current_role = nil
		cookies.delete(:remember_token)
	end
	def current_user?(user)
		user == current_user
	end
	def is_admin?
		current_role == User::ROLES[0]
	end
	def is_user?
		current_role == User::ROLES[1]
	end
	def is_b2b?
		current_role == User::ROLES[2]
	end
	def is_b2b?(role)
		role == User::ROLES[2]
	end
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end
	
	def correct_user
		@user = User.find(params[:id])
		redirect_to("/signout") unless current_user?(@user)
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to root_url, notice: "Please sign in."
		end

	end  
end
