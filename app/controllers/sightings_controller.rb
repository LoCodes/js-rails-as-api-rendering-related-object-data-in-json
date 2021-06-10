class SightingsController < ApplicationController

    def show
        sighting = Sighting.find_by(id: params[:id])
    
        #render json: sighting 
        #=> {"id":1,"bird_id":1,"location_id":2,"created_at":"2021-06-10T02:26:31.011Z","updated_at":"2021-06-10T02:26:31.011Z"}
        
        if sighting 
        #render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

        ## SAME AS 
            render json: sighting, include: [:bird, :location], except: [:updated_at]

            # render json: sighting.to_json(:include => {
            #     :bird => {:only => [:name, :species]},
            #     :location => {:only => [:latitude, :longitude]}
            #   }, :except => [:updated_at])

        # {
        #     "id": 2,
        #     "bird_id": 2,
        #     "location_id": 2,
        #     "created_at": "2019-05-14T11:20:37.228Z",
        #     "updated_at": "2019-05-14T11:20:37.228Z",
        #     "bird": {
        #       "id": 2,
        #       "name": "Grackle",
        #       "species": "Quiscalus Quiscula",
        #       "created_at": "2019-05-14T11:20:37.177Z",
        #       "updated_at": "2019-05-14T11:20:37.177Z"
        #     },
        #     "location": {
        #       "id": 2,
        #       "latitude": 30.26715,
        #       "longitude": -97.74306,
        #       "created_at": "2019-05-14T11:20:37.196Z",
        #       "updated_at": "2019-05-14T11:20:37.196Z"
        #     }
        #   }
        else 
            render json: { message: 'No string found with that id' }
        end 
    end

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end
end





