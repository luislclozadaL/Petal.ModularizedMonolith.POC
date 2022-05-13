# Query to get a petient by id    

class GetPatientByIdQueryHandler < CommandQueryHandlerBase

  def initialize(*params)
    @attributes = GetPatientByIdQuery.new(params[0]['id'])
    
    raise 'Patient ID value is required' unless @attributes.patient_id
  end

  def run
    patient = Patients::Patient.find_by(id: @attributes.patient_id);
    return patient
  end
end
