class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where('email = ? or username = ?',params[:session][:email].downcase,params[:session][:email].downcase).first
		if user && user.authenticate(params[:session][:password])
			sign_in user
			if is_admin?
				#redirect_to :controller => 'membership', :action => 'show', :id => user.id #, :something => 'else' "/membership/show"
			elsif is_b2b?
				#redirect_to :controller => 'rewards', :action => 'new', :id => user.id, :ar => 'Accrue' #, :something => 'else' "/membership/show"
			elsif is_user?
			else
			end
			puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			puts "wuhhuu"
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
