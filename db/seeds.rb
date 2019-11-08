# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts '*' * 60
puts 'Seeds'
puts '*' * 60

puts '*' * 60
puts 'Wiping database'
puts '*' * 60

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  # deletes all tables in DB except for the schema one
  next if table == 'schema_migrations' || table == 'ar_internal_metadata'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

puts '*' * 60
puts 'Creating 10 Users'
puts '*' * 60

10.times do
	User.create!(
		email: Faker::Name.first_name + '.' + Faker::Name.last_name + '@yopmail.com',
		encrypted_password: 'coucou',
		description: Faker::Lorem.sentence(word_count: 2),
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		)
end

puts '*' * 60
puts 'Creating 10 Events'
puts '*' * 60

10.times do |index|
	Event.create!(
		start_date: rand(DateTime.now..DateTime.now.end_of_year),
		duration: rand(1..5) * 5,
		title: "Event - #{index + 1}",
		description: Faker::Lorem.sentence(word_count: 10),
		price: rand(1..1000),
		location: Faker::Nation.capital_city,
		user_host_id: User.all.sample.id,
		)
end

puts '*' * 60
puts 'Creating 0 Attendance'
puts '*' * 60
