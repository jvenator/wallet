class SharedListing < ActiveRecord::Base
  belongs_to :receiver, polymorphic: true
  belongs_to :listing
  has_many :package_shared_listings
  has_many :packages, :through => :package_shared_listings
  has_many :documents, :through => :listing

  belongs_to :sender, :class_name => "User"
  validates :receiver_email, :uniqueness => { :scope => :listing_id, :message => "Listing already shared with that email address."}
  

end
