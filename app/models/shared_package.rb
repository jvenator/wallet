class SharedPackage < ActiveRecord::Base
  belongs_to :receiver, polymorphic: true
  belongs_to :package
end