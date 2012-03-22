class Package < ActiveRecord::Base

  belongs_to :user
  has_many :document_packages, :dependent => :destroy
  has_many :documents, :through => :document_packages
  before_create :generate_package_identifier
  before_update :generate_package_identifier
  
  
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
    begin
      self[:identifier] = SecureRandom.urlsafe_base64[0..6].upcase
    end while Package.exists?(:identifier => self[:identifier])
  end
end
