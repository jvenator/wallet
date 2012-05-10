class Role < ActiveRecord::Base
  has_many :user_roles, :class_name => "UserRoles"
  has_many :users, :through => :user_roles



  attr_accessible :name


end
