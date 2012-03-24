class SharedPackage < ActiveRecord::Base
  belongs_to :receiver, polymorphic: true
  belongs_to :package
  has_many :documents, :through => :package
  belongs_to :sender, :class_name => "User"
  validates :receiver_email, :uniqueness => { :scope => :package_id, :message => "Package already shared with that email address."}
  #validates_uniqueness_of :receiver, :scope => :package
end