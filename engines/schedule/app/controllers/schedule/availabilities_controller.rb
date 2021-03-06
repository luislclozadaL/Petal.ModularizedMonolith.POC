module Schedule
    class AvailabilitiesController < ApplicationController 

        def index
            query = GetAvailabilitiesQueryHandler.new
            availabilities = query.invoke
            render json: { data: availabilities }, status: :ok

        end
        
        def show
            command = DoSomethingCommandHandler.new(params.to_enum.to_h)

            result = command.invoke()

            render json: { data: result }, status: :ok
        end 
    end
end