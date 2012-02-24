class DocumentPackage < ActiveRecord::Base
  belongs_to :package
  belongs_to :document
end
