class Document < ActiveRecord::Base
  attr_accessible :name, :file, :category, :as_of_date  # other fields will need to be added in the future
  belongs_to :user
  has_many :document_packages
  has_many :packages, :through => :document_packages
  has_many :listings, :through => :document_listings
  mount_uploader :file, FileUploader
  validates :name, :length => { :minimum => 3 }
  validates :name, :file, :presence => true
  
  CATEGORIES = { blank: "Select", bank_statements: "Bank Statements", employment: "Employment", taxes: "Taxes", references: "References", miscellaneous: "Miscellaneous" }
  
  def self.categories
    CATEGORIES  # this is the same as return CATEGORIES
  end
  
end
