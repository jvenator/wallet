class Listing < ActiveRecord::Base
  
  belongs_to :user
  has_many :document_listings, :dependent => :destroy
  has_many :documents, :through => :document_listings
  has_many :shared_listings, :dependent => :destroy  
  
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
  
  def received_packages
    
  end
  
  def share_listing(sender, receiver_email)
    receiver = User.find_by_email(receiver_email)
    shared_listing = self.shared_listings.create( :receiver => receiver,
                                                  :receiver_email => receiver_email,
                                                  :sender => sender)
    if shared_listing.persisted?
      Notifications.shared_listing(shared_listing).deliver
    end
    shared_listing
  end
  
  private  
  def generate_listing_identifier
    self.identifier = SecureRandom.urlsafe_base64[0..7].upcase
  end
  
end
