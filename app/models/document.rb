class Document < ActiveRecord::Base
  belongs_to :user
  
  has_many :document_packages
  has_many :packages, :through => :document_packages
end
