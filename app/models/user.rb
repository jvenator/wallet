class User < ActiveRecord::Base
  has_many :documents, :dependent => :destroy
  has_many :packages
end
