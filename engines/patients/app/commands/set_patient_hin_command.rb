# Command Handler to set hin for patient, Returns an object type CommandQueryHandlerResult

class SetPatientHinCommand < CommandQueryHandlerBase

  def initialize(*params)
    @attributes = SetPatientHin.new(params[0]['id'], params[0]['hin'])

    raise 'Patient ID is required' unless @attributes.patient_id
    raise 'Patient hin is required' unless @attributes.hin
  end

  def run
    patient = ::Patients::Patient.find(@attributes.patient_id)
    if patient.update(hin:@attributes.hin)
      return CommandQueryHandlerResult.new(true, patient)
    else
      return CommandQueryHandlerResult.new(false, patient.errors)
    end
  end
end
