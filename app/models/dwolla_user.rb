class DwollaUser < ActiveRecord::Base
  attr_accessible :access_token, :uid
  has_one :user


end
