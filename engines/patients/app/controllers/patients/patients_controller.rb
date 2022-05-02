module Patients
    class PatientsController < ApplicationController

        def index
            patients = Patient.order('created_at DESC');
            render json: { data: patients }, status: :ok
        end

        def show
            patient = Patient.find(params[:id]);
            render json: { status: 'Patient Retrieved Successfully', message: 'Loaded patient', data: patient }, status: :ok
        end   
        
        def create
            patient = Patient.new(article_params)
            if patient.save
                render json: { status: 'Patient Saved Successfully', message: 'patient saved', data: patient }, status: :ok
            else
                render json: { status: 'Error Saving Patient', message: 'patient not saved', data: patient.errors}, status: :unprocessable_entity
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
            params.permit(:header, :body, :revision)
        end

        private def update_patient_valid_params
            params.permit(:header)
        end
        
    end
end
