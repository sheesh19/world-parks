# AFRICA NATIONAL PARKS

url = "https://en.wikipedia.org/wiki/List_of_national_parks_in_Africa"
african_parks_file = File.join(__dir__, 'data/african_parks.json')

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)


parks_hashes = html_doc.search('.wikitable > tbody > tr')[1..-1].map do |row|
    park_name = row.children[1].text
    puts park_name 
    { name: park_name }
end


parks = { parks: parks_hashes }

File.open(african_parks_file, 'wb') do |file|
  file.write(JSON.generate(parks))
end