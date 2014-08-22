puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Admin User', :email => 'admin@easyshort.com', :password => 'please2014', :password_confirmation => 'please2014'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Other User', :email => 'user2@easyshort.com', :password => 'please2014', :password_confirmation => 'please2014'
puts 'New user created: ' << user2.name