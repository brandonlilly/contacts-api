# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Contact.destroy_all
ContactShare.destroy_all

adam = User.create!(username: 'adamwells')
Contact.create!(name: 'Andrew Hope', email: 'andrew@example.com', user_id: adam.id)
Contact.create!(name: 'Anne Mai', email: 'anne@example.com', user_id: adam.id)

brandon = User.create!(username: 'brandonlilly')
Contact.create!(name: 'Cassie Montoya', email: 'cassie@example.com', user_id: brandon.id)
Contact.create!(name: 'Chris Pan', email: 'chris@example.com', user_id: brandon.id)

contacts = Contact.all
ContactShare.create!(user_id: brandon.id, contact_id: contacts[0].id)
ContactShare.create!(user_id: brandon.id, contact_id: contacts[1].id)
ContactShare.create!(user_id: adam.id, contact_id: contacts[2].id)

coworkers = Group.create!(name: 'Coworkers', user_id: brandon.id)
Grouping.create!(group_id: coworkers.id, contact_id: contacts[1].id)
Grouping.create!(group_id: coworkers.id, contact_id: contacts[2].id)
Grouping.create!(group_id: coworkers.id, contact_id: contacts[3].id)

family = Group.create!(name: 'Family', user_id: brandon.id)
Grouping.create!(group_id: family.id, contact_id: contacts[0].id)
Grouping.create!(group_id: family.id, contact_id: contacts[3].id)
