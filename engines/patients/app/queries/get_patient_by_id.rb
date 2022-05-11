# CommandQuery to get a patient by id (Attributes)
  class GetPatientById < CommandQueryBase

    def initialize(patient_id)
      @patient_id = patient_id
    end

    def patient_id
      @patient_id
    end
  end
  