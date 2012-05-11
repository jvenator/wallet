class Role < ActiveRecord::Base
  has_many :user_roles, :class_name => "UserRoles"
  has_many :users, :through => :user_roles



  attr_accessible :name

  def self.to_select
    where("name in ('manager','renter', 'broker')")
  end


end
