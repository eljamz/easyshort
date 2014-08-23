puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :fullname => 'Admin', :email => 'admin@easyshort.com', :password => 'please2014', :password_confirmation => 'please2014'
puts 'New user created: ' << user.fullname
user2 = User.create! :fullname => 'Other User', :email => 'user2@easyshort.com', :password => 'please2014', :password_confirmation => 'please2014'
puts 'New user created: ' << user2.fullname