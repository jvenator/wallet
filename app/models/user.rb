class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :email, :first_name, :last_name, :mobile_num, :home_num, :address_1, :address_2, :city, :state, :zip, :password, :password_confirmation, :remember_me
  has_many :documents, :dependent => :destroy
  has_many :packages
  has_many :shared_packages, :as => :receiver
  has_many :listings
  has_many :shared_listings, :as => :receiver
  has_many :user_roles, :class_name => "UserRoles"
  has_many :roles, :through => :user_roles
  has_one :renter_profile, :dependent => :destroy

  accepts_nested_attributes_for :roles

  
  after_create :generate_receiver_id
  
  def to_s
    "#{self.first_name} #{self.last_name}"
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end


  # Roles
  def assign_role(role_sym)
     roles << Role.where(:name => role_sym)
  end

  def remove_role(role_sym)
     #TODO
  end

  def has_role?(role_sym)
    roles.any? {|r| r.name.underscore.to_sym == role_sym}
  end

  def admin?
     has_role?(:admin)
  end

  def renter?
     has_role?(:renter)
  end

  def owner_rep?
     has_role?(:manager) || has_role?(:broker)
  end

  def manager?
     has_role?(:manager)
  end

  def broker?
     has_role?(:broker)
  end

  # Omniauth

  def self.find_for_facebook_oauth(token, signed_in_resource=nil)
     data = token.extra.raw_info

     if user = self.find_by_email(data.email)
       user
     else
       self.create!(:email => data.email, :first_name => data.first_name, :last_name => data.last_name, :password => Devise.friendly_token[0,20])
     end
  end


    
  
  private
  def generate_receiver_id
    shared_packages << SharedPackage.where('receiver_email = ?', email.downcase)
  end
end
