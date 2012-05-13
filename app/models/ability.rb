class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :manager
      can :create, Listing
      can :update, Listing do |listing|
        listing.try(:user) == user
      end
      can :create, Document
      can :update, Document do |document|
        document.try(:user) == user
      end

    elsif user.has_role? :broker
      can :create, Listing
      can :update, Listing do |listing|
        listing.try(:user) == user
      end
      can :create, Document
      can :update, Document do |document|
        document.try(:user) == user
      end

    elsif user.has_role? :renter
      can :create, Document
      can :update, Document do |document|
        document.try(:user) == user
      end
      can :create, Package
      can :update, Package do |package|
        package.try(:user) == user
      end
      can :create, RenterProfile
      can :update, RenterProfile do |profile|
        profile.try(:user) == user
      end

    else
      can :read, :all
    end
  end
end
