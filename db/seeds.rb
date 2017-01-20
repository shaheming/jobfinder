# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "this seed will create an admin account automatically, 10 public jobs, and 10 hidden jobs"

create_account = User.create([email: "a@a.com", password:"123456",password_confirmation: "123456",is_admin:"true"])

puts "Admin account created."

create_account_user = User.create([email: "b@b.com", password:"123456",password_confirmation: "123456",is_admin:"false"])

puts "User account created."

create_jobs = for i in 1..10 do 
	Job.create!([title: "Job no.#{i}",description: "this is #{i}th public job created by seed", wage_upper_bound: rand(50..99)*10,
		wage_lower_bound: rand(10..49)*100, is_hidden:"false"])
end

puts "10 Public jobs created."

create_jobs = for i in 1..10 do 
	Job.create!([title: "Job no.#{i}",description: "this is #{i}th hidden job created by seed", wage_upper_bound: rand(50..99)*10,
		wage_lower_bound: rand(10..49)*100, is_hidden:"true"])
end

puts "10 Hidden jobs created."