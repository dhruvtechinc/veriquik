class SessionsController < ApplicationController
	#after_filter :set_csrf_header, only: [:new, :create]

	def new
	end

	def create
		user = User.where('email = ? or username = ?',params[:session][:email].downcase,params[:session][:email].downcase).first
		if user && user.authenticate(params[:session][:password])
			if is_b2b?(user.role)
				flash[:signin_error] = 'Invalid email/password combination'
				redirect_to root_url
			else
				sign_in user
				#redirect_t	o :controller => 'verification_orders', :action => 'show_by_user_id', :id => user.id
				redirect_to verification_orders_path
			end
		else
			flash[:signin_error] = 'Invalid email/password combination'
			redirect_to root_url
		end		
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
