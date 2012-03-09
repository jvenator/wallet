class Package < ActiveRecord::Base
  has_many :document_packages, :dependent => :destroy
  has_many :documents, :through => :document_packages
  
  
  def add_document(document)
    self.document_packages.create(:document => document)
  end
  def remove_document(document)
    self.document_packages.where(:document_id => document.id).each do |dp|
      dp.destroy
    end
  end
end
