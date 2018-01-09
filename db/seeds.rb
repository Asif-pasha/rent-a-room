# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: "Admin")
Role.create(name: "Host")
Role.create(name: "Guest")
User.create(email:"admin@admin.com", password:"secret123", mobile_no:"8553678527", first_name:"Asif", last_name:"Pasha", username:"Asif pasha", role_id: Role.find_by(name: "Admin").id)
