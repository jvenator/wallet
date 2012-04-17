class PackageSharedListing < ActiveRecord::Base
  belongs_to :package
  belongs_to :shared_listing
  validates :package_id, :uniqueness => { :scope => :shared_listing_id }
end
