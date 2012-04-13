class SharedListing < ActiveRecord::Base
  belongs_to :receiver, polymorphic: true
  belongs_to :listing
  has_many :documents, :through => :listing
  has_many :packages, :through => :package_shared_listings
  belongs_to :sender, :class_name => "User"
  validates :receiver_email, :uniqueness => { :scope => :listing_id, :message => "Listing already shared with that email address."}
  
  def add_package(package)
    self.package_shared_listings.create(:package => package)
  end
  
  def remove_package(package)
    self.package_shared_listings.where(:package_id => package_id).each do |package_shared_listing|
      package_shared_listing.destroy
    end
  end
end
