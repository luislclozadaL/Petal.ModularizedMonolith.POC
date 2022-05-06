# Command Handler to destroy a Patient

class DestroyPatientCommand < CommandQueryHandlerBase

  def initialize(*params)
    @attributes = DestroyPatient.new(params[0]['id'])

    raise 'Patient ID is required' unless @attributes.patient_id
  end

  def run
    patient = ::Patients::Patient.find(@attributes.patient_id)
    patient.destroy
    return patient
  end
end
