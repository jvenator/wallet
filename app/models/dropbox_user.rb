class DropboxUser < ActiveRecord::Base
  attr_accessible :access_key, :access_secret, :uid
  has_one :user


end
