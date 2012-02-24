class Package < ActiveRecord::Base
  has_many :document_packages
  has_many :documents, :through => :document_packages
end
