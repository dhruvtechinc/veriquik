class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:create]
 def home
  	@user = User.new
  end

  def create
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
