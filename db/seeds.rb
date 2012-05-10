# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Roles
roles = Role.create!([{:name => "admin"}, {:name => "manager"}, {:name => "broker"}, {:name => "renter"}])

admin = User.new(first_name: "Joe", last_name: "Admin", email: "j@example.com", password: "password", password_confirmation: "password")
admin.assign_role(:admin)
admin.save!
broker = User.create!(first_name: "Jesse", last_name: "Broker", email: "jesse@broker.com", password: "password", password_confirmation: "password", mobile_num: "999-999-9999")
broker.assign_role(:broker)
renter = User.create!(first_name: "Ronnie", last_name: "Renter", email: "ronnie@renter.com", password: "password", password_confirmation: "password", mobile_num: "646-555-8181", address_1: "123 Renter Lane", address_2: "Apt 7", city: "New York", state: "NY", zip: "10003")
renter.assign_role(:renter)
manager = User.create!(first_name: "Pat", last_name: "Manager", email: "pat@manager.com", password: "password", password_confirmation: "password", mobile_num: "917-555-8181", address_1: "123 Owner Lane", address_2: "Suite 1134", city: "New York", state: "NY", zip: "10022")
manager.assign_role(:manager)

