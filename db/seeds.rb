# Create Users
15.times do
	user = User.find_or_initialize_by(username: Faker::LordOfTheRings.character, email: Faker::Internet.safe_email) do |user|
		user.password = Faker::Internet.password
	end
	user.skip_confirmation!
	user.save!
end

# Create Admin User

# Create Standard User
standard = User.find_or_initialize_by(username: 'standard', email: 'standard@markshare.com') do |user|
	user.password = 'password'
	#user.role = 'standard'
end
standard.skip_confirmation!
standard.save!
users = User.all

# Create Topics
20.times do
	Topic.create!(
		title: Faker::ProgrammingLanguage.name
	)
end
topics = Topic.all

# Create Bookmarks
50.times do
	Bookmark.create!(
		topic: topics.sample,
		url: Faker::Internet.url
	)
end
bookmarks = Bookmark.all

puts "Seeding Finished"
puts "-.-.-.-.-.-.-.-.-"
puts "#{User.count} total users"
puts "#{Topic.count} total topics"
puts "#{Bookmark.count} total bookmarks"