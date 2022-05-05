module Schedule
    class AvailabilitiesController < ApplicationController 

        def index
            patients_facade = PatientsOutboundFacade.new
            all_patients = patients_facade.get_all_patients()
            puts "patients #{all_patients.count}"
            availabilities = Availability.order('Created_at DESC');
            render json: { data: availabilities }, status: :ok
        end

    end
end