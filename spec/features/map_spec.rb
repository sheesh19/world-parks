require 'rails_helper'

describe 'Users head to the main page and should...' do
    scenario 'see a world map' do
        visit root_path()

        expect(page).to have_css('div', id: "map" )
    end
end