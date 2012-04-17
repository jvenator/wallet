class PackageSharedListing < ActiveRecord::Base
  belongs_to :package
  belongs_to :shared_listing
end
