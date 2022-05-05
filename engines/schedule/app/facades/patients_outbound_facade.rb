# Outbound Facade allowing Schedule to call Patients

class PatientsOutboundFacade < OutboundFacadeBase

  def get_all_patients
    external_system = get_facade(self.class.to_s)
    return external_system.run('PatientsQuery1')
  end
end
