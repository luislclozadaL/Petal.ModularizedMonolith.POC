# Outbound Facade allowing Schedule to call Patients

class PatientsOutboundFacade < OutboundFacadeBase

  def get_all_patients
    external_system = get_facade(self.class.to_s)
    return external_system.run('PatientsQuery1', nil)
  end

  def get_patient_by_id(id)
    external_system = get_facade(self.class.to_s)
    params = { "id" => id }
    
    return external_system.run('PatientsQuery2', params)
  end
end
