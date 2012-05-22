class Document < ActiveRecord::Base
  attr_accessible :name, :file, :category, :as_of_date  # other fields will need to be added in the future
  belongs_to :user
  has_many :document_packages
  has_many :packages, :through => :document_packages
  has_many :listings, :through => :document_listings
  mount_uploader :file, FileUploader
  validates :name, :length => { :minimum => 3 }
  validates :name, :file, :presence => true
  after_create :upload_to_dropbox_async
  
  CATEGORIES = { blank: "Select", bank_statements: "Bank Statements", employment: "Employment", taxes: "Taxes", references: "References", miscellaneous: "Miscellaneous" }
  
  def self.categories
    CATEGORIES  # this is the same as return CATEGORIES
  end

  def upload_to_dropbox_async
     DropboxUploadWorker.perform_async(self.id)
  end

  def upload_to_dropbox
     if user.dropbox_user.present?
       file.cache_stored_file!
       user.dropbox_user.upload_file(name, File.open(file.path))
     end
  end
  
end
