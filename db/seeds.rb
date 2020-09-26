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

# matt = User.create(username: "Matt")
# jersey_city = Location.create(name: "Lincoln Park West", latitude: "40.727063",  longitude: "-74.096523")
# photo = Photo.create(name: "Test", date: DateTime.parse("24/9/2020 14:05"), caption: "Lovely stroll", url:"pictory/storage/IMG_20200924_140514.jpg")
# userlocation= UserLocation.create(user: matt, location: jersey_city)
# userphoto= UserPhoto.create(user: matt, photo: photo)
# comment = Comment.create(user: matt, photo: photo, comment: "This is a comment")
# locationphoto = LocationPhoto.new(photo: photo, location: jersey_city)

geo = [{"type":"Feature","properties":{"id":"1507101-a","type":"st:Photo","name":"Manhattan: 59th Street (West) - 5th Avenue","data":{"uuid":"66760270-c54b-012f-f357-58d385a7bc34","imageId":"1507101","folder":"59th Street (West) & 5th Avenue, Manhattan, NY","url":"https://www.oldnyc.org/#1507101-a","imageUrl":"http://oldnyc-assets.nypl.org/600px/1507101-a.jpg","nyplUrl":"http://digitalcollections.nypl.org/items/66760270-c54b-012f-f357-58d385a7bc34"},"validSince":1908,"validUntil":1908},"geometry":{"type":"Point","coordinates":[-73.97302,40.764292]}},
{"type":"Feature","properties":{"id":"1507280-a","type":"st:Photo","name":"Allen Street #21","data":{"uuid":"c82042c0-c5cd-012f-f37a-58d385a7bc34","imageId":"1507280","folder":"Allen Street #21, Manhattan, NY","url":"https://www.oldnyc.org/#1507280-a","imageUrl":"http://oldnyc-assets.nypl.org/600px/1507280-a.jpg","nyplUrl":"http://digitalcollections.nypl.org/items/c82042c0-c5cd-012f-f37a-58d385a7bc34"}},"geometry":{"type":"Point","coordinates":[-73.99264,40.715565]}},
{"type":"Feature","properties":{"id":"1507284-a","type":"st:Photo","name":"Amsterdam Avenue #440","data":{"uuid":"c8fb6cd0-c5cd-012f-a35e-58d385a7bc34","imageId":"1507284","folder":"Amsterdam Avenue #440, Manhattan, NY","url":"https://www.oldnyc.org/#1507284-a","imageUrl":"http://oldnyc-assets.nypl.org/600px/1507284-a.jpg","nyplUrl":"http://digitalcollections.nypl.org/items/c8fb6cd0-c5cd-012f-a35e-58d385a7bc34"}},"geometry":{"type":"Point","coordinates":[-73.97748,40.784583]}},
{"type":"Feature","properties":{"id":"1507286-a","type":"st:Photo","name":"Amsterdam Avenue #1430","data":{"uuid":"c946cd40-c5cd-012f-3520-58d385a7bc34","imageId":"1507286","folder":"Amsterdam Avenue #1430, Manhattan, NY","url":"https://www.oldnyc.org/#1507286-a","imageUrl":"http://oldnyc-assets.nypl.org/600px/1507286-a.jpg","nyplUrl":"http://digitalcollections.nypl.org/items/c946cd40-c5cd-012f-3520-58d385a7bc34"}},"geometry":{"type":"Point","coordinates":[-73.954841,40.817054]}},
{"type":"Feature","properties":{"id":"1507288-a","type":"st:Photo","name":"Amsterdam Avenue #1435","data":{"uuid":"c9a82020-c5cd-012f-3577-58d385a7bc34","imageId":"1507288","folder":"Amsterdam Avenue #1435, Manhattan, NY","url":"https://www.oldnyc.org/#1507288-a","imageUrl":"http://oldnyc-assets.nypl.org/600px/1507288-a.jpg","nyplUrl":"http://digitalcollections.nypl.org/items/c9a82020-c5cd-012f-3577-58d385a7bc34"}},"geometry":{"type":"Point","coordinates":[-73.954095,40.816338]}},
{"type":"Feature","properties":{"id":"1507290-a","type":"st:Photo","name":"Amsterdam Avenue #1485","data":{"uuid":"c9fc0380-c5cd-012f-e3f3-58d385a7bc34","imageId":"1507290","folder":"Amsterdam Avenue #1485, Manhattan, NY","url":"https://www.oldnyc.org/#1507290-a","imageUrl":"http://oldnyc-assets.nypl.org/600px/1507290-a.jpg","nyplUrl":"http://digitalcollections.nypl.org/items/c9fc0380-c5cd-012f-e3f3-58d385a7bc34"}},"geometry":{"type":"Point","coordinates":[-73.953084,40.817737]}}]

nypl = User.create(username: "NYPL")
geo.each do |property|
    
    name = property[:properties][:name]
    location = property[:properties][:data][:folder]
    url = property[:properties][:data][:imageUrl]
    year = property[:properties][:validUntil]
    if year
        date = Date.parse"1-1-#{year}"
    else
        date= Date.parse("1-1-1930")
    end
    caption = "NYPL Collection of NY.  #{name}"
    longitude = property[:geometry][:coordinates][0]
    latitude = property[:geometry][:coordinates][1]

    add_to = Location.find_or_create_by(longitude: longitude, latitude: latitude, name: name)
    new_photo = Photo.create(name: name, date: date, caption: caption, url: url)
    LocationPhoto.create(photo: new_photo, location: add_to)
    UserPhoto.create(user:nypl, photo: new_photo)
end
