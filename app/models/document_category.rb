class DocumentCategory < ActiveRecord::Base
	attr_accessible :user_type, :name, :description
  
  

  def self.renter
  	where(user_type: "renter")
  end

  def self.broker
  	where(user_type: "broker")
  end

  def self.manager
  	where(user_type: "manager")
  end
end
