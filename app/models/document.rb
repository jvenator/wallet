class Document < ActiveRecord::Base
  attr_accessible :name, :file, :category, :as_of_date # other fields will need to be added in the future
  belongs_to :user
  has_many :document_packages
  has_many :packages, :through => :document_packages
  has_many :listings, :through => :document_listings
  mount_uploader :file, FileUploader
  validates :name, :length => {:minimum => 3}
  validates :name, :file, :presence => true
  after_create :upload_to_dropbox_async

  CATEGORIES = [[0, "(Select)"],
                [1, "Bank Statements"],
                [2, "Employment"],
                [3, "Taxes"],
                [4, "References"],
                [5, "Miscellaneous"]]

  def self.categories
    CATEGORIES # this is the same as return CATEGORIES
  end

  def self.categories_hash
    hash = {}
    CATEGORIES.each do |category|
      hash[category.last] = category.first
    end
    return hash
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
