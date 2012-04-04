class Listing < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  
  validates :name, :length => { :minimum => 3, :maximum => 100 }
  validates :name, :presence => true
  
  before_save :generate_listing_identifier
  
  private  
  def generate_listing_identifier
    while Listing.exists?(:identifier => self.identifier) do
      self.identifier = SecureRandom.urlsafe_base64[0..7].upcase  
    end
  end
  
end
