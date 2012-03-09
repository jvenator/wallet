class DocumentPackage < ActiveRecord::Base
  belongs_to :package
  belongs_to :document
  validates :document_id, :uniqueness => { :scope => :package_id }
end
