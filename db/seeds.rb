# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 # create_table "leagues", force: :cascade do |t|
 #    t.string   "name"
 #    t.text     "content"
 #    t.datetime "created_at", null: false
 #    t.datetime "updated_at", null: false
 #  end

  league1 = League.create([{ name: 'Chicago', content: 'Primera liga de chicago' }])
  league2 = League.create!([{ name: 'Chicago', content: 'Segunda liga de chicago' }])
  league3 = League.create!([{ name: 'Chicago', content: 'Tercare liga de chicago' }])

  
# user 1
  # user = User.new
  # user.name = 'Usuario 1'
  # user.email = 'test@example.com'
  # user.password = 'valid_password'
  # user.password_confirmation = 'valid_password'
  user = User.create!({:name => "Henry", :email => "henry@email.com", :password => "12345678", :password_confirmation => "12345678"})
  user1 = User.create!({:name => "User1", :email => "user1@example.com", :password => "12345678", :password_confirmation => "12345678"})
  user2 = User.create!({:name => "User2", :email => "user2@example.com", :password => "12345678", :password_confirmation => "12345678"})
  user3 = User.create!({:name => "User3", :email => "user3@example.com", :password => "12345678", :password_confirmation => "12345678"})
  user4 = User.create!({:name => "User4", :email => "user4@example.com", :password => "12345678", :password_confirmation => "12345678"})
  user5 = User.create!({:name => "User5", :email => "user5@example.com", :password => "12345678", :password_confirmation => "12345678"})
  user6 = User.create!({:name => "User6", :email => "user6@example.com", :password => "12345678", :password_confirmation => "12345678"})

# Jackpot

# jackpot1 = Jackpot.create!([{ balance: '0'}])

# jackpot1.league_id = 1
# jackpot1.save

#Join Users to League
  user1.league_id = 1
  user1.save

  user2.league_id = 1
  user2.save

  user3.league_id = 1
  user3.save

  user4.league_id = 1
  user5.save