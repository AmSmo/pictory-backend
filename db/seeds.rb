# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Comment.destroy_all
UserPhoto.destroy_all
UserLocation.destroy_all
LocationPhoto.destroy_all
Location.destroy_all
Photo.destroy_all
User.destroy_all

matt = User.create(username: "Matt")
jersey_city = Location.create(name: "Lincoln Park West", latitude: "40.727063",  longitude: "-74.096523")
photo = Photo.create(name: "Test", date: DateTime.parse("24/9/2020 14:05"), caption: "Lovely stroll", url:"pictory/storage/IMG_20200924_140514.jpg")
userlocation= UserLocation.create(user: matt, location: jersey_city)
userphoto= UserPhoto.create(user: matt, photo: photo)
comment = Comment.create(user: matt, photo: photo, comment: "This is a comment")
locationphoto = LocationPhoto.new(photo: photo, location: jersey_city)