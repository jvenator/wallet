class Listing < ActiveRecord::Base
  
  belongs_to :user
  has_many :document_listings, :dependent => :destroy
  has_many :documents, :through => :document_listings
  
  
  validates :name, :length => { :minimum => 3, :maximum => 100 }
  validates :name, :presence => true
  
  before_save :generate_listing_identifier
  
  def add_document(document)
    self.document_listings.create(:document => document)
  end
  def remove_document(document)
    self.document_listings.where(:document_id => document.id).each do |dp|
      dp.destroy
    end
  end
  
  private  
  def generate_listing_identifier
    self.identifier = SecureRandom.urlsafe_base64[0..7].upcase
  end
  
end
