class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :renter, :broker, :password, :password_confirmation, :remember_me
  has_many :documents, :dependent => :destroy
  has_many :packages
  has_many :shared_packages, :as => :receiver
  
  def to_s
    "#{self.first_name} #{self.last_name}"
  end
  
  
  def share_package(package_id)
    shared_package = self.shared_packages.create(:package_id => package_id)
    Notifications.shared_package(shared_package).deliver
  end
end
