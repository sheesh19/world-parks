class ParksController < ApplicationController

    def index
        @parks = Park.all

        @markers = @parks.geocoded.map do |park|
            {
                lat: park.latitude,
                lng: park.longitude,
                infoWindow: render_to_string(partial: "park_window", locals: { park: park }),
                image_url: helpers.asset_url('tree.png')
            }
        end
    end
end
