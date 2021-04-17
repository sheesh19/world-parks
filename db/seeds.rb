require 'open-uri'
require 'json'

Park.destroy_all

african_parks_file = File.join(__dir__, 'data/african_parks.json')
serialized_parks = File.read(african_parks_file)

park_json = JSON.parse(serialized_parks)['parks']

puts "Creating new park!"

park_json.each do |park|
    new_park = Park.create!(park)
    puts "Created #{new_park.name}"
end

puts "Created #{Park.count} new park(s)"
