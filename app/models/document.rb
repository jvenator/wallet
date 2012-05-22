class Document < ActiveRecord::Base
  attr_accessible :name, :file, :category, :as_of_date  # other fields will need to be added in the future
  belongs_to :user
  has_many :document_packages
  has_many :packages, :through => :document_packages
  has_many :listings, :through => :document_listings
  mount_uploader :file, FileUploader
  validates :name, :length => { :minimum => 3 }
  validates :name, :file, :presence => true
  
  CATEGORIES = [[0, "(Select)"], 
                [1, "Bank Statements"], 
                [2, "Employment"], 
                [3, "Taxes"], 
                [4, "References"], 
                [5, "Miscellaneous"]]
  
  def self.categories
    CATEGORIES  # this is the same as return CATEGORIES
  end

  def category_name
    CATEGORIES.each do |category|
      if category[0] == self.category.to_i
        return category[1]
      end
    end
  end

  def self.categories_hash
    hash = {}
    CATEGORIES.each do |category|
      hash[category.last] = category.first
    end
    return hash
  end
  
end
