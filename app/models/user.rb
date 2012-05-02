class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :mobile_num, :home_num, :address_1, :address_2, :city, :state, :zip, :renter, :owner_rep, :password, :password_confirmation, :remember_me
  has_many :documents, :dependent => :destroy
  has_many :packages
  has_many :shared_packages, :as => :receiver
  has_many :listings
  has_many :shared_listings, :as => :receiver
  
  after_create :generate_receiver_id
  
  def to_s
    "#{self.first_name} #{self.last_name}"
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
    
  
  private
  def generate_receiver_id
    shared_packages << SharedPackage.where('receiver_email = ?', email.downcase)
  end
end
