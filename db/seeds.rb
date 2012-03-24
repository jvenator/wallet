# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(first_name: "Joseph", last_name: "DeVenuta", email: "j@venator.vc", password: "password", password_confirmation: "password", renter: "true", broker: "true")
admin.admin = true
admin.save!

renter = User.create!(first_name: "Ronnie", last_name: "Renter", email: "ronnie@renter.com", password: "password", password_confirmation: "password", renter: "true")

broker = User.create!(first_name: "Broker", last_name: "Girl", email: "broker@broker.com", password: "password", password_confirmation: "password", broker: "true")