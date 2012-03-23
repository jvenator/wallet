class Package < ActiveRecord::Base

  belongs_to :user
  has_many :document_packages, :dependent => :destroy
  has_many :documents, :through => :document_packages
  has_many :shared_packages
  
  before_save :generate_package_identifier
  
  
  def add_document(document)
    self.document_packages.create(:document => document)
  end
  def remove_document(document)
    self.document_packages.where(:document_id => document.id).each do |dp|
      dp.destroy
    end
  end
  
  private  
  def generate_package_identifier
    while Package.exists?(:identifier => self.identifier) do
      self.identifier = SecureRandom.urlsafe_base64[0..5].upcase  
    end
  end
end
