module Schedule
    class AvailabilitiesController < ApplicationController 

        def index
            availabilities = Availability.order('Created_at DESC');
            render json: { data: availabilities }, status: :ok
        end

    end
end