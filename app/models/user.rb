class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :email, :first_name, :last_name, :mobile_num, :home_num, :address_1, :address_2, :city, :state, :zip, :password, :password_confirmation, :remember_me, :facebook_token, :dwolla_token
  has_many :documents, :dependent => :destroy
  has_many :packages
  has_many :shared_packages, :as => :receiver
  has_many :listings
  has_many :shared_listings, :as => :receiver
  has_many :user_roles, :class_name => "UserRoles"
  has_many :roles, :through => :user_roles
  has_one :renter_profile, :dependent => :destroy
  has_one :dwolla_user, :dependent => :destroy
  has_one :dropbox_user, :dependent => :destroy

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

  def integrated_with?(provider)
    if self.send(provider).present?
      true
    else
      false
    end
  end

  # Dwolla:  data, returned by env["omniauth.auth"]
  # data: info[city, latitude, longitude, name, state, type], extra[nil], credentials[expires, token], provider, uid
  def add_dwolla(data)
    dw_user = DwollaUser.find_by_uid(data.uid)

    if dw_user.nil?
       dw_user = DwollaUser.create!(:uid => data.uid, :access_token => data.credentials.token)
    end

    self.update_attribute(:dwolla_user, dw_user)
  end


  # Dropbox: data, returned by env["omniauth.auth"]
  # data: info[email, name, uid], quota_info[normal, quota, shared], referral_link, extra[access_token[token, secret]]]
  # info:
  def add_dropbox(data)
    logger.info data.info.to_s
    logger.info data.extra.to_s
     db_user = DropboxUser.find_by_uid(data.uid.to_s)

    if db_user.nil?
      db_user = DropboxUser.create!(:uid => data.uid.to_s, :access_key => 'access', :access_secret => 'secret')
    end

    self.update_attribute(:dropbox_user, db_user)
  end

  # Check facebook-omniauth github page for breakdown of returned data
  def self.find_for_facebook_oauth(token, signed_in_resource=nil)
     data = token.extra.raw_info

     if user = self.find_by_email(data.email)
       user
     else
       user = self.create!(:email => data.email, :first_name => data.first_name, :last_name => data.last_name, :password => Devise.friendly_token[0,20], :facebook_token => token.credentials.token)
       user.assign_role(:renter)
       return user
     end
  end

  
  private

  def generate_receiver_id
    shared_packages << SharedPackage.where('receiver_email = ?', email.downcase)
  end


end
