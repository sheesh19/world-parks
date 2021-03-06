

asian_parks_file = File.join(__dir__, 'data/asian_parks.json')
# require_relative "seeds/african_seed.rb"

url = "https://en.wikipedia.org/wiki/Category:National_parks_of_Asia_by_country"
# african_parks_file = File.join(__dir__, '../data/african_parks.json')

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

wiki_link_array = html_doc.search('.CategoryTreeItem > a').map do |link|
    "https://en.wikipedia.org#{link.attribute('href').value}"
end

park_list = []

wiki_link_array.each do |link|
    html_file = URI.open(link).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('li').each do |row|
        park_name = row.text
        # geocode_data = Geocoder.search(park_name).first
        # puts "Saving #{park_name}"
        park_list << { 
            name: park_name,
            # address: geocode_data.nil? ? nil : geocode_data.address,
            # latitude: geocode_data.nil? ? nil : geocode_data.latitude,
            # longitude: geocode_data.nil? ? nil : geocode_data.longitude,
            # state: geocode_data.nil? ? nil : geocode_data.state,
            # country: geocode_data.nil? ? nil : geocode_data.country,
            # region: "Asia"
        }
    end

end



parks = { parks: parks_hashes }

File.open(asian_parks_file, 'wb') do |file|
  file.write(JSON.generate(parks))
end