class Test < ActiveRecord::Base
  attr_encrypted :email, :key => 'some secret key'
  attr_encrypted :configuration, :key => 'my secret key'
end