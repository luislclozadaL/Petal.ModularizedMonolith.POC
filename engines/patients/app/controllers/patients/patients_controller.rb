module Patients
    class PatientsController < ApplicationController
        skip_before_action :verify_authenticity_token

        def index
            command = GetAllPatientsQuery.new
            patients = command.run
            render json: { data: patients }, status: :ok
        end

        def show
            command = GetPatientByIdQuery.new(params.to_enum.to_h)
            patient = command.run
            render json: { status: 'Patient Retrieved Successfully', message: 'Loaded patient', data: patient }, status: :ok
        end   
        
        def create
            command = CreatePatientCommand.new(params.to_enum.to_h)
            result = command.run

            if result.succeded
                render json: { status: 'Patient Saved Successfully', message: 'patient saved', data: result.object }, status: :ok
            else
                render json: { status: 'Error Saving Patient', message: 'patient not saved', data: result.object}, status: :unprocessable_entity
            end
        end

        def destroy
            patient = Patient.find(params[:id])
            patient.destroy
            render json: { status: 'Patient Deleted Successfully', message: 'patient delete', data: patient }, status: :ok
        end

        def update 
            patient = Patient.find(params[:id])
            patient.revision = article.revision + 1
            if patient.update_attributes(update_article_valid_params)
                render json: { status: 'Patient Updated Successfully', message: 'patient updated', data: patient }, status: :ok
            else
                render json: { status: 'Error Updating Patient', message: 'patient not updated', data: patient.errors}, status: :unprocessable_entity
            end
            
        end

        private def patient_params 
            params.permit(:first_name, :last_name, :hin, :active)
        end

        private def update_patient_valid_params
            params.permit(:header)
        end
        
    end
end
