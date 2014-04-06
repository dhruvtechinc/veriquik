class StaticPagesController < ApplicationController
  
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
