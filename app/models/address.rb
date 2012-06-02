class Address < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :from_date, :state, :to_date, :zip
end
