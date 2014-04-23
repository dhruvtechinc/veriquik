class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include SessionsHelper
  include VerificationOrdersHelper
  def after_sign_in_path_for(resource_or_scope)
        verification_orders_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :username, :first_name, :last_name, :email, :password, :password_confirmation) }
    #devise_parameter_sanitizer.for(:sign_up) << :username, :first_name, :last_name
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  end
end

=begin
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user_from_token!
  
  include SessionsHelper
  include VerificationOrdersHelper
  private
  def authenticate_user_from_token!
  	user_email = params[:user_email].presence
  	user = user_email && User.find_by_email(user_email)

# Notice how we use Devise.secure_compare to compare the token
# in the database with the token given in the params, mitigating
# timing attacks.
if user && Devise.secure_compare(user.authentication_token, params[:user_token])
	sign_in user, store: false
end
end
end
=end
