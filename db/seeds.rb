# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tool.destroy_all

Tool.create(name: "hammer", price: 10.00, quantity: 1)

Tool.create(name: "saw", price: 50.00, quantity: 3)

Tool.create(name: "measuring tape", price: 5.00, quantity: 3)

Tool.create(name: "screwdriver", price: 8.00, quantity: 2)

Tool.create(name: "pliers", price: 12.00, quantity: 1)

Tool.create(name: "level", price: 42.00, quantity: 1)
