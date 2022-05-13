# CommandQuery to get a patient by id (Attributes)
  class GetPatientByIdQuery < CommandQueryBase

    def initialize(patient_id)
      @patient_id = patient_id
    end

    def patient_id
      @patient_id
    end
  end
  