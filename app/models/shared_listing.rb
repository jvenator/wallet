class SharedListing < ActiveRecord::Base
  belongs_to :receiver, polymorphic: true
  belongs_to :listing
  has_many :package_shared_listings
  has_many :packages, :through => :package_shared_listings
  has_many :documents, :through => :listing

  belongs_to :sender, :class_name => "User"
  validates :receiver_email, :uniqueness => { :scope => :listing_id, :message => "Listing already shared with that email address."}
  
  def add_package(package)
    self.package_shared_listings.create(:package => package)
  end
  
  def remove_package(package)
    self.package_shared_listings.where(:package_id => package.id).each do |p|
      p.destroy
    end
  end
end
