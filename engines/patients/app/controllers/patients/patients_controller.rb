module Patients
    class PatientsController < ApplicationController
        skip_before_action :verify_authenticity_token

        def index
            command = GetAllPatientsQueryHandler.new
            patients = command.invoke
            render json: { data: patients }, status: :ok
        end

        def show
            command = GetPatientByIdQueryHandler.new(params.to_enum.to_h)
            patient = command.invoke
            render json: { status: 'Patient Retrieved Successfully', message: 'Loaded patient', data: patient }, status: :ok
        end   
        
        def create
            command = CreatePatientCommandHandler.new(params.to_enum.to_h)
            result = command.invoke

            if result.succeded
                render json: { status: 'Patient Saved Successfully', message: 'patient saved', data: result.object }, status: :ok
            else
                render json: { status: 'Error Saving Patient', message: 'patient not saved', data: result.object}, status: :unprocessable_entity
            end
        end

        def destroy
            command = DestroyPatientCommandHandler.new(params.to_enum.to_h)
            patient = command.invoke
            render json: { status: 'Patient Deleted Successfully', message: 'patient delete', data: patient }, status: :ok
        end

        def update
            command = SetPatientHinCommandHandler.new(params.to_enum.to_h)
            result = command.invoke

            if result.succeded
                render json: { status: 'Patient Updated Successfully', message: 'patient updated', data: result.object }, status: :ok
            else
                render json: { status: 'Error Updating Patient', message: 'patient not updated', data: result.object}, status: :unprocessable_entity
            end
        end        
    end
end
