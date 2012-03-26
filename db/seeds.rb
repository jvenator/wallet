# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(first_name: "Joseph", last_name: "DeVenuta", email: "j@venator.vc", password: "password", password_confirmation: "password", renter: "true", owner_rep: "true")
admin.admin = true
admin.save!

renter = User.create!(first_name: "Ronnie", last_name: "Renter", email: "ronnie@renter.com", password: "password", password_confirmation: "password", renter: "true", mobile_num: "646-555-8181", address_1: "123 Renter Lane", address_2: "Apt 7", city: "New York", state: "NY", zip: "10003")

OwnerRep = User.create!(first_name: "Manager", last_name: "Girl", email: "manager@manager.com", password: "password", password_confirmation: "password", owner_rep: "true", mobile_num: "917-555-8181", address_1: "123 Owner Lane", address_2: "Suite 1134", city: "New York", state: "NY", zip: "10022")