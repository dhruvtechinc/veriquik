class Customer < ActiveRecord::Base
  attr_encrypted :ssn, :key => 'stupid'
  attr_encrypted :configuration, :key => 'idiot'
end
