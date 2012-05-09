class SubmittedPackages < ActiveRecord::Base
  belongs_to :package
  belongs_to :listing
end
