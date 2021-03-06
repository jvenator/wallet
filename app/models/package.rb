class Package < ActiveRecord::Base

  belongs_to :user
  has_many :document_packages, :dependent => :destroy
  has_many :documents, :as => :renter_documents, :through => :document_packages
  has_many :submitted_packages, :class_name => 'SubmittedPackages'
  has_many :listings, :through => :submitted_packages
  has_many :shared_packages, :dependent => :destroy
  has_many :package_shared_listings
  has_many :shared_listings, :through => :package_shared_listings
  
  before_create :generate_package_identifier
  
  
  def add_document(document)
    self.document_packages.create(:document => document)
  end
  
  def remove_document(document)
    self.document_packages.where(:document_id => document.id).each do |dp|
      dp.destroy
    end
  end
  
  def share_by_email(sender, receiver_email)
    receiver = User.find_by_email(receiver_email)
    shared_package = self.shared_packages.create( :receiver => receiver,
                                                  :receiver_email => receiver_email,
                                                  :sender => sender)
    if shared_package.persisted?
      Notifications.shared_package(shared_package).deliver
    end
    shared_package
  end
  
  private  
  def generate_package_identifier
    self.identifier = SecureRandom.urlsafe_base64[0..5].upcase
  end
end
