class PackageSharedListing < ActiveRecord::Base
  belongs_to :package
  belongs_to :listing
  validates :package_id, :uniqueness => { :scope => :listing_id }
end
