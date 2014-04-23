module SessionsHelper
	def json_client_key_validation
		puts params.inspect
	    puts "#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + params[:session].slice(:user).to_json.to_s
	    puts params[:controller].to_s
	    input = "POST," + params[:controller].to_s + "," + params[:session].to_json.to_s
	    puts "input: @@@@@@@@@@@@@@@@@@@@@@@@@@@@             " + input
	    hex_val =  OpenSSL::HMAC.hexdigest('sha256','test', input)
	    puts hex_val
		api_key_val = ApiKey.Where(users_id: :user_id, api_key: :api_key)
		if api_key_val.nil?
			return false
		else

		    puts "Resource @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + resource_name.to_s
		end
	end
end
