# file: app/controller/api/v1/sessions_controller.rb
class Api::V1::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    puts params.inspect
    puts "#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + params[:session].slice(:user).to_json.to_s
    puts params[:controller].to_s
    input = "POST," + params[:controller].to_s + "," + params[:session].to_json.to_s
    puts "input: @@@@@@@@@@@@@@@@@@@@@@@@@@@@             " + input
    hex_val =  OpenSSL::HMAC.hexdigest('sha256','test', input)
    puts hex_val

    puts "Resource @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + resource_name.to_s
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :data => { :auth_token => current_user.authentication_token } }
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end
end
