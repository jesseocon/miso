irb
require './lib/maps_app.rb'

place = MapsApp::Place.new(type: 'restaurant')
response = place.request
restaurants_array = []
response["results"].collect { |x| restaurants_array << MapsApp::Restaurant.new(id: x['id'], name: x["name"]) }
restaurants_array
npt = response["next_page_token"]
place2 = MapsApp::Place.new(type: 'restaurant', next_page_token: npt)
response2 = place2.request
response2["results"].collect { |x| restaurants_array << MapsApp::Restaurant.new(id: x['id'], name: x["name"]) }
restaurants_array.count
restaurants_array.collect { |x| x.name }



