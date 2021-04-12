require 'open-uri'
require 'json'

african_parks_file = File.join(__dir__, 'data/african_parks.json')
require_relative "seeds/african_seed.rb"