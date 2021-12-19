# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

user1 = User.create! first_name: 'Zeev', last_name: 'Jabotinsly', email: 'zeev@jabotinsky.org', username: 'zeejab'
user2 = User.create! first_name: 'Theodor', last_name: 'Herzl', email: 'theodor@herzl.org', username: 'theoh'
Bond.create user: user1, friend: user2, state: Bond::FOLLOWING
Bond.create user: user2, friend: user1, state: Bond::FOLLOWING
place = Place.create locale: 'en', name: 'Hotel Vienna', place_type: 'hotel', coordinate: 'POINT (48.210033 16.363449 0)'
post = Post.create! user: user1, postable: Status.new(text: 'In ale gasn vu men geyt')
Post.create! user: user2, postable: Status.new(text: 'Hert men zabostovkes', thread: post)
Post.create! user: user1, postable: Status.new(text: 'Yinglekh, meydlekh, kind un keyt', thread: post)
Post.create! user: user2, postable: Status.new(text: 'Shmuesn fun pribovkes'), thread: post)
Post.create! user: user1, postable: Sight.new(place: place, activity_type: Sight::CHECKIN)